USE KingFastFood
GO

-- Câu 8: Xuất ra chi tiết hóa đơn của hóa đơn @xyz: Tên món ăn, Số lượng, Tổng thành tiền của mỗi món ăn
CREATE PROC proc_getCTHDThongTin
@maHD varchar(13)
AS 
    BEGIN
        DECLARE @KHThanhToan NVARCHAR(30), @NVThanhToan NVARCHAR(30), @tongThanhTien FLOAT

        -- Tìm kiếm trên phân mảnh MIENNAM
        IF EXISTS(SELECT * FROM HoaDon WHERE MaHD = @maHD)
            BEGIN
                -- Xuất ra danh sách món ăn, thành tiền của món ăn
                SELECT ma.TenMA, cthd.SoLuong, cthd.SoLuong*ma.DonGia 'ThanhTien' 
                FROM CTHD cthd, MonAn ma, HoaDon hd
                WHERE hd.MaHD = @maHD
                    AND hd.MaHD = cthd.MaHD
                    AND cthd.MaMA = ma.MaMA
            END
        ELSE 
            BEGIN
                -- Tìm kiếm trên phân mảnh MIENBAC
                IF EXISTS(SELECT * FROM MIENBAC.KingFastFood.dbo.HoaDon WHERE MaHD = @maHD)
                    BEGIN
                        -- Xuất ra danh sách món ăn, thành tiền của món ăn
                        SELECT ma.TenMA, cthd.SoLuong, cthd.SoLuong*ma.DonGia 'ThanhTien' 
                        FROM MIENBAC.KingFastFood.dbo.CTHD cthd, MIENBAC.KingFastFood.dbo.MonAn ma, MIENBAC.KingFastFood.dbo.HoaDon hd
                        WHERE hd.MaHD = @maHD
                            AND hd.MaHD = cthd.MaHD
                            AND cthd.MaMA = ma.MaMA
                    END
                ELSE 
                    BEGIN
                        -- Tìm kiếm trên phân mảnh MIENTRUNG
                        IF EXISTS(SELECT * FROM MIENTRUNG.KingFastFood.dbo.HoaDon WHERE MaHD = @maHD)
                            BEGIN
                                -- Xuất ra danh sách món ăn, thành tiền của món ăn
                                SELECT ma.TenMA, cthd.SoLuong, cthd.SoLuong*ma.DonGia 'ThanhTien' 
                                FROM MIENTRUNG.KingFastFood.dbo.CTHD cthd, MIENTRUNG.KingFastFood.dbo.MonAn ma, MIENTRUNG.KingFastFood.dbo.HoaDon hd
                                WHERE hd.MaHD = @maHD
                                    AND hd.MaHD = cthd.MaHD
                                    AND cthd.MaMA = ma.MaMA
                            END
                        ELSE 
                            BEGIN
                                PRINT N'Không tìm thấy hóa đơn!'
                            END  
                    END  
            END            
    END
GO

EXECUTE proc_getCTHDThongTin 'HD0003'


-----------------
SELECT * FROM MonAn
SELECT * FROM MIENTRUNG.KingFastFood.dbo.HoaDon
SELECT * FROM MIENTRUNG.KingFastFood.dbo.CTHD WHERE MaHD = 'HD0001'

                SELECT ma.TenMA, cthd.SoLuong, cthd.SoLuong*ma.DonGia 'thanhTien'  FROM CTHD cthd, MonAn ma, HoaDon hd
                WHERE hd.MaHD = 'HD0001'
                    AND hd.MaHD = cthd.MaHD
                    AND cthd.MaMA = ma.MaMA