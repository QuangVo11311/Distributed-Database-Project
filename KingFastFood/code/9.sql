USE KingFastFood
GO

-- Câu 9: Xuất ra tổng số lượng nguyên liệu @xyz của tất cả chi nhánh, đồng thời hiển thị số lượng nguyên liệu @xyz của từng chi nhánh.
CREATE PROC proc_showNguyenLieuAllAndOnly
@tenNguyenLieu NVARCHAR(30)
AS
    BEGIN
        DECLARE @SLMienBac INT, @SlMienNam INT, @SLMienTrung INT
        -- Tìm kiếm trên phẩn mảnh MIENNAM
        IF EXISTS(SELECT * FROM NguyenLieu WHERE TenNL like @tenNguyenLieu)
            BEGIN
                -- Lấy SL nguyên liệu ở MIENNAM
                SELECT @SlMienNam = SoLuong FROM CTK ctk, NguyenLieu nl 
                    WHERE nl.MaNL = ctk.MaNL AND nl.TenNL like @tenNguyenLieu

                -- Lấy SL nguyên liệu ở MIENBAC
                SELECT @SLMienBac = SoLuong FROM MIENBAC.KingFastFood.dbo.CTK ctk, NguyenLieu nl 
                    WHERE nl.MaNL = ctk.MaNL AND nl.TenNL like @tenNguyenLieu

                -- Lấy SL nguyên liệu ở MIENTRUNG
                SELECT @SLMienTrung = SoLuong FROM MIENTRUNG.KingFastFood.dbo.CTK ctk, NguyenLieu nl 
                    WHERE nl.MaNL = ctk.MaNL AND nl.TenNL like @tenNguyenLieu

                -- Xuất ra màn hình kết quả
                PRINT CONCAT(N'Tổng số lượng trên toàn chi nhánh: ', @SlMienNam + @SLMienBac + @SLMienTrung)
                PRINT CONCAT(N'Số lượng tại miền nam: ', @SlMienNam)
                PRINT CONCAT(N'Số lượng tại miền bắc: ', @SLMienBac)
                PRINT CONCAT(N'Số lượng tại miền trung: ', @SLMienTrung)
            END
        ELSE
           
            BEGIN
                PRINT N'Tên Nguyên Liệu sai hoặc không tồn tại!'
            END
    END
GO

EXECUTE proc_showNguyenLieuAllAndOnly N'trái bơ'

SELECT * FROM NguyenLieu
