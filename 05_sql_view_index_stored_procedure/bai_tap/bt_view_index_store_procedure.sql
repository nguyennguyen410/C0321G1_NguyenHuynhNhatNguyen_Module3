-- Bước 1: Tạo cơ sở dữ liệu demo
create database demo;
use demo;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table Product (
id int auto_increment primary key,
product_code varchar(55) not null,
product_name varchar(55) not null,
product_price int not null,
product_amount int not null,
product_description text,
product_status bit
);

insert into product(product_code, product_name, product_price, product_amount, product_description, product_status)
values
('a', 'car', 500, 5, 'toyota', 1),
('m', 'motor', 100, 7, 'kawasaki', 1),
('b', 'bike', 20, 4, 'LK', 0),
('a1', 'car1', 700, 5, 'hyundai', 1),
('m1', 'motor1', 200, 10, 'ducati', 1),
('b1', 'bike1', 10, 20,'phoenix', 1);

-- Bước 3:Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

explain select * from Product where product_code = 'a';
create unique index index_product on product(product_code);
select * from Product where product_code = 'a';
explain select * from Product where product_code = 'a';

explain select * from Product where Product_name = 'car' or product_price = 700;
create unique index index_product_composite on product(product_name, product_price);
explain select * from Product where Product_name = 'car' or product_price = 700;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

create view product_view as 
select product_code, product_name, product_price, product_status
from Product;
select * from product_view;

create or replace view product_view as
select product_code, product_name, product_price, product_status, product_amount
from product;
select * from product_view;

insert into product_view
values
('a2', 'car2', 400, 0, 6);

update product_view
set product_name = 'car3'
where product_name = 'car2';

drop view product_view;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //
CREATE PROCEDURE showProduct()
BEGIN
  SELECT * FROM Product;
END //
DELIMITER ;
call showProduct();

DELIMITER //
CREATE PROCEDURE insertProduct()
BEGIN
  insert into Product(product_code, product_name, product_price, product_amount, product_description, product_status)
  values
  ('b3', 'bike3', 10, 20,'phoenix3', 1);
END //
call insertProduct();

DELIMITER //
CREATE PROCEDURE editProduct(in idEdit int)
BEGIN
  update Product
  set product_name = 'editName'
  where id = idEdit;
END //
call editProduct(7);

DELIMITER //
CREATE PROCEDURE deleteProduct(in idEdit int)
BEGIN
  delete from Product
  where id = idEdit;
END //
call deleteProduct(2);
