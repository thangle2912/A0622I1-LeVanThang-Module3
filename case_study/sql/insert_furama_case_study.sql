use furama_case_study ;

insert into `position` (p_name)
values ('Lễ tân'),
		('Phục vụ'),
		('Chuyên viên'),
		('Giám sátn'),
		('Quản lý'),
		('Giám đốc');
insert into education_degree (ed_name)
values ('Trung Cấp'),
		('Cao Đẳng'),
		('Đại Học'),
		('Sau Đại Học');
insert into division (d_name)
values ('Sale-Marketing'),
		('Hành Chính'),
		('Phục Vụ'),
		('Quản Lý');
insert into `role` (r_name)
values ('Admin'),
		('User');
insert into `user` (username,`password`)
values ('thangleAdmin','12345'),
		('thangleUser','12345');
insert into user_role (r_id,username)
values (1,'thangleAdmin'),
		(2,'thangleUser');
        
        
select * from `employee`;
insert into employee (e_name,e_birthday,e_id_card,e_salary,e_phone_number,e_email,e_address,position_id,education_degree_id,division_id,username)
values ('Nguyễn Văn An'			,'1970-11-07' ,'456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1,'thangleAdmin'),
		('Lê Văn Bình'			,'1997-04-09' ,'654231234',7000000 ,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2,'thangleAdmin'),
		('Hồ Thị Yến'			,'1995-12-12' ,'999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2,'thangleAdmin'),
		('Võ Công Toản'		,'1980-04-04' ,'123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4,'thangleUser'),
		('Nguyễn Bỉnh Phát'	,'1999-12-09' ,'454363232',6000000 ,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1,'thangleUser'),
		('Khúc Nguyễn An Nghi','2000-11-08' ,'964542311',7000000 ,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3,'thangleUser');


insert into customer_type(ct_name)
values('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

insert into customer(ct_id,c_name,c_birthday,c_gender,c_id_card,c_phone_number,c_email,c_address)
values	(5,'Nguyễn Thị Hào'	,'1970-11-07'	,0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
		(3,'Phạm Xuân Diệu'	,'1992-08-08'	,1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
		(1,'Trương Đình Nghệ','1990-02-27'	,1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
		(1,'Dương Văn Quan'	,'1981-07-08'	,1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
		(4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai');

insert into rental_type(rt_name)
values('year'),('month'),('day'),('hour');

insert into facility_type(ft_name)
values('Villa'),('House'),('Room');

insert into facility(f_name,f_area,f_cost,f_max_people,f_standard_room,f_description_other_convenience,f_pool_area,f_floors,f_facility_free,rt_id,ft_id)
values	('Villa Beach Front',25000,1000000	,10,'vip','có hồ bơi',		500,4,null,3,1),
		('House Princess 01',14000,5000000	,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
		('Room Twin 01'		,5000,1000000	,2,'normal','Có tivi',		null,null,'1 Xe máy, 1 Xe đạp',4,3),
		('Villa No Beach Front',22000,9000000,8,'normal','có hồ bơi',	300,3,null,3,1),
		('House Princess 02',10000,4000000	,5,'normal','Có thêm bếp nướng',null,2,null,3,2),
		('Room Twin 02'		,3000,900000	,2,'normal','Có tivi',		null,null,'1 Xe máy',4,3);
insert into attach_facility(af_name, af_cost,af_unit,af_status)
values('Karaoke',10000,'giờ','tiện nghi, hiện tại'),
		('Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
		('Thuê xe đạp',20000,'chiếc','tốt'),
		('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

insert into contract(cont_date_start,cont_date_end,cont_deposit,e_id,c_id,f_id)
values	('2020-12-08','2020-12-08',0,3,1,3),
		('2020-07-14','2020-07-21',200000,3,3,1),
		('2021-03-15','2021-03-17',50000,3,4,2),
		('2021-01-14','2021-01-18',100000,1,5,5);

insert into contract_detail(quantity,cont_id,af_id)
values	(2,25,3),
		(2,25,6),
		(2,27,4),
		(3,28,1),
		(3,26,4),
		(11,25,5),
		(1,25,2),
		(12,26,3);
        
select * from contract c
join contract_detail cd on c.cont_id = cd.cont_id;
        