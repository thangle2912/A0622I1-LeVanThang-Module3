create database furama_case_study;
use furama_case_study;

create table `role`(
	r_id int auto_increment primary key,
    r_name varchar(255)
);

create table `user`(
	username varchar(255) primary key,
	`password` varchar(255)
);

create table user_role(
	r_id int,
	username varchar(255),
	primary key(r_id,username),
    foreign key(r_id) references `role`(r_id),
    foreign key(username) references `user`(username)
    
);

create table `position`(
	p_id int auto_increment primary key,
	p_name varchar(45)
);
create table education_degree(
	ed_id int auto_increment primary key,
	ed_name varchar(45)
);
create table division(
	d_id int auto_increment primary key,
	d_name varchar(45)
);
create table employee(
	e_id int auto_increment primary key,
	e_name varchar(45),
	e_birthday date,
	e_id_card varchar(45),
	e_salary double,
	e_phone_number varchar(45),
	e_email varchar(45),
	e_address varchar(45),
	position_id int NOT NULL,
	education_degree_id int not null,
    division_id int not null,
    username varchar(45) not null,
    foreign key (username) references `user`(username),
    foreign key (position_id) references `position`(p_id),
    foreign key (education_degree_id) references education_degree(ed_id),
    foreign key (division_id) references division(d_id)
);
create table customer_type(
	ct_id int primary key auto_increment,
    ct_name varchar(45) 
);
create table customer(
	c_id int primary key auto_increment,
	ct_id int not null,
    c_name varchar(45),
    c_birthday date,
    c_gender bit default 1,
    c_id_card varchar(45),
    c_phone_number varchar(45),
    c_email varchar(45),
    c_address varchar(45),
    foreign key(ct_id) references customer_type(ct_id)
);

create table facility_type(
	ft_id int primary key auto_increment,
    ft_name varchar(45)
);
create table rental_type(
	rt_id int primary key auto_increment,
    rt_name varchar(45)
);
create table facility(
	f_id int primary key auto_increment,
    f_name varchar(45),
    f_area int,
    f_cost double,
	f_max_people int,
	f_standard_room varchar(45),
	f_description_other_convenience varchar(45),
    f_pool_area float,
    f_floors int,
    f_facility_free text,
    rt_id int,
    ft_id int,
    foreign key(rt_id) references rental_type(rt_id),
    foreign key(ft_id) references facility_type(ft_id)
);

create table contract(
	cont_id int primary key auto_increment,
    cont_date_start datetime,
    cont_date_end datetime,
    cont_deposit double,
    e_id int,
    c_id int,
    f_id int,
    foreign key(e_id) references employee(e_id),
    foreign key(c_id) references customer(c_id),
    foreign key(f_id) references facility(f_id)
);
create table attach_facility(
	af_id int primary key auto_increment,
    af_name varchar(45),
    af_cost double,
    af_unit varchar(45),
    af_status varchar(45)
);
create table contract_detail(
	cd_id int primary key auto_increment,
    quantity int,
    cont_id int,
    af_id int,
    foreign key(cont_id) references contract(cont_id),
    foreign key(af_id) references attach_facility(af_id)
);