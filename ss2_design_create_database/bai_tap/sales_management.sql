drop database sales_management;
create database if not exists sales_management;
use sales_management;

create table customer(
id int primary key auto_increment,
`name` varchar(50),
age int 
);

create table `order`(
id int primary key auto_increment,
`date` date,
total_price float,
id_customer int,
foreign key(id_customer) references customer(id)
);

create table product(
id int primary key auto_increment,
`name` varchar(50),
price float
);

create table order_detail(
id_order int,
id_product int,
primary key(id_order, id_product),
foreign key(id_order) references `order`(id),
foreign key(id_product) references product(id),
quantily int
);