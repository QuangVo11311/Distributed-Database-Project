USE KingFastFood
GO

-- Câu 2: Xuất ra một hóa đơn thông qua mã hóa đơn @xyz và cho biết hóa đơn đó thuộc quản lí của chi nhánh nào
ALTER PROC proc_getHoaDon
@maHD nvarchar(13) 
AS
    BEGIN
        -- Tìm kiếm hóa đơn trên chi nhánh phân mảnh hiện tại. Chi nhánh MIENNAM
        IF EXISTS(SELECT * FROM HoaDon WHERE MaHD = @maHD)
            BEGIN
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon, nv.MaCN 
                FROM HoaDon hd, NhanVien nv WHERE hd.MaHD = @maHD AND hd.MaNV = nv.MaNV 
            END
        ELSE
            BEGIN
            -- Tìm kiếm hóa đơn trên chi nhánh MIENBAC
                IF EXISTS(SELECT * FROM MIENBAC.KingFastFood.dbo.HoaDon WHERE MaHD = @maHD)
                    BEGIN
                        SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon, nv.MaCN 
                        FROM MIENBAC.KingFastFood.dbo.HoaDon hd, MIENBAC.KingFastFood.dbo.NhanVien nv 
                        WHERE hd.MaHD = @maHD AND hd.MaNV = nv.MaNV 
                    END
                ELSE
                    BEGIN
                    -- Tìm kiếm hóa đơn trên chi nhánh MIENTRUNG
                        IF EXISTS(SELECT * FROM MIENTRUNG.KingFastFood.dbo.HoaDon WHERE MaHD = @maHD)
                            BEGIN
                                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon, nv.MaCN 
                                FROM MIENTRUNG.KingFastFood.dbo.HoaDon hd, MIENTRUNG.KingFastFood.dbo.NhanVien nv 
                                WHERE hd.MaHD = @maHD AND hd.MaNV = nv.MaNV 
                            END
                        ELSE
                            BEGIN
                                PRINT N'Không tìm thấy hóa đơn!'
                            END
                    END
            END
    END
GO

EXECUTE proc_getHoaDon 'HD0003'