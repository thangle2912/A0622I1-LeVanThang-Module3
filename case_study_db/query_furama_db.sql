use furama_db;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự

select * from employee where (e_name like 'H%' 
							or e_name like 'T%' 
							or e_name like 'K%') and char_length(e_name) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select * from customer 
where ((year(curdate()) - year(c_birthday)) between 18 and 50) and (c_address like '%Đà Nẵng' or c_address like '%Quảng Trị');
