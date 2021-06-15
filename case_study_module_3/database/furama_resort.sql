create database furama_resort;
use furama_resort;

create table KieuThue(
id_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);

create table LoaiDichVu(
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

create table DichVu(
id_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key (id_kieu_thue) references KieuThue(id_kieu_thue) on update cascade on delete cascade,
foreign key (id_loai_dich_vu) references LoaiDichVu (id_loai_dich_vu) on update cascade on delete cascade
);

create table DichVuDiKem(
id_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table LoaiKhach(
id_loai_khach int primary key,
ten_loai_khach varchar(45)
);

create table KhachHang(
id_khach_hang int primary key,
id_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
so_cmtnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references LoaiKhach(id_loai_khach) on update cascade on delete cascade
);

create table ViTri(
id_vi_tri int primary key,
ten_vi_tri varchar(45)
);

create table TrinhDo(
id_trinh_do int primary key,
trinh_do varchar(45)
);

create table BoPhan(
id_bo_phan int primary key,
ten_bo_phan varchar(45)
);

create table NhanVien(
id_nhan_vien int primary key,
ho_ten varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date,
so_cmtnd varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_vi_tri) references ViTri(id_vi_tri) on update cascade on delete cascade,
foreign key (id_trinh_do) references TrinhDo(id_trinh_do) on update cascade on delete cascade,
foreign key (id_bo_phan) references BoPhan(id_bo_phan) on update cascade on delete cascade
);

create table HopDong(
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
foreign key (id_nhan_vien) references NhanVien(id_nhan_vien) on update cascade on delete cascade,
foreign key (id_khach_hang) references KhachHang(id_khach_hang) on update cascade on delete cascade,
foreign key (id_dich_vu) references DichVu(id_dich_vu) on update cascade on delete cascade
);

create table HopDongChiTiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_hop_dong) references HopDong(id_hop_dong) on update cascade on delete cascade,
foreign key (id_dich_vu_di_kem) references DichVuDiKem(id_dich_vu_di_kem) on update cascade on delete cascade
);

-- Task 1
insert into BoPhan (id_bo_phan, ten_bo_phan)
values 
(1, 'sale-marketing'),
(2, 'hanh chinh'),
(3, 'phuc vu'),
(4, 'quan ly');
select * from Bophan;

insert into ViTri (id_vi_tri, ten_vi_tri)
values 
(1, 'le tan'),
(2, 'phuc vu'),
(3, 'chuyen vien'),
(4, 'giam sat'),
(5, 'quan ly'),
(6, 'giam doc');
select * from ViTri;

insert into TrinhDo (id_trinh_do, trinh_do)
values 
(1, 'trung cap'),
(2, 'cao dang'),
(3, 'dai hoc'),
(4, 'sau dai hoc');
select * from TrinhDo;

insert into NhanVien(id_nhan_vien, ho_ten,id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmtnd, luong, sdt, email, dia_chi)
values
(1, 'Nguyen Van A', 6, 4, 2, '1983-10-04', '999 999 999', '30.000.000', '0905 999999', 'nva@gmail.com', 'Da Nang' ),
(2, 'Huynh Thi B', 1, 3, 2, '1985-11-03', '999 999 998', '20.000.000', '0905 999998', 'hvb@gmail.com', 'Da Nang' ),
(3, 'Tran Van C', 1, 3, 2, '1989-01-05', '999 999 997', '17.000.000', '0905 999997', 'tvc@gmail.com', 'Quang Nam' ),
(4, 'Nguyen Van D', 2, 2, 3, '1992-09-06', '999 999 996', '15.000.000', '0905 999996', 'nvd@gmail.com', 'Quang Nam' ),
(5, 'Huynh Thi E', 2, 2, 3, '1993-08-01', '999 999 995', '12.000.000', '0905 999995', 'hte@gmail.com', 'Hue' ),
(6, 'Tran Thi F', 3, 3, 4, '1991-12-22', '999 999 994', '22.000.000', '0905 999994', 'ttf@gmail.com', 'Hue' ),
(7, 'Hoang Van G', 3, 2, 4, '1995-09-09', '999 999 993', '15.000.000', '0905 999993', 'hvg@gmail.com', 'Ha Noi' ),
(8, 'Nguyen Thi H', 4, 1, 1, '1993-06-07', '999 999 992', '20.000.000', '0905 999992', 'nth@gmail.com', 'Ha Noi' ),
(9, 'Phan Thi Y', 4, 2, 3, '1995-03-18', '999 999 991', '10.000.000', '0905 999991', 'pty@gmail.com', 'Nghe An' ),
(10, 'Lai Van K', 5, 3, 4, '1980-04-10', '999 999 990', '18.000.000', '0905 999990', 'lvk@gmail.com', 'Ha Tinh' );
select * from NhanVien;

insert into LoaiKhach(id_loai_khach, ten_loai_khach)
values
(1, 'diamond'),
(2, 'platinium'),
(3, 'gold'),
(4, 'silver'),
(5, 'member');
select * from LoaiKhach;

insert into KieuThue(id_kieu_thue, ten_kieu_thue)
values
(1, 'nam'),
(2, 'thang'),
(3, 'ngay'),
(4, 'gio');

insert into LoaiDichVu(id_loai_dich_vu, ten_loai_dich_vu)
values
(1, 'villa'),
(2, 'house'),
(3, 'room');

insert into DichVuDiKem(id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
values
(1, 'massage', 1000000, 1, 'hoat dong'),
(2, 'karaoke', 500000, 1, 'hoat dong'),
(3, 'thuc an', 100000, 1, 'hoat dong'),
(4, 'nuoc uong', 50000, 1, 'hoat dong'),
(5, 'thue xe', 800000, 1, 'hoat dong');

insert into KhachHang(id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi)
values
(1, 1, 'Nguyen A', '1990-10-04', '201 575 111', '0905 888888', 'na@hotmail.com', 'Da Nang'),
(2, 2, 'Nguyen B', '1990-10-05', '201 575 112', '0905 888887', 'nb@hotmail.com', 'Hue'),
(3, 3, 'Nguyen C', '1990-10-06', '201 575 113', '0905 888886', 'nc@hotmail.com', 'Quang Nam'),
(4, 4, 'Nguyen D', '1990-10-07', '201 575 114', '0905 888885', 'nd@hotmail.com', 'Hoi An'),
(5, 5, 'Nguyen E', '1990-10-08', '201 575 115', '0905 888884', 'ne@hotmail.com', 'Tam Ky');

insert into DichVu
values
(1, 'villa 1', 300, 2, '20 nguoi', '10000000', 1, 1, 'hoat dong'),
(2, 'villa 2', 300, 3, '20 nguoi', '10000000', 2, 1, 'hoat dong'),
(3, 'House 1', 200, 2, '10 nguoi', '30000000', 1, 2, 'hoat dong'),
(4, 'House 2', 200, 2, '10 nguoi', '30000000', 1, 2, 'hoat dong'),
(5, 'Room 1', 100, 1, '5 nguoi', '2000000', 3, 3, 'hoat dong'),
(6, 'Room 2', 100, 1, '5 nguoi', '2000000', 3, 3, 'sua chua');

insert into HopDong
values
(1, 1, 1, 1, '2021-06-15', '2021-06-17', 1000000),
(2, 1, 2, 3, '2021-03-15', '2021-03-17', 1000000),
(3, 1, 3, 5, '2021-02-15', '2021-02-17', 1000000),
(4, 1, 2, 6, '2021-09-15', '2020-09-15', 1000000);

insert into HopDongChiTiet
values
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1);
use furama_resort;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from NhanVien
where ho_ten like 'H%' and length(ho_ten)<=15;
--  3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from KhachHang
where (year(ngay_sinh) >= 1971 and year(ngay_sinh)<=2003) and (dia_chi = 'Da Nang' or dia_chi = 'Quang Tri');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--      Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select HopDong.id_khach_hang, count(HopDong.id_khach_hang) as count, LoaiKhach.ten_loai_khach
from KhachHang
inner join HopDong on KhachHang.id_khach_hang = HopDong.id_khach_hang
inner join LoaiKhach on KhachHang.id_loai_khach = LoaiKhach.id_loai_khach
where KhachHang.id_loai_khach = 1
group by id_khach_hang
order by count desc;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, 
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select k.id_khach_hang, ho_ten, ten_loai_khach, h.id_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, (chi_phi_thue+gia*so_luong) as tong_tien
from KhachHang k
left join LoaiKhach l on k.id_loai_khach = l.id_loai_khach
left join HopDong h on h.id_khach_hang = k.id_khach_hang
left join DichVu d on d.id_dich_vu = h.id_dich_vu
left join HopDongChiTiet hd on h.id_hop_dong = hd.id_hop_dong
left join DichVuDiKem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select *
from (select id_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from DichVu 
left join LoaiDichVu on loaidichvu.id_loai_dich_vu = dichvu.id_loai_dich_vu
union
select id_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from DichVu
right join LoaiDichVu on loaidichvu.id_loai_dich_vu = dichvu.id_loai_dich_vu) temp
left join HopDong h on temp.id_dich_vu = h.id_dich_vu
where (not (month(ngay_lam_hop_dong) not in (01,02,03) and year(ngay_lam_hop_dong) = 2019)) or (h.id_dich_vu is null);

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ 
-- đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
insert into HopDong
values
(5, 1, 1, 1, '2018-06-15', '2021-06-17', 1000000),
(6, 1, 2, 3, '2019-03-15', '2021-03-17', 1000000);

select temp.id_dich_vu, temp.ten_dich_vu, temp.dien_tich, temp.so_nguoi_toi_da, temp.chi_phi_thue, temp.ten_loai_dich_vu, temp.ngay_lam_hop_dong
from
(select h.id_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu, ngay_lam_hop_dong
from DichVu d
inner join LoaiDichVu l on l.id_loai_dich_vu = d.id_loai_dich_vu
inner join hopdong h on h.id_dich_vu = d.id_dich_vu
where year(ngay_lam_hop_dong) = 2018) temp
left join (
select h.id_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu, ngay_lam_hop_dong
from DichVu d
inner join LoaiDichVu l on l.id_loai_dich_vu = d.id_loai_dich_vu
inner join hopdong h on h.id_dich_vu = d.id_dich_vu
where year(ngay_lam_hop_dong) = 2019) temp1 on temp.id_dich_vu = temp1.id_dich_vu
where temp1.id_dich_vu is null;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
select ho_ten from Khachhang group by ho_ten;
select distinct ho_ten from KhachHang;
select ho_ten from Khachhang
union
select ho_ten from KhachHang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as `month`, count(h.id_khach_hang) as so_luong_dat
from HopDong h
inner join KhachHang k on k.id_khach_hang = h.id_khach_hang
group by `month`;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
select h.id_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, count(id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from HopDong h
left join HopDongChiTiet hd on h.id_hop_dong = hd.id_hop_dong
group by h.id_hop_dong;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.




