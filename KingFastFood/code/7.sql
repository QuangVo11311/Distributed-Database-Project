USE KingFastFood
GO

-- Câu 7: Xuất ra chi tiết phiếu nhập (tên nguyên liệu, số lượng nhập, tên nhà cung cấp) của một phiếu nhập.
CREATE PROC proc_getCTPNChiTiet
@maPN varchar(13)
AS
    BEGIN
        -- Tìm nhân viên tại vị trí phân mảnh MIENNAM
        IF EXISTS(SELECT * FROM PhieuNhap WHERE MaPhieuNhap = @maPN)
            BEGIN
                SELECT nl.TenNL, ctpn.SoLuong, ncc.TenNCC
                FROM PhieuNhap pn, CTPN ctpn, NguyenLieu nl, NhaCungCap ncc
                WHERE pn.MaPhieuNhap = @maPN
                    AND ctpn.MaPhieuNhap = pn.MaPhieuNhap
                    AND ctpn.MaNL = nl.MaNL
                    AND pn.MaNCC = ncc.MaNCC
            END
        ELSE 
            BEGIN
                -- Tìm nhân viên tại vị trí phân mảnh MIENBAC
                IF EXISTS(SELECT * FROM MIENBAC.KingFastFood.dbo.PhieuNhap WHERE MaPhieuNhap = @maPN)
                    BEGIN
                        SELECT nl.TenNL, ctpn.SoLuong, ncc.TenNCC
                        FROM MIENBAC.KingFastFood.dbo.PhieuNhap pn, MIENBAC.KingFastFood.dbo.CTPN ctpn, 
                            MIENBAC.KingFastFood.dbo.NguyenLieu nl, MIENBAC.KingFastFood.dbo.NhaCungCap ncc
                        WHERE pn.MaPhieuNhap = @maPN
                            AND ctpn.MaPhieuNhap = pn.MaPhieuNhap
                            AND ctpn.MaNL = nl.MaNL
                            AND pn.MaNCC = ncc.MaNCC
                    END
                ELSE
                    BEGIN
                        -- Tìm nhân viên tại vị trí phân mảnh MIENTRUNG
                        IF EXISTS(SELECT * FROM MIENTRUNG.KingFastFood.dbo.PhieuNhap WHERE MaPhieuNhap = @maPN)
                            BEGIN
                                SELECT nl.TenNL, ctpn.SoLuong, ncc.TenNCC
                                FROM MIENTRUNG.KingFastFood.dbo.PhieuNhap pn, MIENTRUNG.KingFastFood.dbo.CTPN ctpn, 
                                    MIENTRUNG.KingFastFood.dbo.NguyenLieu nl, MIENTRUNG.KingFastFood.dbo.NhaCungCap ncc
                                WHERE pn.MaPhieuNhap = @maPN
                                    AND ctpn.MaPhieuNhap = pn.MaPhieuNhap
                                    AND ctpn.MaNL = nl.MaNL
                                    AND pn.MaNCC = ncc.MaNCC
                            END
                        ELSE
                            BEGIN
                                PRINT N'Không tìm thấy phiếu nhập cần tìm!'
                            END
                    END
            END
    END
GO

EXECUTE proc_getCTPNChiTiet 'PN0006'


/**
        SELECT * FROM MIENTRUNG.KingFastFood.dbo.PhieuNhap
        SELECT * FROM MIENTRUNG.KingFastFood.dbo.NhaCungCap
        SELECT * FROM MIENTRUNG.KingFastFood.dbo.CTPN
        SELECT * FROM MIENTRUNG.KingFastFood.dbo.NguyenLieu

                SELECT nl.TenNL, ctpn.SoLuong, ncc.TenNCC
                FROM PhieuNhap pn, CTPN ctpn, NguyenLieu nl, NhaCungCap ncc
                WHERE pn.MaPhieuNhap = 'PN0006'
                    AND ctpn.MaPhieuNhap = pn.MaPhieuNhap
                    AND ctpn.MaNL = nl.MaNL
                    AND pn.MaNCC = ncc.MaNCC
**/