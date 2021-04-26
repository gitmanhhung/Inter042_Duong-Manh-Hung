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

--- câu 8:  
--- C1: SELECT DISTINCT ho_ten FROM khachhang;
--- C2: SELECT ho_ten FROM khachhang GROUP BY ho_ten HAVING COUNT(id) >= 1;
--- C3: SELECT ho_ten FROM khachhang UNION DISTINCT SELECT ho_ten FROM khachhang;