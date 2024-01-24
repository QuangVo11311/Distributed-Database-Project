USE KingFastFood
GO

-- Câu 10: Xuất ra danh sách nguyên liệu (thông tin nguyên liệu, số lượng nhập, nhập vào chi nhánh nào) đã nhập của toàn bộ chi nhánh trong @xyz tháng gần nhất tính từ thời điểm hiện tại. 
CREATE PROC getThongTinNhapHangGanNhat
@soThang INT
AS
    BEGIN
        -- Lây danh sách sản phẩm nhập của chi nhánh phân mảnh MIENNAM
        SELECT nl.MaNL, nl.TenNL, nl.PhanLoai, nl.DonVi, ctpn.SoLuong, pn.MaCN
        FROM NguyenLieu nl, PhieuNhap pn, CTPN ctpn
        WHERE DATEDIFF(MONTH, pn.NgayNhap, GETDATE()) < @soThang
            AND pn.MaPhieuNhap = ctpn.MaPhieuNhap
            AND ctpn.MaNL = nl.MaNL
        UNION
        -- Lây danh sách sản phẩm nhập của chi nhánh phân mảnh MIENBAC
        SELECT nl.MaNL, nl.TenNL, nl.PhanLoai, nl.DonVi, ctpn.SoLuong, pn.MaCN
        FROM NguyenLieu nl, MIENBAC.KingFastFood.dbo.PhieuNhap pn, MIENBAC.KingFastFood.dbo.CTPN ctpn
        WHERE DATEDIFF(MONTH, pn.NgayNhap, GETDATE()) < @soThang
            AND pn.MaPhieuNhap = ctpn.MaPhieuNhap
            AND ctpn.MaNL = nl.MaNL
        UNION
        -- Lây danh sách sản phẩm nhập của chi nhánh phân mảnh MIENTRUNG
        SELECT nl.MaNL, nl.TenNL, nl.PhanLoai, nl.DonVi, ctpn.SoLuong, pn.MaCN
        FROM NguyenLieu nl, MIENTRUNG.KingFastFood.dbo.PhieuNhap pn, MIENTRUNG.KingFastFood.dbo.CTPN ctpn
        WHERE DATEDIFF(MONTH, pn.NgayNhap, GETDATE()) < @soThang
            AND pn.MaPhieuNhap = ctpn.MaPhieuNhap
            AND ctpn.MaNL = nl.MaNL
    END
GO

EXECUTE getThongTinNhapHangGanNhat 5

PRINT DATEDIFF(MONTH, MONTH(GETDATE())-5+1, MONTH(GETDATE()))
PRINT MONTH(GETDATE()) - 3 + 1

SELECT * FROM NguyenLieu
SELECT * FROM MIENTRUNG.KingFastFood.dbo.PhieuNhap
WHERE DATEDIFF(MONTH, NgayNhap, GETDATE()) < 4