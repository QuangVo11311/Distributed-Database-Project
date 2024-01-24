USE KingFastFood
GO

-- Câu 1: Xuất ra danh sách nhân viên của toàn chi nhánh => Lấy danh sách nhân viên toàn chi nhánh.
CREATE PROC proc_getAllNhanVien
AS
    BEGIN
        SELECT * FROM KingFastFood.dbo.NhanVien
        UNION
        SELECT * FROM MIENTRUNG.KingFastFood.dbo.NhanVien
        UNION
        SELECT * FROM MIENBAC.KingFastFood.dbo.NhanVien
    END
GO

EXECUTE proc_getAllNhanVien