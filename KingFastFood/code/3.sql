USE KingFastFood
GO

-- Câu 3: Xuất ra danh sách các món ăn có sử dụng nguyên liệu @xyz
ALTER PROC proc_getMonAnByNguyenLieu
@tenNguyenLieu NVARCHAR(30)
AS
    BEGIN
        IF EXISTS(SELECT * FROM NguyenLieu WHERE TenNL like @tenNguyenLieu)
            BEGIN
                SELECT ma.TenMA
                FROM MonAn ma, CheBien cb, NguyenLieu nl 
                WHERE ma.MaMA = cb.MaMA 
                AND cb.MANL = nl.MaNL
                AND nl.TenNL like @tenNguyenLieu
            END
        ELSE 
            BEGIN
                PRINT N'Nguyên liệu không hợp lệ!'
                PRINT N'Không tìm thấy món ăn!'
            END
    END
GO

EXECUTE proc_getMonAnByNguyenLieu N'bột mì số 11'