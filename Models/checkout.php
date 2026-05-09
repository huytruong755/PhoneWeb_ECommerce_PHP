<?php
require_once("model.php");
class Checkout extends Model
{
  function save($data, $items)
  {
    // $items: mảng [{MaSP, SoLuong, DonGia}]
    $this->conn->begin_transaction(); //nếu transaction thành công thì lưu toàn bộ commit, nếu có lỗi sẽ rollback toàn bộ
    try {
      //tạo danh sach field và calue
      $f = "";
      $v = "";
      //dữ liệu hóa hóa đơn
      foreach ($data as $key => $value) {
        //ghép tên cột
        $f .= $key . ",";
        // giữ số là số (TongTien, MaND...), chuỗi thì quote vd: 50000,
        if (is_numeric($value)) {
          $v .= $value . ",";
        } else {
          //Nếu là chuỗi thì thêm dấu ' vd: 'Huy','HCM',...
          $safe = str_replace("'", "\\'", (string)$value);
          $v .= "'" . $safe . "',";
        }
      }
      //xóa dấu phẩy cuối
      $f = trim($f, ",");
      $v = trim($v, ",");
      //tạo câu insert
      //vd: INSERT INTO HoaDon(TenKH,TongTien)
      //    VALUE('Huy',50000)
      $query = "INSERT INTO HoaDon($f) VALUES ($v);";
      //chạy query
      $status = $this->conn->query($query);
      //nếu lỗi thì ném exception để transaction rollback
      if (!$status) {
        throw new Exception("Insert hoadon failed");
      }
      //lấy ID hóa đơn vừa tạo
      $MaHD = (int)$this->conn->insert_id;
      //Thêm chi tiết hóa đơn
      foreach ($items as $it) {
        //Eps kiểu dữ liệu
        $MaSP = (int)$it['MaSP'];
        $SoLuong = (int)$it['SoLuong'];
        $DonGia = (float)$it['DonGia'];
        //Insert vòa bảng chi tiết
        $query_ct = "INSERT INTO chitiethoadon(MaHD,MaSP,SoLuong,DonGia) VALUES ($MaHD,$MaSP,$SoLuong,$DonGia)";
        $status_ct = $this->conn->query($query_ct);
        if (!$status_ct) {
          throw new Exception("Insert chitiethoadon failed");
        }
      }
      //Như vậy thì hoadon và chitiethoa mới được lưu vòa database
      $this->conn->commit();

      // clear giỏ hàng sau khi đặt thành công
      if (isset($data['MaND'])) {
        $maND = (int)$data['MaND'];
        $this->conn->query("DELETE FROM giohang WHERE MaND = $maND");
      }
      //tạo thông báo
      setcookie('msg', 'Đặt hàng thành công', time() + 2);
      //chuyển hướng trang
      header('location: ?act=checkout&xuli=order_complete');
      exit;
      //nó sẽ bắt lỗi khi đặt hàng không thành công
    } catch (Exception $e) {
      $this->conn->rollback();
      setcookie('msg', 'Đặt hàng không thành công', time() + 2);
      header('location: ?act=checkout');
      exit;
    }
  }
}