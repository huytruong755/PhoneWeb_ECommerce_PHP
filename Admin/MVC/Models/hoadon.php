<?php
require_once("model.php");
class Hoadon extends Model
{
    var $table = "hoadon";
    var $contens = "MaHD";
    function trangthai($id){
        $query = "select * from HoaDon where TrangThai = $id  ORDER BY MaHD DESC";

        require("result.php");

        return $data;
    }
    function chitiethoadon($id){
        $query = "select ct.*, s.TenSP as Ten from chitiethoadon as ct, sanpham as s where ct.MaSP = s.MaSP and ct.MaHD = $id ";

        require("result.php");
        
        return $data;
    }
    
    // Giảm số lượng sản phẩm khi duyệt hóa đơn
    function giam_soluong_sanpham($MaHD)
    {
        $MaHD = (int)$MaHD;
        try {
            // Lấy chi tiết hóa đơn
            $query_ct = "SELECT MaSP, SoLuong FROM chitiethoadon WHERE MaHD = $MaHD";
            $result = $this->conn->query($query_ct);
            
            $this->conn->begin_transaction();
            
            while ($row = $result->fetch_assoc()) {
                $MaSP = (int)$row['MaSP'];
                $SoLuong = (int)$row['SoLuong'];
                
                // Cập nhật SoLuong trong bảng sanpham
                $query_update = "UPDATE sanpham SET SoLuong = SoLuong - $SoLuong WHERE MaSP = $MaSP";
                if (!$this->conn->query($query_update)) {
                    throw new Exception("Giảm số lượng sản phẩm thất bại");
                }
            }
            
            $this->conn->commit();
            return true;
        } catch (Exception $e) {
            $this->conn->rollback();
            return false;
        }
    }
}