create database ss5_demo;
use ss5_demo;

create table products(
id int primary key auto_increment,
p_code varchar(45),
p_name varchar(45),
p_price float,
p_amount int,
p_description varchar(45),
p_status bit
);

insert into products(p_code,p_name,p_price,p_amount,p_description, p_status)
values ('Asus','Asus FAX409',10999000,45,'new' ,0),
		('MSI','MSI T1',17999000,45,'new' ,1),
		('Lenovo','Lenovo T5',14999000,60,'new',0),
        ('Dell','Dell xx',12000000,70,'old',1);
        
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_p_code on products(p_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_p_name_price on product(p_name,p_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where p_code = 'Dell';

-- So sánh câu truy vấn trước và sau khi tạo index

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products as
select p_code,p_name,p_price,p_status from products;

select * from  v_products;

-- Tiến hành sửa đổi view
update v_products set p_price = 12599000 where p_code = 'Asus';

-- Tiến hành xoá view
drop view v_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_show_product()
begin
select * from products;
end//
delimiter ;

call sp_show_product();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product(IN p_code varchar(45), p_name varchar(45), p_price float, p_amount int, p_description varchar(45),p_status bit)
begin
insert into products(p_code,p_name,p_price,p_amount,p_description,p_status)
values (p_code,p_name,p_price,p_amount,p_description,p_status);
end //
delimiter ;

call sp_add_product('SamSung','SamSung A51', 12312312,60,'new',0);
select * from products;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_edit_product_by_id(IN id_edit int, pcode varchar(45), pname varchar(45), pprice float, pamount int, pdescription varchar(45),pstatus bit)
begin
update products set
p_code = pcode,
p_name = pname,
p_price = pprice,
p_amount = pamount,
p_description = pdescription,
p_status = pstatus
where id = id_edit ;
end//
delimiter ;


-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product_by_id(IN id_delete int)
begin
delete from products where id =  id_delete;
end//
delimiter ;