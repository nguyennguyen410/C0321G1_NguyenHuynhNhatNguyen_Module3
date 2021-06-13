create database quanlybanhang;
use quanlybanhang;
create table customer(
cid int not null primary key,
cname varchar(50),
cage int not null
);

create table order1(
oid int not null primary key,
cid int not null,
odate datetime,
ototalprice double check(ototalprice>0),
foreign key (cid) references customer(cid)
);

alter table order1
modify column ototalprice double; 

create table product(
pid int not null primary key,
pname varchar(50),
pprice double not null
);

create table orderdetail(
oid int not null,
pid int not null,
odqty int not null,
primary key (oid, pid),
foreign key (pid) references product(pid),
foreign key (oid) references order1(oid)
);

use quanlybanhang;
insert into customer
values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into order1(oid, cid, odate)
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
select oid, odate, ototalprice from order1;

/*Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/
select cname, pname
from customer c
join order1 o on c.cid = o.cid
join orderdetail on o.oid = orderdetail.oid
join product p on p.pid = orderdetail.pid;

/*Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/
select *
from customer
where not exists(select *
from customer c
join order1 o on c.cid = o.cid);





