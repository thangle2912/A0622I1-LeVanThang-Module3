create database if not exists materials;
use materials;
create table phieu_xuat(
ma_phieu_xuat int primary key auto_increment,
ngay_xuat date
);
create table phieu_nhap(
ma_phieu_nhap int primary key auto_increment,
ngay_nhap date
);
create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten varchar(30)
);
create table nha_cc(
ma_nha_cc int primary key auto_increment,
ten varchar(50),
dia_chi varchar(50)
);
create table don_dat_hang(
ma_don_hang int primary key auto_increment,
ngay_dat_hang date,
ma_nha_cc int,
foreign key(ma_nha_cc) references nha_cc(ma_nha_cc)
);
create table chi_tiet_dat_hang(
ma_don_hang int,
ma_vat_tu int,
primary key(ma_don_hang,ma_vat_tu),
foreign key(ma_don_hang) references don_dat_hang(ma_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_nhap(
ma_phieu_nhap int,
ma_vat_tu int,
don_gia_nhap float,
so_luong_nhap int,
primary key(ma_phieu_nhap, ma_vat_tu),
foreign key(ma_phieu_nhap) references phieu_nhap(ma_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_xuat(
ma_phieu_xuat int,
ma_vat_tu int,
don_gia_xuat float,
so_luong_xuat int,
primary key(ma_phieu_xuat, ma_vat_tu),
foreign key(ma_phieu_xuat) references phieu_xuat(ma_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

 create table so_dien_thoai(
 ma_dt int primary key auto_increment,
 so_dien_thoai varchar(20),
 ma_nha_cc int,
 foreign key (ma_nha_cc) references nha_cc(ma_nha_cc)
 );