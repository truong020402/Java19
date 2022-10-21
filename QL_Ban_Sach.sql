-- Nguyễn Hồng Trường

create database qlbansach;

use qlbansach;
-- Bang khach hang
create table khach_hang(
	ma_kh int not null auto_increment,
    ho_ten varchar(150),
	tai_khoan varchar(150),
    mat_khau varchar(100),
    email varchar(150),
    dia_chi text,
    dien_thoai varchar(15),
    gioi_tinh boolean,
    ngay_sinh date,
    primary key (ma_kh),
    unique(tai_khoan), unique(email), unique(dien_thoai)
);
-- Bang chu de       
 create table   chu_de(
     ma_chu_de int not null auto_increment,
     ten_chu_de varchar(100),
     primary key(ma_chu_de)
     
 );
 -- Bang nha xuat ban
 create table nha_xuat_ban(
     ma_nxb int not null auto_increment,
     ten_nxb varchar(150),
     dia_chi text,
     dien_thoai varchar(15),
     primary key(ma_nxb)
 );
 -- Bang tac gia
 create table tac_gia(
     ma_tac_gia int not null auto_increment,
     ten_tac_gia varchar(100),
     dien_thoai varchar(15),
     tieu_su text,
     dia_chi text,
     primary key (ma_tac_gia)
 );
 -- Bang sach
 create table sach(
     ma_sach int not null auto_increment,
     ten_sach varchar(100),
     anh_bia varchar(200),
     mo_ta text,
     gia_ban decimal(15,2) not null,
     ngay_cap_nhat date,
     so_luong_ton int,
     ma_nxb int,
     ma_chu_de int,
     primary key (ma_sach),
     foreign key (ma_nxb) references nha_xuat_ban(ma_nxb),
     foreign key (ma_chu_de) references chu_de(ma_chu_de)
 
 );
 -- Bang con sach-tac 
 create table sach_tac_gia(
     ma_sach int,
     ma_tac_gia int,
     primary key(ma_sach,ma_tac_gia),
     foreign key (ma_sach) references sach(ma_sach),
     foreign key (ma_tac_gia) references tac_gia(ma_tac_gia)
 );
 -- Bang don hang
 create table don_hang(
     ma_don_hang int not null auto_increment,
     tinh_trang_thanh_toan boolean,
     ngay_dat datetime,
     ngay_giao datetime,
     trinh_trang_GH int,
     ma_kh int, 
     primary key (ma_don_hang),
     foreign key (ma_kh) references khach_hang(ma_kh)
     
 );
 -- Bang con chi tiet don hang
 create table chi_tiet_don_hang(
     ma_don_hang int,
     ma_sach int,
     so_luong int,
     primary key(ma_don_hang, ma_sach),
     foreign key(ma_don_hang) references don_hang(ma_don_hang),
     foreign key(ma_sach) references sach(ma_sach)
 );