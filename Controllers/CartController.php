<?php
require_once("Models/cart.php");

class CartController
{
    var $cart_model;
    
    public function __construct()
    {
        $this->cart_model = new Cart();
    }

    //Hiển thị giỏ hàng
    function list_cart()
    {
        $data_danhmuc = $this->cart_model->danhmuc();
        $data_chitietDM = array();
        for ($i = 1; $i <= count($data_danhmuc); $i++) {
            $data_chitietDM[$i] = $this->cart_model->chitietdanhmuc($i);
        }

        // Phải đăng nhập mới xem được giỏ hàng
        if (!isset($_SESSION['login']['MaND'])) {
            header('Location: ?act=taikhoan&xuli=login');
            exit();
        }

        $maND = $_SESSION['login']['MaND'];
        $sanpham = $this->cart_model->get_cart($maND);
        $count   = $this->cart_model->total_cart($maND);

        require_once('Views/index.php');
    }

    // Thêm sản phẩm vào giỏ
    function add_cart()
    {
        if (!isset($_SESSION['login']['MaND'])) {
            header('Location: ?act=taikhoan&xuli=login');
            exit();
        }

        $maND = $_SESSION['login']['MaND'];
        $maSP = (int)$_GET['id'];

        $this->cart_model->add_cart($maND, $maSP);
        header('Location: ?act=cart#dxd');
        exit();
    }

    // Tăng số lượng
    function update_cart()
    {
        if (!isset($_SESSION['login']['MaND'])) {
            header('Location: ?act=taikhoan&xuli=login');
            exit();
        }

        $maND = $_SESSION['login']['MaND'];
        $maSP = (int)$_GET['id'];

        $this->cart_model->update_cart($maND, $maSP);
        header('Location: ?act=cart#dxd');
        exit();
    }

    // Giảm số lượng (nếu = 1 thì xóa)
    function delete_cart()
    {
        if (!isset($_SESSION['login']['MaND'])) {
            header('Location: ?act=taikhoan&xuli=login');
            exit();
        }

        $maND = $_SESSION['login']['MaND'];
        $maSP = (int)$_GET['id'];

        $this->cart_model->delete_cart($maND, $maSP);
        header('Location: ?act=cart#dxd');
        exit();
    }

    // Xóa hẳn 1 sản phẩm
    function deleteall_cart()
    {
        if (!isset($_SESSION['login']['MaND'])) {
            header('Location: ?act=taikhoan&xuli=login');
            exit();
        }

        $maND = $_SESSION['login']['MaND'];
        $maSP = (int)$_GET['id'];

        $this->cart_model->deleteall_cart($maND, $maSP);
        header('Location: ?act=cart#dxd');
        exit();
    }
}
