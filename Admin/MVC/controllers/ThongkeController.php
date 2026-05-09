<?php
require_once("MVC/models/thongke.php");

class ThongkeController
{
    var $thongke_model;
    public function __construct()
    {
        $this->thongke_model = new Thongke();
    }

    public function dashboard()
    {
        // view tự load js chart, dữ liệu lấy qua endpoint data()
        require_once("MVC/Views/Admin/index.php");
    }

    public function data()
    {
        header('Content-Type: application/json; charset=utf-8');

        $year = isset($_GET['year']) ? (int)$_GET['year'] : (int)date('Y');
        $top = isset($_GET['top']) ? (int)$_GET['top'] : 5;

        $payload = [
            'year' => $year,
            'revenueByMonth' => $this->thongke_model->revenue_by_month($year),
            'ordersByStatus' => $this->thongke_model->orders_by_status(),
            'topProducts' => $this->thongke_model->top_products($top),
        ];

        echo json_encode($payload);
        exit;
    }
}

