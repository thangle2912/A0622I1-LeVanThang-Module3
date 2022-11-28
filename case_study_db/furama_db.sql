create database furama_db;
use furama_db;
create table `position`(
	p_id int auto_increment primary key,
	p_name varchar(45)
);
create table `level`(
	lv_id int auto_increment primary key,
	lv_name varchar(45)
);
create table department(
	dp_id int auto_increment primary key,
	dp_name varchar(45)
);
create table employee(
	e_id int auto_increment primary key,
	e_name varchar(45),
	e_birthday date,
	e_card_id varchar(45),
	e_salary double,
	e_phone_number varchar(45),
	e_email varchar(45),
	e_address varchar(45),
	p_id int NOT NULL,
	lv_id int not null,
    dp_id int not null,
    foreign key (p_id) references `position`(p_id),
    foreign key (lv_id) references `level`(lv_id),
    foreign key (dp_id) references department(dp_id)
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
    c_card_id varchar(45),
    c_phone_number varchar(45),
    c_email varchar(45),
    c_address varchar(45),
    foreign key(ct_id) references customer_type(ct_id)
);

create table service_type(
	st_id int primary key auto_increment,
    st_name varchar(45)
);
create table rental_type(
	rt_id int primary key auto_increment,
    rt_name varchar(45)
);
create table service(
	s_id int primary key auto_increment,
    s_name varchar(45),
    s_area int,
    s_rental_cost double,
    s_max_people int,
	s_room_standard varchar(45),
	s_description_other varchar(45),
    s_pool_area float,
    s_floors int,
    s_free_service text,
    rt_id int,
    st_id int,
    foreign key(rt_id) references rental_type(rt_id),
    foreign key(st_id) references service_type(st_id)
);

create table contract(
	cont_id int primary key auto_increment,
    cont_date_start datetime,
    cont_date_end datetime,
    cont_deposits double,
    e_id int,
    c_id int,
    s_id int,
    foreign key(e_id) references employee(e_id),
    foreign key(c_id) references customer(c_id),
    foreign key(s_id) references service(s_id)
);
create table accompany_service(
	as_id int primary key auto_increment,
    as_name varchar(45),
    as_price double,
    as_unit varchar(45),
    as_status varchar(45)
);
create table contract_detail(
	cd_id int primary key auto_increment,
    quantity int,
    cont_id int,
    as_id int,
    foreign key(cont_id) references contract(cont_id),
    foreign key(as_id) references accompany_service(as_id)
);