create database furama_resort_for_jsp_servlet;

create table customer_type(
customer_type_id int primary key,
customer_type_name varchar(45)
);
insert into customer_type
values
(1, 'silver'),
(2, 'gold'),
(3, 'platinium'),
(4, 'diamond');

create table customer(
customer_id varchar(45) primary key,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
foreign key (customer_type_id) references customer_type(customer_type_id) on update cascade on delete cascade
);

create table service_type(
service_type_id int primary key,
service_type_name varchar(45)
);
insert into service_type
values
(1, 'villa'),
(2, 'house'),
(3, 'room');

create table rent_type(
rent_type_id int primary key,
rent_type_name varchar(45),
rent_type_cost double
);
insert into rent_type
values
(1, 'year', 30000000),
(2, 'month', 3500000),
(3, 'day', 4000000),
(4, 'hour', 500000);


create table service(
service_id varchar(45) primary key,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
foreign key (rent_type_id) references rent_type(rent_type_id) on update cascade on delete cascade,
foreign key (service_type_id) references service_type(service_type_id) on update cascade on delete cascade
);

create table role(
role_id int primary key,
role_name varchar(255)
);

create table user(
username varchar(255) primary key,
`password` varchar(255)
);
insert into user
value
('userha','123456');

insert into user
value
('userha1','123456');


create table user_role(
role_id int,
username varchar(255),
foreign key (role_id) references role(role_id) on update cascade on delete cascade,
foreign key (username) references user(username) on update cascade on delete cascade
);

create table `position`(
position_id int primary key,
position_name varchar(45)
);
insert into `position`
value
(1,'Le tan'),
(2,'Phuc vu'),
(3,'Giam sat'),
(4,'Chuyen vien'),
(5,'Quan ly'),
(6,'Giam doc');

create table education_degree(
education_degree_id int primary key,
education_degree_name varchar(45)
);
insert into education_degree
value
(1,'Trung cap'),
(2,'Cao dang'),
(3,'Dai hoc'),
(4,'Sau dai hoc');

create table division(
division_id int primary key,
division_name varchar(45)
);
insert into division
value
(1,'Sale-marketing'),
(2,'Hanh chinh'),
(3,'Phuc vu'),
(4,'Quan ly');

create table employee(
employee_id int primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references `position`(position_id) on update cascade on delete cascade,
foreign key (education_degree_id) references education_degree(education_degree_id) on update cascade on delete cascade,
foreign key (division_id) references division(division_id) on update cascade on delete cascade,
foreign key (username) references user(username) on update cascade on delete cascade
);

create table attach_service(
attach_service_id int primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);

insert into attach_service
values
(1, 'massage', '1000000', 1, 'hoat dong'),
(2, 'karaoke', '5000000', 1, 'hoat dong'),
(3, 'thue xe', '2000000', 1, 'hoat dong');

create table contract(
contract_id int primary key,
contract_start_day datetime,
contract_end_day datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id varchar(45),
service_id varchar(45),
foreign key (employee_id) references employee(employee_id) on update cascade on delete cascade,
foreign key (customer_id) references customer(customer_id) on update cascade on delete cascade,
foreign key (service_id) references service(service_id) on update cascade on delete cascade
);

create table contract_detail(
contract_detail_id int primary key,
contract_id int,
attach_service_id int,
quantity int,
foreign key (contract_id) references contract(contract_id) on update cascade on delete cascade,
foreign key (attach_service_id) references attach_service(attach_service_id) on update cascade on delete cascade
);