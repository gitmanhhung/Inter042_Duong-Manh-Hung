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

ALTER TABLE nhanvien ADD CONSTRAINT fk_nhanvien_vitri FOREIGN KEY (id_vi_tri) REFERENCES ViTri(id);
ALTER TABLE NhanVien ADD CONSTRAINT fk_NhanVien_TrinhDo FOREIGN KEY (id_trinh_do) REFERENCES TrinhDo(id);
ALTER TABLE NhanVien ADD CONSTRAINT fk_NhanVien_BoPhan FOREIGN KEY (id_bo_phan) REFERENCES BoPhan(id);

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

ALTER TABLE KhachHang ADD CONSTRAINT fk_KhachHang_LoaiKhach FOREIGN KEY (id_loai_khach) REFERENCES LoaiKhach(id);

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

ALTER TABLE DichVu ADD CONSTRAINT fk_DichVu_LoaiDichVu FOREIGN KEY (id_loai_dich_vu) REFERENCES LoaiDichVu(id);
ALTER TABLE DichVu ADD CONSTRAINT fk_DichVu_KieuThue FOREIGN KEY (id_kieu_thue) REFERENCES KieuThue(id);


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

ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_DichVu FOREIGN KEY (id_dich_vu) REFERENCES DichVu(id);
ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_NhanVien FOREIGN KEY (id_nhan_vien) REFERENCES NhanVien(id);
ALTER TABLE HopDong ADD CONSTRAINT fk_HopDong_KhachHang FOREIGN KEY (id_khach_hang) REFERENCES KhachHang(id);

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

ALTER TABLE HopDongChiTiet ADD CONSTRAINT fk_HopDongChiTiet_HopDong FOREIGN KEY (id_hop_dong) REFERENCES HopDong(id);
ALTER TABLE HopDongChiTiet ADD CONSTRAINT fk_HopDongChiTiet_DichVuDiKem FOREIGN KEY (id_dich_vu_di_kem) REFERENCES DichVuDiKem(id);
