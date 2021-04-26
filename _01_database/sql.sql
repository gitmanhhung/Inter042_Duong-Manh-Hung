CREATE TABLE NhanVien(
id bigint NOT NULL PRIMARY KEY auto_increment,
ho_ten VARCHAR(150) NOT NULL,
id_vi_tri bigint NOT NULL,
id_trinh_do bigint NOT NULL,
id_bo_phan bigint NOT NULL,
ngay_sinh DATE,
so_cmnd VARCHAR(45),
luong VARCHAR(45),
sdt VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45)
);

CREATE TABLE ViTri(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_vi_tri VARCHAR(45) NOT NULL
);

CREATE TABLE TrinhDo(
id bigint NOT NULL PRIMARY KEY auto_increment,
trinh_do VARCHAR(45) NOT NULL
);

CREATE TABLE BoPhan(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_bo_phan VARCHAR(45) NOT NULL
);

ALTER TABLE nhanvien ADD CONSTRAINT fk_nhanvien_vitri FOREIGN KEY (id_vi_tri) REFERENCES ViTri(id) ON DELETE CASCADE;
ALTER TABLE NhanVien ADD CONSTRAINT fk_NhanVien_TrinhDo FOREIGN KEY (id_trinh_do) REFERENCES TrinhDo(id) ON DELETE CASCADE;
ALTER TABLE NhanVien ADD CONSTRAINT fk_NhanVien_BoPhan FOREIGN KEY (id_bo_phan) REFERENCES BoPhan(id) ON DELETE CASCADE;


CREATE TABLE KhachHang(
id bigint NOT NULL PRIMARY KEY auto_increment,
ho_ten VARCHAR(150) NOT NULL,
id_loai_khach bigint NOT NULL,
ngay_sinh DATE,
so_cmnd VARCHAR(45),
sdt VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45)
);

CREATE TABLE LoaiKhach(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_loai_khach VARCHAR(45) NOT NULL
);

ALTER TABLE KhachHang ADD CONSTRAINT fk_KhachHang_LoaiKhach FOREIGN KEY (id_loai_khach) REFERENCES LoaiKhach(id) ON DELETE CASCADE;


CREATE TABLE DichVu(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_dich_vu VARCHAR(150) NOT NULL,
id_loai_dich_vu bigint NOT NULL,
dien_tich INT,
so_tang INT,
so_nguoi_toi_da VARCHAR(45),
chi_phi_thue VARCHAR(45),
id_kieu_thue bigint NOT NULL,
trang_thai VARCHAR(45)
);

CREATE TABLE LoaiDichVu(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_loai_dich_vu VARCHAR(45) NOT NULL
);

CREATE TABLE KieuThue(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_kieu_thue VARCHAR(45) NOT NULL,
gia INT
);

ALTER TABLE DichVu ADD CONSTRAINT fk_DichVu_LoaiDichVu FOREIGN KEY (id_loai_dich_vu) REFERENCES LoaiDichVu(id) ON DELETE CASCADE;
ALTER TABLE DichVu ADD CONSTRAINT fk_DichVu_KieuThue FOREIGN KEY (id_kieu_thue) REFERENCES KieuThue(id) ON DELETE CASCADE;



CREATE TABLE HopDong(
id bigint NOT NULL PRIMARY KEY auto_increment,
id_nhan_vien bigint NOT NULL,
id_khach_hang bigint NOT NULL,
id_dich_vu bigint NOT NULL,
ngay_lam_hop_dong DATE,
ngay_ket_thuc DATE,
tien_dat_coc INT,
tong_tien INT
);

ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_DichVu FOREIGN KEY (id_dich_vu) REFERENCES DichVu(id) ON DELETE CASCADE;
ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_NhanVien FOREIGN KEY (id_nhan_vien) REFERENCES NhanVien(id) ON DELETE CASCADE;
ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_KhachHang FOREIGN KEY (id_khach_hang) REFERENCES KhachHang(id) ON DELETE CASCADE;


CREATE TABLE HopDongChiTiet(
id bigint NOT NULL PRIMARY KEY auto_increment,
id_hop_dong bigint NOT NULL,
id_dich_vu_di_kem bigint NOT NULL,
so_luong INT
);

CREATE TABLE DichVuDiKem(
id bigint NOT NULL PRIMARY KEY auto_increment,
ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
gia INT,
don_vi INT,
trang_thai VARCHAR(45) NOT NULL
);

ALTER TABLE HopDongChiTiet ADD CONSTRAINT fk_HopDongChiTiet_HopDong FOREIGN KEY (id_hop_dong) REFERENCES HopDong(id) ON DELETE CASCADE;

ALTER TABLE HopDongChiTiet ADD CONSTRAINT fk_HopDongChiTiet_DichVuDiKem FOREIGN KEY (id_dich_vu_di_kem) REFERENCES DichVuDiKem(id) ON DELETE CASCADE;

--- câu 1:

insert into trinhdo(trinh_do) values('Trung cấp');
insert into trinhdo(trinh_do) values('Cao đẳng');
insert into trinhdo(trinh_do) values('Đại học');
insert into trinhdo(trinh_do) values('Sau đại học');

insert into vitri(ten_vi_tri) values('Lễ tân');
insert into vitri(ten_vi_tri) values('Phục vụ');
insert into vitri(ten_vi_tri) values('Chuyên viên');
insert into vitri(ten_vi_tri) values('Giám sát');
insert into vitri(ten_vi_tri) values('Quản lý');
insert into vitri(ten_vi_tri) values('Giám đốc');

insert into bophan(ten_bo_phan) values('Sale-Marketing');
insert into bophan(ten_bo_phan) values('Hành Chính');
insert into bophan(ten_bo_phan) values('Phục vụ');
insert into bophan(ten_bo_phan) values('Quản lý');

insert into dichvudikem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values('massage', 200000, 1, 'readily');
insert into dichvudikem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values('karaoke', 200000, 1, 'readily');
insert into dichvudikem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values('Thức ăn', 150000, 1, 'readily');
insert into dichvudikem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values('Nước uống', 50000, 1, 'readily');
insert into dichvudikem(ten_dich_vu_di_kem, gia, don_vi, trang_thai) values('Thuê Xe', 100000, 1, 'readily');

insert into loaikhach(ten_loai_khach) values('Diamond');
insert into loaikhach(ten_loai_khach) values('Platinium');
insert into loaikhach(ten_loai_khach) values('Gold');
insert into loaikhach(ten_loai_khach) values('Silver');
insert into loaikhach(ten_loai_khach) values('Member');

insert into loaidichvu(ten_loai_dich_vu) values('');
insert into loaidichvu(ten_loai_dich_vu) values('');



insert into kieuthue(ten_kieu_thue, Gia) values('Năm', 100000000);
insert into kieuthue(ten_kieu_thue, Gia) values('Tháng', 12000000);
insert into kieuthue(ten_kieu_thue, Gia) values('Ngày', 1000000);
insert into kieuthue(ten_kieu_thue, Gia) values('Giờ', 300000);


insert into dichvu(ten_dich_vu, id_loai_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, trang_thai) 
values ('Villa', 1, 300, 2, 7, '1000000', 3, 'readily');
insert into dichvu(ten_dich_vu, id_loai_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, trang_thai) 
values ('House', 1, 250, 3, 10, '1000000', 3, 'readily');
insert into dichvu(ten_dich_vu, id_loai_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, trang_thai) 
values ('Phòng', 1, 100, 1, 4, '300000', 3, 'readily');


insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Nguyễn Văn Tâm', 1, 2, 3, '1997-03-19', '123456789', '8.000.000', '0963906991', 'tamgl19031997@gmail.com', 'Quang Nam');
insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Lê Thị Hồng', 2, 1, 1, '1999-01-02', '123456789', '8.000.000', '123123123', 'tamgl19031997@gmail.com', 'Quang Ngãi');
insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Phạm Minh Đức', 3, 4, 3, '1997-07-12', '123456789', '8.000.000', '0963906991', 'tamgl19031997@gmail.com', 'Đà Nẵng');
insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Hoàng Thị Minh Hà', 5, 3, 4, '1995-03-19', '123456789', '8.000.000', '0963906991', 'tamgl19031997@gmail.com', 'Vinh');
insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Trần Đăng Khoa', 4, 2, 4, '1997-03-19', '123456789', '8.000.000', '0963906991', 'tamgl19031997@gmail.com', 'Huế');
insert into nhanvien(ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values ('Minh Đức', 4, 2, 4, '1995-03-19', '123456789', '8.000.000', '0963906991', 'tamgl19031997@gmail.com', 'Quảng Trị');


insert into khachhang(ho_ten, id_loai_khach, ngay_sinh, so_cmnd, sdt, email, dia_chi) 
values('Trần Dần', 3, '1968-05-22', '012345645', '065565', 'aaaaaa@gmail.com', 'Quảng Trị');
insert into khachhang(ho_ten, id_loai_khach, ngay_sinh, so_cmnd, sdt, email, dia_chi) 
values('Nguyễn Thị A', 4, '1988-05-22', '012345645', '065565', 'aaaaaa@gmail.com', 'Đà Nẵng');
insert into khachhang(ho_ten, id_loai_khach, ngay_sinh, so_cmnd, sdt, email, dia_chi) 
values('Trần Văn B', 2, '1979-05-22', '012345645', '065565', 'aaaaaa@gmail.com', 'Quảng Nam');
insert into khachhang(ho_ten, id_loai_khach, ngay_sinh, so_cmnd, sdt, email, dia_chi) 
values('Trần Văn B', 2, '1979-05-22', '012345645', '065565', 'aaaaaa@gmail.com', 'Quảng Nam');
insert into khachhang(ho_ten, id_loai_khach, ngay_sinh, so_cmnd, sdt, email, dia_chi) 
values('Nguyễn Thị A', 4, '1988-05-22', '012345645', '065565', 'aaaaaa@gmail.com', 'Đà Nẵng');



insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(1, 3, 1, '2021-04-10', '2021-05-10', 2000000, 1600000);
insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(1, 1, 2, '2021-04-10', '2021-05-10', 2000000, 2500000);
insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(1, 1, 2, '2021-01-10', '2021-01-17', 2000000, 2500000);
insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(1, 3, 1, '2019-04-10', '2021-05-10', 2000000, 1600000);
insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(2, 4, 2, '2017-04-10', '2021-05-10', 2000000, 2500000);
insert into hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values(2, 5, 2, '2021-01-10', '2021-01-17', 2000000, 2500000);

insert into hopdongchitiet(id_hop_dong, id_dich_vu_di_kem, so_luong) 
values(1, 1, 3);
insert into hopdongchitiet(id_hop_dong, id_dich_vu_di_kem, so_luong) 
values(2, 3, 10);
insert into hopdongchitiet(id_hop_dong, id_dich_vu_di_kem, so_luong) 
values(3, 3, 10);

--- câu 2:
select * from nhanvien 
where (LENGTH(ho_ten) <= 15 and ho_ten like 'T%') 
or (LENGTH(ho_ten) <= 15 and ho_ten like 'H%')
or (LENGTH(ho_ten) <= 15 and ho_ten like 'K%');

--- câu 3:      
SELECT * FROM khachhang 
WHERE (TIMESTAMPDIFF(YEAR,ngay_sinh,CURDATE()) Between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');


--- câu 4: 
SELECT a.id, a.ho_ten, COUNT(b.id_khach_hang) AS so_lan_dat_phong
FROM khachhang a, hopdong b 
Where a.id=b.id_khach_hang and a.id_loai_khach=1
GROUP BY a.ho_ten
ORDER BY so_lan_dat_phong ASC;

--- câu 5: 
select kh.id, kh.ho_ten, lk.ten_loai_khach, hd.id,
dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, (dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as tong_tien
from khachhang as kh  
left join loaikhach as lk on lk.id=kh.id_loai_khach  
left join hopdong as hd on kh.id = hd.id_khach_hang  
left join dichvu as dv on dv.id=hd.id_dich_vu
left join hopdongchitiet as hdct on hdct.id_hop_dong=hd.id  
left join dichvudikem as dvdk on dvdk.id=hdct.id_dich_vu_di_kem;


--- câu 6:  
select dv.id,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
from dichvu as dv   
 join hopdong as hd on dv.id = hd.id_dich_vu 
 join loaidichvu as ldv on dv.id_loai_dich_vu=ldv.id
WHERE ngay_lam_hop_dong <='2019/1/1';

--- câu 7:
select a.id,ten_dich_vu,dien_tich,so_nguoi_toi_da,chi_phi_thue,b.ten_loai_dich_vu
from dichvu a, loaidichvu b, hopdong c, khachhang d
where a.id_loai_dich_vu=b.id and
a.id=c.id_dich_vu and
c.id_khach_hang=d.id and
year(ngay_lam_hop_dong) = 2018 and year(ngay_lam_hop_dong)<2019;


--- câu 8:  
--- C1: SELECT DISTINCT ho_ten FROM khachhang;
--- C2: SELECT ho_ten FROM khachhang GROUP BY ho_ten HAVING COUNT(id) >= 1;
--- C3: SELECT ho_ten FROM khachhang UNION DISTINCT SELECT ho_ten FROM khachhang;

--- câu 9:
select sum(tong_tien) as doanh_thu
from hopdong 
where MONTH(ngay_lam_hop_dong) in (2);

--- câu 10:
select hopdong.id, hopdong.ngay_lam_hop_dong, hopdong.ngay_ket_thuc, hopdong.tien_dat_coc, dichvudikem.id
from ((hopdongchitiet
		inner join hopdong on hopdongchitiet.id_hop_dong = hopdong.id)
        inner join dichvudikem on hopdongchitiet.id_dich_vu_di_kem = dichvudikem.id)
        having count(dichvudikem.id);

--- câu 11:
select a.id, a.ten_dich_vu_di_kem, a.gia, a.don_vi, a.trang_thai
from dichvudikem as a  
left join hopdongchitiet as d on a.id=d.id_dich_vu_di_kem  
left join hopdong as e on e.id=d.id_hop_dong  
left join khachhang as c on c.id=e.id_khach_hang
left join loaikhach as b on b.id=c.id_loai_khach
where c.dia_chi like '%Vinh%' or c.dia_chi like '%Quảng Ngãi%';


--- câu 12:


--- câu 13:
select DISTINCT a.id, a.ten_dich_vu_di_kem
from hopdongchitiet as b
left join dichvudikem as a on b.id_dich_vu_di_kem = a.id
left join hopdong as c on c.id = b.id_hop_dong
where a.id in (select id_dich_vu_di_kem from hopdongchitiet where so_luong = (select max(so_luong) from hopdongchitiet));

--- câu 14:
Select d.id, b.ten_loai_dich_vu, c.ten_dich_vu_di_kem, d.id_dich_vu_di_kem as solansudung
From hopdong a,loaidichvu b, dichvudikem c, hopdongchitiet d, dichvu e
where c.id=d.id_dich_vu_di_kem and
a.id=d.id_hop_dong and 
a.id_dich_vu=e.id and
e.id_loai_dich_vu=b.id
group by a.id, b.ten_loai_dich_vu, c.ten_dich_vu_di_kem, solansudung
having solansudung=1;

--- câu 15:
select b.id_nhan_vien, a.ho_ten ,d.trinh_do, c.ten_bo_phan, a.sdt, a.dia_chi
from nhanvien a,hopdong b,bophan c, trinhdo d
where a.id=b.id_nhan_vien and
c.id=a.id_bo_phan and
d.id=a.id_trinh_do and
year(ngay_lam_hop_dong) between 2018 and 2019
group by b.id_nhan_vien, a.ho_ten ,d.trinh_do, c.ten_bo_phan, a.sdt, a.dia_chi
having count(b.id_nhan_vien)<=3;

--- câu 16:

delete from nhanvien 
where id in (select id_nhan_vien from hopdong where year(ngay_lam_hop_dong) not between 2017 and 2019);


--- câu 17:
update khachhang set id_loai_khach = 1
where id in (select id_khach_hang from 
(select id_khach_hang
from hopdong as a
left join khachhang as b on b.id = a.id_khach_hang
where year(ngay_lam_hop_dong) = 2019
group by id_khach_hang
having count(id_khach_hang) >=1) a);

--- câu 18:
delete from khachhang
where id in (select id_khach_hang from hopdong where year(NgayLamHopDong)<2016)
;
--- Câu 19:
update dichvudikem 
set gia = gia*2
where id in (select a.id_dich_vu_di_kem from hopdongchitiet a, hopdong b where so_luong > 10 and year(b.ngay_lam_hop_dong) = 2019);


--- câu 20:
SELECT id as id,ho_ten,email,sdt,ngay_sinh,dia_chi FROM khachhang
UNION 
SELECT id as id,ho_ten,email,sdt,ngay_sinh,dia_chi FROM nhanvien;

