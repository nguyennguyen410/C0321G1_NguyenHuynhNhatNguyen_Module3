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
ototalprice double not null check(ototalprice>0),
foreign key (cid) references customer(cid)
);

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



