<?php
require_once("Models/checkout.php");
require_once("Models/cart.php");
class CheckoutController
{
    var $checkout_model;
    var $cart_model;
    public function __construct()
    {
        $this->checkout_model = new Checkout();
        $this->cart_model = new Cart();
    }
    function list()
    {
        if (isset($_SESSION['login'])) {
            $data_danhmuc = $this->checkout_model->danhmuc();

            $data_chitietDM = array();

            for ($i = 1; $i <= count($data_danhmuc); $i++) {
                $data_chitietDM[$i] = $this->checkout_model->chitietdanhmuc($i);
            }
            
            $maND = $_SESSION['login']['MaND'];
            $sanpham = $this->cart_model->get_cart($maND);
            $count = $this->cart_model->total_cart($maND);
            require_once('Views/index.php');
        } else {
            header('location: ?act=taikhoan');
        }
    }
    function  save()
    {
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $ThoiGian =  date('Y-m-d H:i:s');

        $maND = $_SESSION['login']['MaND'];
        $sanpham = $this->cart_model->get_cart($maND);
        $count = $this->cart_model->total_cart($maND);
        if (empty($sanpham)) {
            setcookie('msg', 'Giỏ hàng trống', time() + 2);
            header('location: ?act=cart');
            exit;
        }

        $data = array(
            'MaND' => $_SESSION['login']['MaND'],
            'NgayLap' => $ThoiGian,
            'NguoiNhan' =>    $_POST['NguoiNhan'],
            'SDT' => $_POST['SDT'],
            'DiaChi' => $_POST['DiaChi'],
            // đồng bộ với UI: tổng giỏ + 15,000 ship
            'TongTien' => $count + 15000,
            'TrangThai'  =>  '0',
        );

        $items = [];
        foreach ($sanpham as $row) {
            $items[] = [
                'MaSP' => (int)$row['MaSP'],
                'SoLuong' => (int)$row['SoLuong'],
                'DonGia' => (float)$row['DonGia'],
            ];
        }

        $this->checkout_model->save($data, $items);

        // nếu save thành công, sẽ redirect/exit trong model
    }
    function order_complete()
    {
        $data_danhmuc = $this->checkout_model->danhmuc();

        $data_chitietDM = array();

        for ($i = 1; $i <= count($data_danhmuc); $i++) {
            $data_chitietDM[$i] = $this->checkout_model->chitietdanhmuc($i);
        }
        $maND = $_SESSION['login']['MaND'];
        
        // Lấy hóa đơn mới nhất của khách hàng
        $order = $this->checkout_model->get_latest_order($maND);
        $order_items = [];
        $order_status_text = "Vui Lòng Chờ Xét Duyệt"; // Default text
        
        if ($order) {
            $order_items = $this->checkout_model->get_order_items($order['MaHD']);
            // Kiểm tra trạng thái hóa đơn
            if ($order['TrangThai'] == 1) {
                $order_status_text = "Đơn hàng của bạn đã được duyệt. Cảm ơn bạn đã mua sắm!";
            } else {
                $order_status_text = "Vui Lòng Chờ Xét Duyệt";
            }
        }
        
        $sanpham = $this->cart_model->get_cart($maND);
        $count = $this->cart_model->total_cart($maND);
        require_once('Views/index.php');
    }
}
