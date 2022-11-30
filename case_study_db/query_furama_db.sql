use furama_db;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự

select * from employee where (e_name like 'H%' 
							or e_name like 'T%' 
							or e_name like 'K%') and char_length(e_name) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from customer 
where ((year(curdate()) - year(c_birthday)) between 18 and 50) and (c_address like '%Đà Nẵng' or c_address like '%Quảng Trị');


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng 
-- của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select c.*,ct.ct_name, count(c.c_id) as times from customer c
join contract cont on cont.c_id = c.c_id
join customer_type ct on c.ct_id = ct.ct_id
where ct.ct_name like '%Diamond%'
group by c.c_id
order by times desc;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, 
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select c.c_id, c.c_name, ct.ct_name,cont.cont_id,s.s_name, cont.cont_date_start, cont.cont_date_end,sum(s.s_rental_cost+ifnull(`as`.as_price*cd.quantity,0)) as total_price from customer c
left join customer_type ct on ct.ct_id = c.ct_id
left join contract cont on cont.c_id = c.c_id
left join service s on s.s_id = cont.s_id
left join contract_detail cd on cd.cont_id = cont.cont_id 
left join accompany_service `as` on `as`.as_id = cd.as_id
group by cont.cont_id;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt 
-- từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select s.s_id,s.s_name,s.s_area,s_rental_cost,st.st_name from service s
join service_type st on st.st_id = s.st_id
join contract cont on s.s_id = cont.s_id
group by s.s_id having s.s_id not in (
select s.s_id from service s
join contract cont on cont.s_id = s.s_id
where (month(cont.cont_date_start)) in (1,2,3) and year(cont.cont_date_start) = 2021
);


-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select s.s_id,s.s_name,s.s_area,s.s_max_people,s.s_rental_cost, st.st_name from service s
join service_type st on s.st_id = st.st_id
join contract cont on s.s_id = cont.s_id
where year(cont.cont_date_start) = 2020
group by s.s_id 
having s.s_id not in(
select s.s_id from service s
join contract cont on s.s_id = cont.s_id
where year(cont.cont_date_start)= 2021
);


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1 :
select c.c_name from customer c 
group by c.c_name;
-- cách 2 :
select distinct c_name from customer;
-- cách 3 : 


-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu 
-- khách hàng thực hiện đặt phòng.

select month(cont.cont_date_start) , count(month(cont.cont_date_start)) as customers from contract cont
where year(cont_date_start) = 2021
group by month(cont.cont_date_start)
order by month(cont.cont_date_start);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select cont.cont_id,cont.cont_date_start,cont.cont_date_end,cont.cont_deposits, ifnull(sum(cd.quantity),0) as number_of_services_included from contract cont
left join contract_detail cd on cont.cont_id = cd.cont_id
left join accompany_service `as` on `as`.as_id = cd.as_id
group by cont.cont_id;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select `as`.as_id,`as`.as_name from  accompany_service `as` 
join contract_detail cd on cd.as_id = `as`.as_id
join contract cont on cd.cont_id = cont.cont_id
join customer c on c.c_id = cont.c_id
join customer_type ct on ct.ct_id = c.ct_id
where ct.ct_name = 'Diamond' and c.c_address like '% Vinh' or c.c_address like '% Quảng Ngãi';


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select cont.cont_id,e.e_name,c.c_name,c.c_phone_number,s.s_name,ifnull(sum(cd.quantity),0),cont.cont_deposits from service s
join contract cont on cont.s_id = s.s_id
join employee e on cont.e_id = e.e_id
join customer c on cont.c_id = c.c_id
left join contract_detail cd on cont.cont_id = cd.cont_id
where month(cont.cont_date_start) in (10,11,12) and year(cont.cont_date_start) = 2020
group by cont.cont_id
having cont.cont_id not in(
select cont.cont_date_start from contract cont 
where month(cont.cont_date_start) in(1,2,3,4,5,6) and year(cont.cont_date_start) = 2021
);

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select `as`.*, sum(cd.quantity) as Quantity from accompany_service `as`
left join contract_detail cd on cd.as_id = `as`.as_id
left join contract cont on cont.cont_id =cd.cont_id
group by `as`.as_id
having sum(cd.quantity) >= all(
select sum(cd.quantity) from accompany_service `as`
join contract_detail cd on cd.as_id = `as`.as_id
group by `as`.as_id
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select cont.cont_id,s.s_name,`as`.as_name, count(`as`.as_id) as times from contract cont
join contract_detail cd on cd.cont_id = cont.cont_id
join accompany_service `as` on `as`.as_id = cd.as_id
join service s on s.s_id = cont.s_id
group by `as`.as_id
having times =1
order by cont.cont_id asc;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select e.e_id,e.e_name,lv.lv_name,dp.dp_name,e.e_phone_number,e.e_address from employee e
join `level` lv on e.lv_id = lv.lv_id
join department dp on e.dp_id= dp.dp_id 
left join contract cont on e.e_id = cont.e_id
where year(cont.cont_date_start) between 2020 and 2021
group by e.e_id
having count(cont.e_id)<=3;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- thay select bằng delete employee 
select e.e_id, e.e_name from employee e
where e.e_id not in (
select e.e_id from employee e
join contract cont on cont.e_id = e.e_id
where year(cont.cont_date_start) in(2019,2020,2021)
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là 
-- lớn hơn 10.000.000 VNĐ.

-- update table_name set .... where condition(sửa record thành 1tr mới giống kết quả excel)
select * from customer_type;

-- update customer c set c.ct_id=1 
-- where(
-- select * from customer c 
-- join customer_type ct on ct.ct_id = c.ct_id
-- join contract cont on cont.c_id = c.c_id
-- join contract_detail cd on cd.cont_id = cont.cont_id
-- join accompany_service `as` on `as`.as_id = cd.as_id
-- join service s on s.s_id = cont.s_id
-- where ct.ct_name like '%Platinium%' and ((`as`.as_price*cd.quantity)+s.s_rental_cost) > 1000000 
-- 									and year(cont.cont_date_start) = 2021
-- group by c.c_id); 

select c.c_id, c.c_name, ct.ct_name from customer c 
join customer_type ct on ct.ct_id = c.ct_id
join contract cont on cont.c_id = c.c_id
join contract_detail cd on cd.cont_id = cont.cont_id
join accompany_service `as` on `as`.as_id = cd.as_id
join service s on s.s_id = cont.s_id
where ct.ct_name like '%Platinium%' and ((`as`.as_price*cd.quantity)+s.s_rental_cost) > 1000000 
									and year(cont.cont_date_start) = 2021
group by c.c_id;


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

select c.c_id, c.c_name from customer c
join contract cont on cont.c_id = c.c_id
where year(cont.cont_date_start) <2021
group by c.c_id;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

select `as`.as_id,`as`.as_name from accompany_service `as`
join contract_detail cd on cd.as_id = `as`.as_id
join contract cont on cd.cont_id = cont.cont_id
where year(cont.cont_date_start) = 2020
group by `as`.as_id
having sum(cd.as_id)>10;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select e.e_id,e.e_name,e.e_email,e.e_phone_number,e_birthday,e.e_address from employee e
union
select c.c_id,c.c_name,c_email,c.c_phone_number,c.c_birthday,c.c_address from customer c
