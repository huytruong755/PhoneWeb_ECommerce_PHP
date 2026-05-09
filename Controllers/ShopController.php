<?php
require_once("Models/shop.php");
//Controller gọi Model và gán dữ liệu vào biến
//User->Controller->Model <=> Database -> View -> Hiển thị giao diện
class ShopController
{
    var $shop_model;
    public function __construct()
    {
        //Constructor, khi controller được tạo: tự động tọa object shop
        //=> Controller kết nối với Model
        $this->shop_model = new Shop();
    }
    //Hàm list này sẽ là action chính để hiển thị trang shop
    function list()
    {
        //lấy danh mục và gọi model danhmuc()
        $data_danhmuc = $this->shop_model->danhmuc();

        //lấy loại sản phẩm và gọi 8 loại sản phẩm đầu tiên
        $data_loaisp = $this->shop_model->loaisp(0, 8);

        //tạo mảnh để duyệt từng danh mục ví dụ: có 5 danh mục thì loop từ 1 -> 5
        $data_chitietDM = array();

        for ($i = 1; $i <= count($data_danhmuc); $i++) {
        //lấy chi tiết từng danh mục
            $data_chitietDM[$i] = $this->shop_model->chitietdanhmuc($i);
        }


        // if (isset($_GET['trang'])) {
        //     $id = $_GET['trang'];
        //     $limit = 9;
        //     $start = ($id - 1) * $limit;
        //     $data = $this->shop_model->limit($start, $limit);
        //     $data_noibat = $this->shop_model->sanpham_noibat();
        //     $data_tong = 9;
        // } else {
        //Kiểm tra URL có sp và loai
        if (isset($_GET['sp']) and isset($_GET['loai'])) {
            //lấy chi tiết loai
            $data_loai = $this->shop_model->chitiet_loai($_GET['loai'], $_GET['sp']);
            //nếu có dữ liệu thì lấy sản phẩm thuộc loại đó, và danh mục đó            
            if ($data_loai != null) {
                $data = $this->shop_model->chitiet($data_loai[0]['MaLSP'], $_GET['sp']);
                //lấy ra sản phẩm nổi bật
                $data_noibat = $this->shop_model->sanpham_noibat();
                //lấy ra tổng sản phẩm
                $data_count = $this->shop_model->count_sp_ctdm($_GET['sp'], $data_loai[0]['MaLSP']);
                //lấy số lượng
                $data_tong = $data_count['tong'];
            }
        } else {
            //Nếu chỉ có sản phẩm thì lọc theo danh mục
            if (isset($_GET['sp'])) {
                //lấy sản phẩm theo dnah mục: 9 sản phẩm đầu tiên của danh mục
                //rồi truyền $data sang view như trên để hiển thị
                // Ví dụ: khi người dùng bấm vào Điện thoại Iphone thì URL sẽ thành ?act=shop&sp=2. 
                // Trong đó tham số act=shop gọi là ShopController, sp=2 gọi là Mã danh mục 2.
                // Sau đó gọi $this->shop_model->sanpham_danhmuc(0, 9, $_GET[‘sp’] để Controllers gọi Models lấy 9 sản phẩm đầu tiên có mã danh mục là 2.
                $data = $this->shop_model->sanpham_danhmuc(0, 9, $_GET['sp']);
                $data_noibat = $this->shop_model->sanpham_noibat();
                $data_count = $this->shop_model->count_sp_dm($_GET['sp']);
                $data_tong = $data_count['tong'];
            } else {
                //nếu không thì thực hiện lọc theo giá
                if (isset($_POST['shop'])) {
                    $chuoi = $_POST['shop'];
                    //tách chuỗi 
                    $arr = explode("-", $chuoi);
                    //lọc theo giá
                    $data = $this->shop_model->dongia($arr['0'], $arr['1']);
                    $data_tong = count($data);
                } else {
                    //lọc theo keyword
                    if (isset($_POST['keyword'])) {
                        //tìm kiếm sản phẩm
                        $data = $this->shop_model->keywork($_POST['keyword']);
                        $data_noibat = $this->shop_model->sanpham_noibat();

                        $data_tong = count($data);
                    } else {
                        //nếu không có gì thì lấy trang hiện tại
                        $id = isset($_GET['trang']) ? $_GET['trang'] : 1;
                        $limit = 9;
                        $start = ($id - 1) * $limit;
                        //lấy sản phẩm theo trang
                        $data = $this->shop_model->limit($start, $limit);
                        $data_noibat = $this->shop_model->sanpham_noibat();
                        //$data_tong = 9;
                        // $data = $this->shop_model->limit(0, 9);
                        // $data_noibat = $this->shop_model->sanpham_noibat();
                         $data_count = $this->shop_model->count_sp();
                         $data_tong = $data_count['tong'];
                         $test = 0;
                    }
                }
            }
        }
        //gửi sang view, controller sẽ truyền toàn bộ biến sang view, view dùng $data, $data_noibat, $data_danhmuc để hiển thị HTML
        require_once('Views/index.php');
    }
}
