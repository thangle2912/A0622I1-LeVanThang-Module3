use sales_management;

insert into customer (`name`,age)
values ('Minh Quan',10),
		('Ngoc Oanh',20),
        ('Hong Ha',50);
select * from customer;
insert into `order`(id_customer,date)
values (1,'2006-3-20'),
		(2,'2006-3-26'),
        (1,'2006-3-16');
        select * from `order`;
insert into product(`name`,price)
values ('May Giat',3),
		('Tu Lanh',5),
		('Dieu Hoa',7),
		('Quat',1),
        ('Bep Dien',2);
        select * from product;
insert into order_detail(id_order,id_product,quantily)
values (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
        
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select id,`date`,total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.`name`, p.`name` from customer c
join `order` o on c.id =  o.id_customer
join order_detail od on od.id_order = o.id
join product p on p.id = od.id_product;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.`name` from customer c
where c.id not in (select id_customer from `order`);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn Giá bán của từng loại được tính = odQTY*pPrice)

select o.id,o.`date`,sum(p.price * od.quantily) as oTotalPrice from `order` o
join order_detail od on o.id = od.id_order 
join product p on od.id_product = p.id
group by o.id;