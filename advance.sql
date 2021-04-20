

/*cau 21*/
CREATE VIEW v_NHANVIEN AS
SELECT *
FROM NhanVien nv
where nv.DiaChi='hai chau' and nv.idNhanVien in(select idNhanVien from hopdong where NgayLamHopDong='2019/12/12');

/*cau 22*/
update v_nhanvien 
set DiaChi = 'lien chieu';

/*cau 23*/

CREATE INDEX IX_KHACHHANG
ON KhachHang (idKhachHang);

/*cau 24*/

alter table KhachHang  add unique ix_KH(diaChi);

EXPLAIN SELECT
   *
FROM
   KhachHang where diachi='hai chau';
   
   /*cau 25*/
DELIMITER //
CREATE PROCEDURE Sp_1(
IN id_Sp1 INT,
OUT message VARCHAR(50)
)
IF id_Sp1 in (Select idKhachHang from KhachHang) THEN
BEGIN
	DELETE FROM KhachHang WHERE KhachHang.idKhachHang = id_Sp1;
    SET message = "Đã xóa Khách Hàng" ;
END;
ELSE
BEGIN
SET message = "Khách Hàng không tồn tại" ;
END;
END IF;
//  DELIMITER ;

CALL Sp_(7, @message);
SELECT @message;
DELIMITER //

  /*cau 26*/
  DELIMITER //
CREATE PROCEDURE Sp_2(
IN id_hd INT,id_nv int,id_kh int, id_dv int,st int,nlhd date,nkt date,tc int,tt int,
OUT message VARCHAR(50)
)
IF id_hd not in (Select idHopDong from HopDong) 
and id_nv  in (Select idNhanVien from NhanVien) 
and id_kh  in (Select idKhachHang from khachhang)
and id_dv  in (Select idDichVu from DichVu)  THEN
BEGIN
	INSERT INTO HopDong
VALUES (id_hd, id_nv, id_kh, id_dv, st, nlhd, nkt, tc, tt);
    SET message = "Đã thêm hợp đồng" ;
END;
ELSE
BEGIN
SET message = "lỗi ràng buộc" ;
END;
END IF;
//  DELIMITER ;
CALL Sp_2(10,1,1,1,3,'2021/02/02','2021/02/02',34343,3434444, @message);
SELECT @message as thông_báo;
//  DELIMITER ;
 /*cau 27*/
 CREATE TRIGGER tr_1
    BEFORE DELETE ON hopdong
    FOR EACH ROW 
	INSERT INTO student_audit
	SET action = 'delete',
     changedat = NOW();
     
/*cau 29*/
/*cau a*/
DELIMITER //
CREATE FUNCTION Func_1(t int)
RETURNS int
DETERMINISTIC
begin
 DECLARE Tong int
    SELECT count(idDichVu) into tong
    FROM hopdong
    WHERE TongTien>2000;
 return (tong);
end
 DELIMITER ;
SELECT * FROM  Func_1 ;