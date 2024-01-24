USE KingFastFood
GO

-- Câu 6: Lấy ra danh sách hóa đơn của nhân viên @xyz
CREATE PROC proc_getAllHDNhanVien
@maNV varchar(13)
AS
    BEGIN
        -- Tìm nhân viên tại vị trí phân mảnh MIENNAM
        IF EXISTS(SELECT * FROM NhanVien WHERE MaNV = @maNV)
            BEGIN
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                FROM HoaDon hd WHERE hd.MaNV = @maNV
            END
        ELSE 
            BEGIN
                -- Tìm nhân viên tại vị trí phân mảnh MIENBAC
                IF EXISTS(SELECT * FROM MIENBAC.KingFastFood.dbo.NhanVien WHERE MaNV = @maNV)
                    BEGIN
                        SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                        FROM MIENBAC.KingFastFood.dbo.HoaDon hd WHERE hd.MaNV = @maNV
                    END
                ELSE
                    BEGIN
                        -- Tìm nhân viên tại vị trí phân mảnh MIENTRUNG
                        IF EXISTS(SELECT * FROM MIENTRUNG.KingFastFood.dbo.NhanVien WHERE MaNV = @maNV)
                            BEGIN
                                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                                FROM MIENTRUNG.KingFastFood.dbo.HoaDon hd WHERE hd.MaNV = @maNV
                            END
                        ELSE
                            BEGIN
                                PRINT N'Không tìm thấy nhân viên cần tìm!'
                                PRINT N'Không tìm thấy danh sách hóa đơn!'
                            END
                    END
            END
    END
GO

EXECUTE proc_getAllHDNhanVien 'NV015'

-- SELECT * FROM MIENBAC.KingFastFood.dbo.NhanVien
-- SELECT * FROM MIENBAC.KingFastFood.dbo.HoaDon