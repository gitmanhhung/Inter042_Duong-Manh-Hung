--- câu 21:
create or replace view V_NHANVIEN as select a.*
from nhanvien as a
join hopdong as b on a.id=b.id_nhan_vien 
where
a.dia_chi like "%Hải Châu%"
and b.ngay_lam_hop_dong = '2019-12-12';


--- câu 22:
update V_NHANVIEN
set dia_chi="Liên Chiểu"
;

--- Câu 23:
create index IX_KHACHHANG on KhachHang(IDKhachHang);

--- câu 24:
EXPLAIN select * from khachhang
where dia_chi like "%Quảng Trị%" and sdt like "%065565%";

CREATE UNIQUE INDEX IX_SoDT_DiaChi
ON khachhang (dia_chi, sdt);

EXPLAIN select * from khachhang
where dia_chi like "%Quảng Trị%" and sdt like "%065565%";

--- Câu 25:
DELIMITER //
CREATE PROCEDURE Sp_1(
IN id_kh INT,
OUT message VARCHAR(50)
)
IF id_kh in (Select id from khachhang) THEN
BEGIN
	DELETE FROM khachhang WHERE khachhang.id = id_kh;
    SET message = "Đã xóa khách hàng" ;
END;
ELSE
BEGIN
SET message = "Khách hàng không tồn tại" ;
END;
END IF;
//  DELIMITER ;
CALL Sp_1(4, @message);
SELECT @message;

--- câu 26:
 DELIMITER //
CREATE PROCEDURE Sp_2(in id_nhan_vien bigint, id_khach_hang bigint, id_dich_vu bigint , 
		ngay_lam_hop_dong date, ngay_ket_thuc date, tien_dat_coc int, tong_tien int)
BEGIN 
INSERT INTO hopdong
VALUES ( id_nhan_vien, id_khach_hang , id_dich_vu , ngay_lam_hop_dong , ngay_ket_thuc , tien_dat_coc, tong_tien ) ;
END 
//  DELIMITER 
call Sp_2(1 , 1, 1, '2020-02-02', '2020-03-03', 700, 1000);

--- câu 27
	
create table tonghopdong(
	total int not null
)

INSERT INTO tonghopdong(total)
SELECT count(id) 
FROM hopdong;
 -----
 
CREATE TRIGGER Tr_1
AFTER DELETE
ON hopdong FOR EACH ROW
UPDATE tonghopdong 
SET total=total-1;

delete from hopdong
where id=2;
select * from tonghopdong;
    
    

--- cau 29a
DELIMITER //
CREATE FUNCTION count_dich_vu(
	tong_tien int
) 
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE dem int;
    IF tong_tien > 2000000 THEN
		SET dem = dem +1;
    END IF;
	-- return the student level
	RETURN (dem);
END//
DELIMITER ;
