<?php
require_once("model.php");
class Checkout extends Model
{
  function save($data){
    $f = "";
    $v = "";
    $status = false;

    try {
        $this->conn->begin_transaction();

        foreach ($data as $key => $value) {
            $f .= $key . ",";
            $v .= "'" . $value . "',";
        }
        $f = trim($f, ",");
        $v = trim($v, ",");
        $query = "INSERT INTO HoaDon($f) VALUES ($v);";
        $status = $this->conn->query($query);

        if (!$status) {
            throw new Exception("Tao hoa don that bai");
        }

        $MaHD = $this->conn->insert_id;

        foreach ($_SESSION['sanpham'] as $value) {
            $MaSP = $value['MaSP'];
            $SoLuong = $value['SoLuong'];
            $DonGia = $value['DonGia'];
            $query_ct = "INSERT INTO chitiethoadon(MaHD,MaSP,SoLuong,DonGia) VALUES ($MaHD,$MaSP,$SoLuong,$DonGia)";
            $status_ct = $this->conn->query($query_ct);

            if (!$status_ct) {
                throw new Exception("Tao chi tiet hoa don that bai");
            }
        }

        $this->conn->commit();
    } catch (Exception $e) {
        $this->conn->rollback();
        $status = false;
    }

    if ($status == true) {
        setcookie('msg', 'Đăng ký thành công', time() + 2);
        header('location: ?act=checkout&xuli=order_complete');
    } else {
        setcookie('msg', 'Đăng ký không thành công', time() + 2);
        header('location: ?act=checkout');
    }
  }
}