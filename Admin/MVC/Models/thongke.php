<?php
require_once("model.php");

class Thongke extends Model
{
    /**
     * Doanh thu theo tháng trong 1 năm (12 phần tử).
     * Không filter TrangThai vì project chưa chuẩn hóa trạng thái.
     */
    public function revenue_by_month($year)
    {
        $year = (int)$year;
        $query = "
            SELECT MONTH(NgayLap) AS thang, SUM(TongTien) AS doanhthu
            FROM hoadon
            WHERE YEAR(NgayLap) = $year
            GROUP BY MONTH(NgayLap)
            ORDER BY MONTH(NgayLap) ASC
        ";

        $result = $this->conn->query($query);
        $map = [];
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $map[(int)$row['thang']] = (float)($row['doanhthu'] ?? 0);
            }
        }

        $data = [];
        for ($m = 1; $m <= 12; $m++) {
            $data[] = $map[$m] ?? 0;
        }
        return $data;
    }

    /**
     * Đếm số đơn theo trạng thái.
     */
    public function orders_by_status()
    {
        $query = "
            SELECT TrangThai AS trangthai, COUNT(*) AS soluong
            FROM hoadon
            GROUP BY TrangThai
            ORDER BY COUNT(*) DESC
        ";
        $result = $this->conn->query($query);
        $labels = [];
        $values = [];
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $labels[] = (string)$row['trangthai'];
                $values[] = (int)$row['soluong'];
            }
        }
        return ['labels' => $labels, 'values' => $values];
    }

    /**
     * Top sản phẩm theo số lượng bán (mặc định 5).
     */
    public function top_products($limit = 5)
    {
        $limit = (int)$limit;
        if ($limit <= 0) $limit = 5;
        $query = "
            SELECT s.MaSP, s.TenSP, SUM(ct.SoLuong) AS soluong
            FROM chitiethoadon ct
            JOIN sanpham s ON s.MaSP = ct.MaSP
            GROUP BY s.MaSP, s.TenSP
            ORDER BY SUM(ct.SoLuong) DESC
            LIMIT $limit
        ";
        $result = $this->conn->query($query);
        $rows = [];
        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
        }
        return $rows;
    }
}

