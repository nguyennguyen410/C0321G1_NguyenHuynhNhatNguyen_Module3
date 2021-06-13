create database furama_resort;
use furama_resort;

create table KieuThue(
id_kieu_thue int primary key,
ten_kieu_thue varchar(45),
gia int
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
foreign key (id_kieu_thue) references KieuThue(id_kieu_thue),
foreign key (id_loai_dich_vu) references LoaiDichVu (id_loai_dich_vu)
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
foreign key (id_loai_khach) references LoaiKhach(id_loai_khach)
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
foreign key (id_vi_tri) references ViTri(id_vi_tri),
foreign key (id_trinh_do) references TrinhDo(id_trinh_do),
foreign key (id_bo_phan) references BoPhan(id_bo_phan)
);

create table HopDong(
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int,
foreign key (id_nhan_vien) references NhanVien(id_nhan_vien),
foreign key (id_khach_hang) references KhachHang(id_khach_hang),
foreign key (id_dich_vu) references DichVu(id_dich_vu)
);

create table HopDongChiTiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_hop_dong) references HopDong(id_hop_dong),
foreign key (id_dich_vu_di_kem) references DichVuDiKem(id_dich_vu_di_kem)
);

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
(6, 'giam doc')
;
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

insert into KieuThue(id_kieu_thue, ten_kieu_thue, gia)
values
(1, 'nam', 100000000),
(2, 'thang', 10000000),
(3, 'ngay', 600000),
(4, 'gio', 150000);

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

