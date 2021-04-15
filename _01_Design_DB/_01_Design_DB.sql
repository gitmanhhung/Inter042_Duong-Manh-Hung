create database QL_FURAMA;
use ql_furama;
create table vitri(
idvitri int primary key,
tenvitri varchar(45)
);
create table TrinhDo(
idTrinhDo int primary key,
TrinhDo varchar(45)
);
create table BoPhan(
idBoPhan int primary key,
TenBoPhan varchar(45)
);
create table LoaiKhach(
idLoaiKhach int primary key,
TenLoaiKhach varchar(45)
);
create table KieuThue(
idKieuThue int primary key,
TenKieuThue varchar(45),
Gia int
);
create table LoaiDichVu(
idLoaiDichVu int primary key,
TenLoaiDichVu varchar(45)
);
create table NhanVien(
idNhanVien int primary key,
HoTen varchar(45),
idViTri int,
idTrinhDo int,
idBoPhan int,
NgaySinh date,
SoCMND varchar(45),
Luong varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
foreign key (idViTri) references ViTri(idViTri),
foreign key (idBoPhan) references BoPhan(idBoPhan),
foreign key (idTrinhDo) references TrinhDo(idTrinhDo)
);
create table KhachHang(
idKhachHang int primary key,
idLoaiKhach int,
HoTen varchar(45),
NgaySinh date,
SoCMND varchar(45),
SDT varchar(45),
Email varchar(45),
DiaChi varchar(45),
foreign key (idLoaiKhach) references LoaiKhach(idLoaiKhach)
);
create table DichVu(
idDichVu int primary key,
TenDichVu varchar(45),
DienTich int,
SoTang int,
SoNguoiToiDa varchar(45),
ChiPhiThue varchar(45),
idKieuThue int,
idLoaiDichVu int,
TrangThai varchar(45),
foreign key (idKieuThue) references KieuThue(idKieuThue),
foreign key (idLoaiDichVu) references LoaiDichVu(idLoaiDichVu)
);
create table HopDong(
idHopDong int primary key,
idNhanVien int,
idKhachHang int,
idDichVu int,
SoTang int,
NgayLamHopDong date,
NgayKetThuc date,
TienDatCoc int,
TongTien int,
foreign key (idDichVu) references DichVu(idDichVu),
foreign key (idKhachHang) references KhachHang(idKhachHang),
foreign key (idNhanVien) references NhanVien(idNhanVien)
);
create table DichVuDiKem(
idDichVuDiKem int primary key,
TenDichVuDiKem varchar(45),
Gia int,
DonVi int,
TrangThaiKhaDung varchar(45)
);
create table HopDongChiTiet(
idHopDongChiTiet int primary key,
idHopDong int,
idDichVuDiKem int,
SoLuong int,
foreign key (idHopDong) references HopDong(idHopDong),
foreign key (idDichVuDiKem) references DichVuDiKem(idDichVuDiKem)
);
insert into TrinhDo(idTrinhDo,TrinhDo) values ('1','daihoc');
INSERT INTO `ql_furama`.`trinhdo` (`idTrinhDo`, `TrinhDo`) VALUES ('2', 'cao dang');
INSERT INTO `ql_furama`.`trinhdo` (`idTrinhDo`, `TrinhDo`) VALUES ('3', 'trung cap');


INSERT INTO `ql_furama`.`vitri` (`idvitri`, `tenvitri`) VALUES ('1', 'vi tri 1');
INSERT INTO `ql_furama`.`vitri` (`idvitri`, `tenvitri`) VALUES ('2', 'vi tri 2');
INSERT INTO `ql_furama`.`vitri` (`idvitri`, `tenvitri`) VALUES ('3 ', 'vi tri3');


INSERT INTO `ql_furama`.`bophan` (`idBoPhan`, `TenBoPhan`) VALUES ('1', 'bo phan 1');
INSERT INTO `ql_furama`.`bophan` (`idBoPhan`, `TenBoPhan`) VALUES ('2', 'bo phan 2');
INSERT INTO `ql_furama`.`bophan` (`idBoPhan`, `TenBoPhan`) VALUES ('3', 'bo phan 3');

INSERT INTO `ql_furama`.`nhanvien` (`idNhanVien`, `HoTen`, `idViTri`, `idTrinhDo`, `idBoPhan`, `NgaySinh`, `SoCMND`, `Luong`, `SDT`, `Email`, `DiaChi`) VALUES ('1', 'duong hung', '2', '1', '3', '1999/04/03', '1243', '60000', '35738', 'th@gmail.com', 'hai chau');

select * from NhanVien where ((HoTen like '% H%' ) or (HoTen like '% D%' )  or (HoTen like '% T%' )) and length(HoTen)  <=15;

select * from NhanVien where year(curdate())-year(NgaySinh) between 18 and 50 and DiaChi in ('da nang','quang tri') ;

SELECT distinct KhachHang.HoTen, count(hopdong.idKhachHang) as solandatphong
FROM KhachHang
 INNER JOIN HopDong
ON KhachHang.idKhachHang = HopDong.idKhachHang
INNER JOIN LoaiKhach
ON KhachHang.idLoaiKhach = LoaiKhach.idLoaiKhach
group by hopdong.idKhachHang,LoaiKhach.TenLoaiKhach
having TenLoaiKhach ='diamond'
order by count(hopdong.idKhachHang);


select kh.idKhachHang,kh.HoTen,lk.TenLoaiKhach,hd.idHopDong,dv.TenDichVu,hd.NgayLamHopDong,hd.NgayKetThuc,dv.ChiPhiThue+hdct.SoLuong*dvdk.Gia as tongtien
from KhachHang kh 
left join LoaiKhach lk
on kh.idLoaiKhach=lk.idLoaiKhach
left join HopDong hd
on kh.idKhachHang=hd.idKhachHang
left join DichVu dv
on hd.idDichVu=dv.idDichVu
left join HopDongChiTiet hdct
on hd.idHopDong=hdct.idHopDong
left join DichVuDikem dvdk
on hdct.idDichVuDiKem=dvdk.idDichVuDiKem;



select dv.idDichVu,dv.TenDichVu,dv.DienTich,dv.ChiPhiThue,ldv.TenDichVu
from DichVu dv
inner join LoaiDichVu ldv
 on dv.idLoaiDichVu=ldv.IdLoaiDichVu
  left join HopDong hd
 on  dv.idDichVu= hd.idDichVu
where (month(hd.NgayLamHopDong)<=3 and year(hd.NgayLamHopDong)<=2019) or hd.NgayLamHopDong is null;
 
 







