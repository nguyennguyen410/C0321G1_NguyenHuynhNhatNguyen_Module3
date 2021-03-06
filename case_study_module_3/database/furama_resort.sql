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
-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.
select *
from NhanVien
where ho_ten like '%% H%' and length(ho_ten)<=15;
--  3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select * from KhachHang
where (year(ngay_sinh) >= 1971 and year(ngay_sinh)<=2003) and (dia_chi = 'Da Nang' or dia_chi = 'Quang Tri');

-- 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. 
--      Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
select HopDong.id_khach_hang, count(HopDong.id_khach_hang) as count, LoaiKhach.ten_loai_khach
from KhachHang
inner join HopDong on KhachHang.id_khach_hang = HopDong.id_khach_hang
inner join LoaiKhach on KhachHang.id_loai_khach = LoaiKhach.id_loai_khach
where KhachHang.id_loai_khach = 1
group by id_khach_hang
order by count desc;

-- 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, 
-- TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. 
-- (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
select k.id_khach_hang, ho_ten, ten_loai_khach, h.id_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, (chi_phi_thue+gia*so_luong) as tong_tien
from KhachHang k
left join LoaiKhach l on k.id_loai_khach = l.id_loai_khach
left join HopDong h on h.id_khach_hang = k.id_khach_hang
left join DichVu d on d.id_dich_vu = h.id_dich_vu
left join HopDongChiTiet hd on h.id_hop_dong = hd.id_hop_dong
left join DichVuDiKem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem;

-- 6.	Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? 
-- ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).
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

-- 7.	Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? 
-- ???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng  trong n??m 2019.
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

-- 8.	Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoThenKhachHang kh??ng tr??ng nhau.
-- H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n
select ho_ten from Khachhang group by ho_ten;
select distinct ho_ten from KhachHang;
select ho_ten from Khachhang
union
select ho_ten from KhachHang;

-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.
select month(ngay_lam_hop_dong) as `month`, count(h.id_khach_hang) as so_luong_dat
from HopDong h
inner join KhachHang k on k.id_khach_hang = h.id_khach_hang
group by `month`;

-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. 
-- K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet).
select h.id_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, count(id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from HopDong h
left join HopDongChiTiet hd on h.id_hop_dong = hd.id_hop_dong
group by h.id_hop_dong;

-- 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.
insert into KhachHang(id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi)
values
(6, 1, 'Nguyen AB', '1990-10-04', '201 575 111', '0905 888888', 'nab@hotmail.com', 'Vinh'),
(7, 2, 'Nguyen BC', '1990-10-05', '201 575 112', '0905 888887', 'nbc@hotmail.com', 'Quang Ngai');

insert into HopDong
values
(7, 2, 6, 5, '2021-06-15', '2021-06-17', 1000000),
(8, 2, 7, 6, '2021-03-15', '2021-03-17', 1000000);

insert into HopDongChiTiet
values
(5, 7, 1, 2),
(6, 8, 1, 2);

select k.ho_ten, l.ten_loai_khach, d.ten_dich_vu_di_kem, k.dia_chi
from HopDong h
inner join Khachhang k on h.id_khach_hang = k.id_khach_hang
inner join LoaiKhach l on l.id_loai_khach = k.id_loai_khach
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVuDiKem d on d.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
where l.ten_loai_khach = 'diamond' and (k.dia_chi = 'Vinh' or k.dia_chi='QuangNgai');

-- 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), 
-- TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2019 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.
select temp.id_hop_dong, temp.ho_ten, temp.ten, temp.sdt, temp.ten_dich_vu, temp.so_luong
from
(select h.id_hop_dong, k.ho_ten, (n.ho_ten) ten, k.sdt, d.ten_dich_vu, hd.so_luong
from HopDong h
inner join Khachhang k on h.id_khach_hang = k.id_khach_hang
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVu d on d.id_dich_vu = h.id_dich_vu
inner join NhanVien n on n.id_nhan_vien = h.id_nhan_vien
where month(h.ngay_lam_hop_dong ) in (10,11,12) and year(h.ngay_lam_hop_dong) = 2021) temp
left join
(select h.id_hop_dong, k.ho_ten, (n.ho_ten) ten, k.sdt, d.ten_dich_vu, hd.so_luong
from HopDong h
inner join Khachhang k on h.id_khach_hang = k.id_khach_hang
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVu d on d.id_dich_vu = h.id_dich_vu
inner join NhanVien n on n.id_nhan_vien = h.id_nhan_vien
where month(h.ngay_lam_hop_dong ) in (01,02,03,04,05,06) and year(h.ngay_lam_hop_dong) = 2021) temp1
on temp.id_hop_dong = temp1.id_hop_dong
where temp.id_hop_dong is null;

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).
select count(dv.ten_dich_vu_di_kem) as so_lan_dat, dv.ten_dich_vu_di_kem, dv.gia
from HopDong h
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVuDiKem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
group by dv.ten_dich_vu_di_kem;

-- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select hd.id_hop_dong, d.ten_dich_vu, dv.ten_dich_vu_di_kem, count(dv.ten_dich_vu_di_kem) as so_lan_su_dung
from HopDong h
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVuDiKem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
inner join DichVu d on d.id_dich_vu = h.id_dich_vu
group by dv.ten_dich_vu_di_kem
having count(dv.ten_dich_vu_di_kem) = 1;

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019.
select h.id_nhan_vien, n.ho_ten, t.trinh_do, b.ten_bo_phan, n.sdt, n.dia_chi, count(h.id_nhan_vien) as so_lan_lap_hop_dong
from HopDong h
inner join NhanVien n on n.id_nhan_vien = h.id_nhan_vien
inner join ViTri v on v.id_vi_tri = n.id_vi_tri
inner join TrinhDo t on t.id_trinh_do = n.id_trinh_do
inner join BoPhan b on b.id_bo_phan = n.id_bo_phan
where year(h.ngay_lam_hop_dong) in (2020,2021)
group by(h.id_nhan_vien)
having count(h.id_nhan_vien) <=3;

-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.
select * 
from NhanVien n 
left join 
(select *
from HopDong h
where year(h.ngay_lam_hop_dong) in (2020,2021)) temp 
on n.id_nhan_vien = temp.id_nhan_vien
where temp.id_nhan_vien is null;

-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t???  Platinium l??n Diamond, 
-- ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??.
create temporary table temp_table (select h.id_khach_hang
from HopDong h
inner join HopDongChiTiet hd on hd.id_hop_dong = h.id_hop_dong
inner join DichVuDiKem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
inner join DichVu d on d.id_dich_vu = h.id_dich_vu
inner join Khachhang k on h.id_khach_hang = k.id_khach_hang
inner join LoaiKhach l on l.id_loai_khach = k.id_loai_khach
where year(h.ngay_lam_hop_dong) = 2021 and l.ten_loai_khach = 'platinium'
group by h.id_khach_hang
having sum(chi_phi_thue+gia*so_luong)>10000000); 

update Khachhang
set khachhang.id_loai_khach = 1
where khachhang.id_khach_hang in (select * from temp_table);

-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 (ch?? ?? r??ng bu???c gi???a c??c b???ng).
insert into HopDong
values
(9, 1, 5, 4, '2016-06-15', '2016-06-17', 1000000);

create temporary table temp_table1(select k.id_khach_hang from HopDong h
inner join KhachHang k on k.id_khach_hang = h.id_khach_hang
where year(h.ngay_lam_hop_dong) <= 2016);

delete from KhachHang
where id_khach_hang in (select * from temp_table1);

-- 19.	C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i.
create temporary table temp_table2(select hd.id_dich_vu_di_kem, count(hd.id_dich_vu_di_kem) as so_lan, dv.gia
from hopdong h
inner join hopdongchitiet hd on h.id_hop_dong = hd.id_hop_dong
inner join dichvudikem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
group by hd.id_dich_vu_di_kem
having count(hd.id_dich_vu_di_kem) >=2);

update dichvudikem dv
set dv.gia = dv.gia * 2
where dv.id_dich_vu_di_kem in (select id_dich_vu_di_kem from temp_table2);

-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng, 
-- th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

select id_khach_hang as id, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi
from khachhang
union all
select id_nhan_vien, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi
from nhanvien;


-- 21.	T???o khung nh??n c?? t??n l?? V_NHANVIEN ????? l???y ???????c th??ng tin c???a t???t c??? c??c nh??n vi??n c?? ?????a ch??? l?? ???H???i Ch??u??? 
-- v?? ???? t???ng l???p h???p ?????ng cho 1 ho???c nhi???u Kh??ch h??ng b???t k???  v???i ng??y l???p h???p ?????ng l?? ???12/12/2019???
insert into HopDong
values
(10, 1, 3, 4, '2019-12-12', '2019-12-15', 1000000);

create view v_nhanvien as
select n.ho_ten, n.dia_chi 
from nhanvien n
inner join hopdong h on h.id_nhan_vien = n.id_nhan_vien
where h.ngay_lam_hop_dong = '2019-12-12';

-- 22.	Th??ng qua khung nh??n V_NHANVIEN th???c hi???n c???p nh???t ?????a ch??? th??nh ???Li??n Chi???u??? ?????i v???i t???t c??? c??c Nh??n vi??n ???????c nh??n th???y b???i khung nh??n n??y.
update v_nhanvien
set dia_chi = 'Lien Chieu';

-- 23.	T???o Clustered Index c?? t??n l?? IX_KHACHHANG tr??n b???ng Kh??ch h??ng.
-- Gi???i th??ch l?? do v?? th???c hi???n ki???m tra t??nh hi???u qu??? c???a vi???c s??? d???ng INDEX
explain select * from khachhang where id_khach_hang = 2;
create unique index ix_khachhang on KhachHang(id_khach_hang);
drop index ix_khachhang on khachhang;

-- 24.	T???o Non-Clustered Index c?? t??n l?? IX_SoDT_DiaChi tr??n c??c c???t SODIENTHOAI v?? DIACHI tr??n b???ng KHACH HANG v?? ki???m tra t??nh hi???u qu??? t??m ki???m sau khi t???o Index.
explain select * from khachhang where dia_chi='Da Nang' or sdt='0905 888883';
create unique index ix_sodt_diachi on khachhang(sdt, dia_chi);
drop index ix_sodt_diachi on khachhang;

-- 25.	T???o Store procedure Sp_1 D??ng ????? x??a th??ng tin c???a m???t Kh??ch h??ng n??o ???? v???i Id Kh??ch h??ng ???????c truy???n v??o nh?? l?? 1 tham s??? c???a Sp_1
insert into KhachHang(id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi)
values
(8, 2, 'Nguyen ABC', '1990-10-04', '201 575 111', '0905 888777', 'nabc@hotmail.com', 'Hai Chau');
DELIMITER //
CREATE PROCEDURE sp_1(in id int)
BEGIN
  delete from KhachHang
  where id_khach_hang = id;
END //
DELIMITER ;
call sp_1(8);

-- 26.	T???o Store procedure Sp_2 D??ng ????? th??m m???i v??o b???ng HopDong v???i y??u c???u Sp_2 ph???i th???c hi???n ki???m tra t??nh h???p l??? c???a d??? li???u b??? sung, 
-- v???i nguy??n t???c kh??ng ???????c tr??ng kh??a ch??nh v?? ?????m b???o to??n v???n tham chi???u ?????n c??c b???ng li??n quan.
DELIMITER //
CREATE PROCEDURE sp_2(
in id_hop_dong int, 
in id_nhan_vien int, 
in id_khach_hang int, 
in id_dich_vu int, 
in ngay_lam_hop_dong date, 
in ngay_ket_thuc date, tien_dat_coc int)
BEGIN
if(id_hop_dong not in (select id_hop_dong from hopdong))
then
  insert into hopdong
  values (id_hop_dong, id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc);
end if;
END //
DELIMITER ;

-- 27.	T???o triggers c?? t??n Tr_1 X??a b???n ghi trong b???ng HopDong th?? hi???n th??? t???ng s??? l?????ng b???n ghi c??n l???i c?? trong b???ng HopDong ra giao di???n console c???a database
DELIMITER //
create trigger tr_1
after delete on hopdong
for each row
begin
	select count(id_hop_dong) into @soluong
    from hopdong;
end //
DELIMITER ;
delete from hopdong
where id_hop_dong = 4;
select @soluong as so_hop_dong_con_lai;

-- 28.	T???o triggers c?? t??n Tr_2 Khi c???p nh???t Ng??y k???t th??c h???p ?????ng, c???n ki???m tra xem th???i gian c???p nh???t c?? ph?? h???p hay kh??ng, v???i quy t???c sau: 
-- Ng??y k???t th??c h???p ?????ng ph???i l???n h??n ng??y l??m h???p ?????ng ??t nh???t l?? 2 ng??y. N???u d??? li???u h???p l??? th?? cho ph??p c???p nh???t, 
-- n???u d??? li???u kh??ng h???p l??? th?? in ra th??ng b??o ???Ng??y k???t th??c h???p ?????ng ph???i l???n h??n ng??y l??m h???p ?????ng ??t nh???t l?? 2 ng??y??? tr??n console c???a database
delimiter //
create trigger tr_2 
before update on hopdong 
for each row
begin
    set @e = 'Ngay ket thuc khong hop le ';
    if  datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong)<2 then
    SIGNAL SQLSTATE '45000' set message_text= @e;
    end if;
end//
DELIMITER ;
drop trigger tr_2;
update hopdong
set ngay_ket_thuc = '2021-03-20'
where id_hop_dong = 2;

-- 29.	T???o user function th???c hi???n y??u c???u sau:
-- a.	T???o user function func_1: ?????m c??c d???ch v??? ???? ???????c s??? d???ng v???i T???ng ti???n l?? > 2.000.000 VN??.
-- b.	T???o user function Func_2: T??nh kho???ng th???i gian d??i nh???t t??nh t??? l??c b???t ?????u l??m h???p ?????ng ?????n l??c k???t th??c h???p ?????ng m?? Kh??ch h??ng ???? th???c hi???n thu?? d???ch v???
-- (l??u ?? ch??? x??t c??c kho???ng th???i gian d???a v??o t???ng l???n l??m h???p ?????ng thu?? d???ch v???, kh??ng x??t tr??n to??n b??? c??c l???n l??m h???p ?????ng). 
-- M?? c???a Kh??ch h??ng ???????c truy???n v??o nh?? l?? 1 tham s??? c???a function n??y.
create temporary table temp_table (select d.ten_dich_vu,  (chi_phi_thue+gia*so_luong) as tong_tien
    from hopdong h
    inner join hopdongchitiet hd on hd.id_hop_dong = h.id_hop_dong
    inner join dichvudikem dv on hd.id_dich_vu_di_kem = dv.id_dich_vu_di_kem
    inner join dichvu d on d.id_dich_vu = h.id_dich_vu
    where (chi_phi_thue+gia*so_luong) > 2000000);
delimiter //
create function func_1() returns int
reads sql data
deterministic
begin
	declare dem int;
    select count(tong_tien) into dem
    from temp_table;
    return dem;
end //
delimiter ;

select func_1();

delimiter //
create function func_2(id_khach_hang int) returns int
reads sql data
deterministic
begin
	declare songaythue int;
    select max(so_ngay_thue)
    from (select datediff(ngay_ket_thuc, ngay_lam_hop_dong) as so_ngay_thue
    from hopdong h 
    where h.id_khach_hang = id_khach_hang) as thoi_gian_dat into songaythue;
    return songaythue;
end //
delimiter ;
select func_2(3);

-- 30.	T???o Stored procedure Sp_3 ????? t??m c??c d???ch v??? ???????c thu?? b???i kh??ch h??ng v???i lo???i d???ch v??? l?? ???Room??? t??? ?????u n??m 2015 ?????n h???t n??m 2019 
-- ????? x??a th??ng tin c???a c??c d???ch v??? ???? (t???c l?? x??a c??c b???ng ghi trong b???ng DichVu) v?? x??a nh???ng HopDong s??? d???ng d???ch v??? li??n quan 
-- (t???c l?? ph???i x??a nh???ng b???n gi trong b???ng HopDong) v?? nh???ng b???n li??n quan kh??c.
create temporary table temp_table_30(select d.id_dich_vu 
from hopdong h
inner join dichvu d on d.id_dich_vu = h.id_dich_vu
inner join loaidichvu l on l.id_loai_dich_vu = d.id_loai_dich_vu
where (h.ngay_lam_hop_dong > '2015-01-01' and h.ngay_lam_hop_dong < '2021-12-31') and l.ten_loai_dich_vu = 'Room');

DELIMITER //
CREATE PROCEDURE sp_3()
BEGIN
  delete from dichvu
  where id_dich_vu in (select * from temp_table_30);
  delete from hopdong
  where id_dich_vu in (select * from temp_table_30);
END //
DELIMITER ;
call sp_3();

insert into KhachHang(id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi)
values
(11, 1, 'Nguyen F', '1990-10-04', '201 575 116', '0905 888883', 'nf@hotmail.com', 'Hai Chau'),
(12, 2, 'Huynh G', '1990-10-05', '201 575 217', '0905 888882', 'hg@hotmail.com', 'Vinh'),
(13, 3, 'Nguyen H', '1990-10-06', '201 575 318', '0905 888881', 'nh@hotmail.com', 'Quang Ngai'),
(9, 4, 'Huynh I', '1990-10-07', '201 575 414', '0905 888880', 'hi@hotmail.com', 'Vinh'),
(10, 5, 'Nguyen J', '1990-10-08', '201 575 515', '0905 888877', 'nj@hotmail.com', 'Tam Ky');

insert into HopDong
values
(11, 4, 11, 2, '2021-06-13', '2021-06-21', 1000000),
(12, 5, 12, 4, '2021-03-15', '2021-03-17', 1000000),
(13, 6, 13, 6, '2021-02-01', '2021-02-04', 1000000),
(14, 7, 9, 6, '2021-09-15', '2020-09-20', 1000000);

insert into HopDongChiTiet
values
(11, 11, 1, 2),
(12, 12, 2, 4),
(13, 13, 3, 3),
(14, 14, 4, 3);