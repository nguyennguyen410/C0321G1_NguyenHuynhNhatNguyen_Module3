create database quanlybanhang;
use quanlybanhang;
create table customer(
customer_id int not null primary key,
customer_name varchar(50),
customer_age int not null
);

create table order1(
order_id int not null primary key,
customer_id int not null,
order_date datetime,
order_totalprice double check(order_totalprice>0),
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int not null primary key,
product_name varchar(50),
product_price double not null
);

create table orderdetail(
order_id int not null,
product_id int not null,
orderdetail_qty int not null,
primary key (order_id, product_id),
foreign key (product_id) references product(product_id),
foreign key (order_id) references order1(order_id)
);

insert into customer
values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into order1(order_id, customer_id, order_date)
values
(1, 1, '2006-03-21'),
(2, 2, '2006-03-23'),
(3, 1, '2006-03-16');

insert into product
values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'bep Dien', 2);

insert into orderdetail
values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);


/*Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order*/
select order_id, order_date, order_totalprice from order1;

/*Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/
select customer_name, product_name
from customer c
join order1 o on c.customer_id = o.customer_id
join orderdetail on o.order_id = orderdetail.order_id
join product p on p.product_id = orderdetail.product_id;

use quanlybanhang;
/*Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/
select customer.customer_id, customer.customer_name 
from customer
left join order1 on customer.customer_id = order1.customer_id
where order1.customer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice
use quanlybanhang;
select o1.order_id, o1.order_date,  p.product_price*o.orderdetail_qty as total
from orderdetail o
inner join order1 o1 on o.order_id = o1.order_id
inner join product p on p.product_id = o.product_id;

 





