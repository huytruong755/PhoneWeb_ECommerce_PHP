<?php
require_once("MVC/models/hoadon.php");
class HoaDonController
{
    var $hoadon_model;
    public function __construct()
    {
        $this->hoadon_model = new Hoadon();
    }
    function list()
    {
        $data = array();
        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            if ($id > 1) {
                $id = 0;
            }
            $data = $this->hoadon_model->trangthai($id);
        } else {
            $data = $this->hoadon_model->All();
        }
        require_once("MVC/Views/Admin/index.php");
    }
    function xetduyet()
    {
        if (!isset($_GET['id'])) {
            setcookie('msg', 'Hóa đơn không hợp lệ', time() + 2);
            header('Location: ?mod=hoadon');
            exit;
        }
        
        try {
            $MaHD = $_GET['id'];
            
            // Cập nhật trạng thái hóa đơn trực tiếp (không dùng update() của Model vì nó redirect)
            $query = "UPDATE hoadon SET TrangThai = 1 WHERE MaHD = " . (int)$MaHD;
            if (!$this->hoadon_model->conn->query($query)) {
                throw new Exception("Cập nhật trạng thái hóa đơn thất bại");
            }
            
            // Giảm số lượng sản phẩm từ kho
            if ($this->hoadon_model->giam_soluong_sanpham($MaHD)) {
                setcookie('msg', 'Duyệt hóa đơn thành công và cập nhật kho', time() + 2);
            } else {
                setcookie('msg', 'Duyệt hóa đơn thành công nhưng cập nhật kho thất bại', time() + 2);
            }
            
            header('Location: ?mod=hoadon');
            exit;
        } catch (Exception $e) {
            setcookie('msg', 'Duyệt không thành công: ' . $e->getMessage(), time() + 2);
            header('Location: ?mod=hoadon');
            exit;
        }
    }
    function delete()
    {
        if (isset($_GET['id'])) {
            try {
                $this->hoadon_model->delete($_GET['id']);
            } catch (Exception $e) {
                setcookie('msg', 'Xóa không thành công', time() + 2);
                header('Location: ?mod=hoadon');
            }
        }
    }
    function chitiet()
    {
        $id = isset($_GET['id']) ? $_GET['id'] : 1;
        $data = $this->hoadon_model->chitiethoadon($id);
        require_once("MVC/Views/Admin/index.php");
    }
}
