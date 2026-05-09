<?php
require_once("model.php");
class Cart extends Model
{   
    // lấy thông tin sản phẩm theo ID
    function detail_sp($id)
    {
        $id = (int)$id;
        $query =  "SELECT * from SanPham where MaSP = $id ";
        $result = $this->conn->query($query);
        return $result->fetch_assoc();
    }

    // Lấy toàn bộ giỏ hàng của user (join để lấy tên, ảnh, giá)
    function get_cart($maND)
    {
        $maND = (int)$maND;
        $query = "SELECT gh.MaGH, gh.MaSP, gh.SoLuong,
                         sp.TenSP, sp.DonGia, sp.HinhAnh1,
                         (gh.SoLuong * sp.DonGia) AS ThanhTien
                  FROM giohang gh
                  JOIN sanpham sp ON gh.MaSP = sp.MaSP
                  WHERE gh.MaND = $maND";
        $result = $this->conn->query($query);
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[$row['MaSP']] = $row;
        }
        return $data;
    }

    // Thêm sản phẩm vào giỏ hàng (nếu đã có thì tăng số lượng)
    function add_cart($maND, $maSP)
    {
        $maND = (int)$maND;
        $maSP = (int)$maSP;

        // Kiểm tra đã có trong giỏ chưa
        $check = $this->conn->query(
            "SELECT * FROM giohang WHERE MaND = $maND AND MaSP = $maSP"
        );
        if ($check->num_rows > 0) {
            // Đã có -> tăng số lượng lên 1
            $this->conn->query(
                "UPDATE giohang SET SoLuong = SoLuong + 1
                 WHERE MaND = $maND AND MaSP = $maSP"
            );
        } else {
            // Chưa có -> thêm mới
            $this->conn->query(
                "INSERT INTO giohang (MaND, MaSP, SoLuong, ThoiGian)
                 VALUES ($maND, $maSP, 1, NOW())"
            );
        }
    }

    // Tăng số lượng 1 sản phẩm
    function update_cart($maND, $maSP)
    {
        $maND = (int)$maND;
        $maSP = (int)$maSP;
        $this->conn->query(
            "UPDATE giohang SET SoLuong = SoLuong + 1
             WHERE MaND = $maND AND MaSP = $maSP"
        );
    }

    // Giảm số lượng 1 sản phẩm (nếu = 1 thì xóa luôn)
    function delete_cart($maND, $maSP)
    {
        $maND = (int)$maND;
        $maSP = (int)$maSP;
        $check = $this->conn->query(
            "SELECT SoLuong FROM giohang WHERE MaND = $maND AND MaSP = $maSP"
        );
        $row = $check->fetch_assoc();
        if ($row && $row['SoLuong'] <= 1) {
            $this->conn->query(
                "DELETE FROM giohang WHERE MaND = $maND AND MaSP = $maSP"
            );
        } else {
            $this->conn->query(
                "UPDATE giohang SET SoLuong = SoLuong - 1
                 WHERE MaND = $maND AND MaSP = $maSP"
            );
        }
    }

    // Xóa hẳn 1 sản phẩm khỏi giỏ
    function deleteall_cart($maND, $maSP)
    {
        $maND = (int)$maND;
        $maSP = (int)$maSP;
        $this->conn->query(
            "DELETE FROM giohang WHERE MaND = $maND AND MaSP = $maSP"
        );
    }

    // Xóa toàn bộ giỏ hàng của user (sau khi đặt hàng)
    function clear_cart($maND)
    {
        $maND = (int)$maND;
        $this->conn->query("DELETE FROM giohang WHERE MaND = $maND");
    }

    // Tính tổng tiền giỏ hàng
    function total_cart($maND)
    {
        $maND = (int)$maND;
        $query = "SELECT SUM(gh.SoLuong * sp.DonGia) AS TongTien
                  FROM giohang gh
                  JOIN sanpham sp ON gh.MaSP = sp.MaSP
                  WHERE gh.MaND = $maND";
        $result = $this->conn->query($query);
        $row = $result->fetch_assoc();
        return $row['TongTien'] ?? 0;
    }

    // Đếm số lượng sản phẩm trong giỏ (dùng cho badge icon giỏ hàng)
    function count_cart($maND)
    {
        $maND = (int)$maND;
        $result = $this->conn->query(
            "SELECT SUM(SoLuong) AS SoSP FROM giohang WHERE MaND = $maND"
        );
        $row = $result->fetch_assoc();
        return $row['SoSP'] ?? 0;
    }

    // Dùng cho danhmuc (giữ nguyên như cũ)
    function danhmuc()
    {
        $query = "SELECT * FROM danhmuc";
        $result = $this->conn->query($query);
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    function chitietdanhmuc($maDM)
    {
        $maDM = (int)$maDM;
        $query = "SELECT * FROM loaisanpham WHERE MaDM = $maDM";
        $result = $this->conn->query($query);
        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }
}