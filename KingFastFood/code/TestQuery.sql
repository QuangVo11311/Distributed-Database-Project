USE KingFastFood
GO

INSERT INTO MIENTRUNG.KingFastFood.dbo.NhanVien(MaNV, MaCV, TenNV, CMND, SDT, MaCN)
VALUES('NV032', 'NVBV', N'H?u To�n', '079202222512', '0888296645', 'MIENTRUNG')

SELECT* FROM ChucVu
SELECT * FROM NhanVien

SELECT * FROM MIENTRUNG.KingFastFood.dbo.NhanVien

UPDATE KingFastFood.dbo.NhanVien
SET TenNV = 'L�m Ch� B?o'
WHERE MaNV = 'NV032'