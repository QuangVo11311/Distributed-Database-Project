USE KingFastFood
GO

-- Câu 4: Xuất ra danh sách các hóa đơn của toàn chi nhánh có chứa các món ăn @xyz
CREATE PROC proc_getAllHoaDonHaveMonAn
@tenMonAn NVARCHAR(30)
AS
    BEGIN
        IF EXISTS(SELECT * FROM MonAn WHERE TenMA like @tenMonAn)
            BEGIN
                -- Truy vấn trên MIENNAM
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                FROM HoaDon hd, MonAn ma, CTHD cthd
                WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like @tenMonAn 
                UNION
                -- Truy vấn trên MIENBAC
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                FROM MIENBAC.KingFastFood.dbo.HoaDon hd, MIENBAC.KingFastFood.dbo.MonAn ma, MIENBAC.KingFastFood.dbo.CTHD cthd
                WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like @tenMonAn 
                UNION
                -- Truy vấn trên MIENTRUNG
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                FROM MIENTRUNG.KingFastFood.dbo.HoaDon hd, MIENTRUNG.KingFastFood.dbo.MonAn ma, MIENTRUNG.KingFastFood.dbo.CTHD cthd
                WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like @tenMonAn 
            END
        ELSE
            BEGIN
                PRINT N'Không tìm thấy món ăn!'
            END
    END
GO

EXECUTE proc_getAllHoaDonHaveMonAn N'gà chiên nước mắm'

/**
        SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
        FROM HoaDon hd, MonAn ma, CTHD cthd
        WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like N'gà chiên nước mắm' 

        SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
        FROM MIENBAC.KingFastFood.dbo.HoaDon hd, MIENBAC.KingFastFood.dbo.MonAn ma, MIENBAC.KingFastFood.dbo.CTHD cthd
        WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like N'gà chiên nước mắm'

        SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
        FROM MIENTRUNG.KingFastFood.dbo.HoaDon hd, MIENTRUNG.KingFastFood.dbo.MonAn ma, MIENTRUNG.KingFastFood.dbo.CTHD cthd
        WHERE hd.MaHD = cthd.MaHD AND cthd.MaMA = ma.MaMA AND ma.TenMA like N'gà chiên nước mắm'
**/