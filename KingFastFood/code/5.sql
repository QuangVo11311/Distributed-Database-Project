USE KingFastFood
GO

-- Câu 5: Lấy ra danh sách hóa đơn của khách hàng @xyz
CREATE PROC proc_getAllHDKhachHang
@maKH varchar(13)
AS
    BEGIN
        -- Tìm khách hàng tại vị trí phân mảnh MIENNAM
        IF EXISTS(SELECT * FROM KhachHang WHERE MaKH = @maKH)
            BEGIN
                SELECT hd.MaHD, hd.MaNV, hd.MaKH, hd.MaGiamGia, hd.NgayBan, hd.TongHoaDon 
                FROM HoaDon hd WHERE hd.MaKH = @maKH
            END
        ELSE 
            BEGIN
                PRINT N'Không tìm thấy khách hàng cần tìm!'
                PRINT N'Không tìm thấy danh sách hóa đơn!'
            END
    END
GO

EXECUTE proc_getAllHDKhachHang 'KH019'

-- SELECT * FROM HoaDon