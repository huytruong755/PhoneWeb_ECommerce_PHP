-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 04, 2025 lúc 07:53 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopphone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `Id` int(11) NOT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`Id`, `HinhAnh`) VALUES
(3, 'img/banners/banner1.jpg'),
(4, 'img/banners/banner2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MaHD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDM` int(11) NOT NULL,
  `TenDM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`MaDM`, `TenDM`) VALUES
(1, 'Iphone'),
(2, 'Apple Watch'),
(3, 'MacBook');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `MaND` int(11) NOT NULL,
  `NgayLap` datetime NOT NULL,
  `NguoiNhan` varchar(50) NOT NULL,
  `SDT` varchar(20) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `PhuongThucTT` varchar(20) NOT NULL,
  `TongTien` float NOT NULL,
  `TrangThai` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `MaKM` int(11) NOT NULL,
  `TenKM` varchar(100) NOT NULL,
  `LoaiKM` varchar(20) NOT NULL,
  `GiaTriKM` float(11,0) NOT NULL,
  `NgayBD` datetime NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `khuyenmai`
--

INSERT INTO `khuyenmai` (`MaKM`, `TenKM`, `LoaiKM`, `GiaTriKM`, `NgayBD`, `TrangThai`) VALUES
(1, 'Không khuyến mãi', 'Nothing', 0, '2019-04-08 00:00:00', 1),
(2, 'Giảm giá', 'GiamGia', 500000, '2019-05-01 00:00:00', 1),
(3, 'Giá rẻ online', 'GiaReOnline', 650000, '2019-05-01 00:00:00', 1),
(4, 'Trả góp', 'TraGop', 0, '2019-05-01 00:00:00', 1),
(5, 'Mới ra mắt', 'MoiRaMat', 0, '2019-05-01 00:00:00', 1),
(13, 'Thích thì khuyến mãi', 'Khuyến mãi Ok', 100, '2020-07-18 11:26:06', 1),
(14, '', '', 0, '2020-07-21 10:10:45', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLSP` int(11) NOT NULL,
  `TenLSP` varchar(70) NOT NULL,
  `HinhAnh` varchar(200) NOT NULL,
  `Mota` varchar(200) NOT NULL,
  `MaDM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLSP`, `TenLSP`, `HinhAnh`, `Mota`, `MaDM`) VALUES
(44, 'iPhone 15', 'Apple.jpg', 'iPhone 15', 1),
(45, 'iPhone 16', 'Apple.jpg', 'iPhone 16', 1),
(46, 'iPhone 14', 'Apple.jpg', 'iPhone 14', 1),
(47, 'iPhone 13', 'Apple.jpg', 'iPhone 13', 1),
(48, 'iPhone 12', 'Apple.jpg', 'iPhone 12', 1),
(49, 'iPhone 11', 'Apple.jpg', 'iPhone 11', 1),
(50, 'iPhone XS/XSM', 'Apple.jpg', 'iPhone XS/XSM', 1),
(51, 'Macbook Pro', 'Apple58-b_6.jpg', 'Macbook Pro', 3),
(52, 'Macbook Air', 'Apple58-b_6.jpg', 'Macbook Air', 3),
(53, 'IMacbook', 'Apple58-b_6.jpg', 'IMacbook', 3),
(54, 'Apple Watch S10', 'Apple58-b_6.jpg', 'Apple Watch S10', 2),
(55, 'Apple Watch S9', 'Apple58-b_6.jpg', 'Apple Watch S9', 2),
(56, 'Apple Watch S8', 'Apple58-b_6.jpg', 'Apple Watch S8', 2),
(57, 'Apple Watch S7', 'Apple58-b_6.jpg', 'Apple Watch S7', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaND` int(11) NOT NULL,
  `Ho` varchar(20) NOT NULL,
  `Ten` varchar(20) NOT NULL,
  `GioiTinh` varchar(10) NOT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `DiaChi` varchar(200) NOT NULL,
  `TaiKhoan` varchar(100) NOT NULL,
  `MatKhau` varchar(100) NOT NULL,
  `MaQuyen` int(11) NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MaND`, `Ho`, `Ten`, `GioiTinh`, `SDT`, `Email`, `DiaChi`, `TaiKhoan`, `MatKhau`, `MaQuyen`, `TrangThai`) VALUES
(14, 'admin', 'admin', 'nam', '1234567890', 'admin@gmail.com', 'nui thanh', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `MaQuyen` int(11) NOT NULL,
  `TenQuyen` varchar(20) NOT NULL,
  `ChiTietQuyen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`MaQuyen`, `TenQuyen`, `ChiTietQuyen`) VALUES
(1, 'Customer', 'Khách hàng có tài khoản'),
(2, 'Admin', 'Quản trị viên'),
(3, 'Personnel', 'Nhân Viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `MaLSP` int(11) NOT NULL,
  `MaDM` int(11) NOT NULL,
  `TenSP` varchar(70) NOT NULL,
  `DonGia` int(11) NOT NULL,
  `SoLuong` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `HinhAnh1` varchar(200) NOT NULL,
  `HinhAnh2` varchar(255) DEFAULT NULL,
  `HinhAnh3` varchar(255) DEFAULT NULL,
  `MaKM` int(11) NOT NULL,
  `ManHinh` varchar(50) DEFAULT NULL,
  `HDH` varchar(50) DEFAULT NULL,
  `CamSau` varchar(50) DEFAULT NULL,
  `CamTruoc` varchar(50) DEFAULT NULL,
  `CPU` varchar(50) DEFAULT NULL,
  `Ram` varchar(50) DEFAULT NULL,
  `Rom` varchar(50) DEFAULT NULL,
  `SDCard` varchar(50) DEFAULT NULL,
  `Pin` varchar(50) DEFAULT NULL,
  `SoSao` int(11) NOT NULL,
  `SoDanhGia` int(11) NOT NULL,
  `TrangThai` int(11) NOT NULL,
  `MoTa` text NOT NULL,
  `ThoiGian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaLSP`, `MaDM`, `TenSP`, `DonGia`, `SoLuong`, `HinhAnh1`, `HinhAnh2`, `HinhAnh3`, `MaKM`, `ManHinh`, `HDH`, `CamSau`, `CamTruoc`, `CPU`, `Ram`, `Rom`, `SDCard`, `Pin`, `SoSao`, `SoDanhGia`, `TrangThai`, `MoTa`, `ThoiGian`) VALUES
(60, 45, 1, 'iPhone 16 Pro Max 256GB - Chính Hãng Apple', 27900000, 10, 'img/products/iphone-16-pro-titan-tu-nhien-9497.png', '/img/products/iphone-16-pro-max-tu-nhien-1-3141.jpg', '/img/products/iphone-16-pro-max-tu-nhien-4-9234.jpg', 4, 'Kích thước màn hình 6.9 inches   Công nghệ màn hìn', 'iOS 18', 'Camera chính: 48MP, f/1.78, 24mm, 2µm, chống rung ', 'Camera trước  12MP, ƒ/1.9, Tự động lấy nét theo ph', 'CPU 6 lõi mới với 2 lõi hiệu năng và 4 lõi hiệu su', '8GB', '356GB', 'Không', '5000mAh', 0, 0, 1, '<p><strong data-start=\"0\" data-end=\"10\">iPhone</strong> là dòng điện thoại thông minh (smartphone) do <strong data-start=\"57\" data-end=\"71\">Apple Inc.</strong> phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:23:10'),
(61, 45, 1, 'iPhone 16 Pro 256GB - Chính Hãng Apple', 29500000, 10, 'img/products/iphone-16-pro-titan-tu-nhien-9497.png', '/img/products/iphone-16-pro-max-tu-nhien-1-3141.jpg', '/img/products/iphone-16-pro-max-tu-nhien-4-9234.jpg', 2, 'Kích thước màn hình 6.3 inches', 'IOS 18', 'Camera chính: 48MP, f/1.78, 24mm, chống rung quang', '12MP, ƒ/1.9, Tự động lấy nét theo pha Focus Pixels', 'CPU 6 lõi mới với 2 lõi hiệu năng và 4 lõi tiết ki', '8GB', '256GB', 'không', '5000mAh', 0, 0, 1, '<p><strong data-start=\"0\" data-end=\"10\">iPhone</strong> là dòng điện thoại thông minh (smartphone) do <strong data-start=\"57\" data-end=\"71\">Apple Inc.</strong> phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:25:09'),
(62, 45, 1, 'iPhone 16 Plus 128GB - Chính Hãng Apple', 25990000, 10, 'img/products/iphone-16-xanh-luli-6459.png', '/img/products/iphone-16-luu-ly-2-5265.jpg', '/img/products/iphone-16-luu-ly-1-6471.jpg', 4, 'Kích thước màn hình  6.7 inches  Công nghệ màn hìn', 'iOS 18', 'Camera chính: 48MP, f/1.6, 26mm, Focus Pixels 100%', '12MP, ƒ/1.9, Tự động lấy nét theo pha Focus Pixels', 'CPU 6 lõi mới với 2 lõi hiệu năng và 4 lõi tiết ki', '8GB', '128GB', 'không', '5000mAh', 0, 0, 1, '<p><strong data-start=\"0\" data-end=\"10\">iPhone</strong> là dòng điện thoại thông minh (smartphone) do <strong data-start=\"57\" data-end=\"71\">Apple Inc.</strong> phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:25:15'),
(63, 44, 1, 'iPhone 15 Pro Max 256GB - Chính Hãng Apple', 27900000, 10, 'img/products/iphone-15-pro-max-titanium-2-1774.jpg', '/img/products/iphone-15-pro-max-titanium-3-4663.jpg', '/img/products/iphone-15-pro-max-titanium-4-1864.jpg', 2, 'Công nghệ màn hình LTPO Super Retina XDR OLEDAlway', 'Hệ điều hành iOS 17', 'Độ phân giải camera sau (MP) TOF 3D LiDAR scanner ', 'Độ phân giải camera trước (MP) 12 MP, f/1.9, 23mm ', 'Chipset (CPU) Apple A17 Pro (3 nm)', '6GB', '256GB', 'Không', '5000mAh', 0, 0, 1, '<p><span style=\"color: rgb(8, 27, 58); font-family: SegoeuiPc, \"Segoe UI\", \"San Francisco\", \"Helvetica Neue\", Helvetica, \"Lucida Grande\", Roboto, Ubuntu, Tahoma, \"Microsoft Sans Serif\", Arial, sans-serif; font-size: 15px; letter-spacing: 0.2px; white-space-collapse: preserve; background-color: rgb(219, 235, 255);\">iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</span></p>', '2025-05-05 00:23:17'),
(64, 44, 1, 'iPhone 15 128GB - Chính Hãng Apple', 15900000, 10, 'img/products/iphone-15-plus-vang-1-7426.jpg', '/img/products/iphone-15-plus-vang-2-2467.jpg', '/img/products/iphone-15-plus-vang-3-3053.jpg', 2, 'Công nghệ màn hình LTPO Super Retina XDR OLEDAlway', 'IOS 17', 'Độ phân giải camera sau (MP) 12 MP, f/2.4, 13mm, 1', 'Độ phân giải camera trước (MP) 12 MP, f/1.9, 23mm ', 'Chip đồ họa (GPU)Apple GPU (5 Nhân)', '8GB', '128GB', 'không', '5000mAh', 0, 0, 1, '<p>iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:25:20'),
(65, 44, 1, 'iPhone 15 Pro 128GB - Chính Hãng Apple', 20700000, 10, 'img/products/iphone-15-pro-max-titanium-2-1774.jpg', '/img/products/iphone-15-pro-max-titanium-3-4663.jpg', '/img/products/iphone-15-pro-max-titanium-4-1864.jpg', 2, 'Công nghệ màn hình LTPO Super Retina XDR OLEDAlway', 'IOS 17', 'Độ phân giải camera sau (MP) TOF 3D LiDAR scanner ', 'Độ phân giải camera trước (MP) 12 MP, f/1.9, 23mm ', 'Chipset (CPU) Apple A17 Pro (3 nm)  Tốc độ CPU 6 n', '8GB', '128GB 256GB 512GB 1TB', 'không ', '5000mAh', 0, 0, 1, '<p>iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:25:38'),
(66, 46, 1, 'iPhone 14 128GB - Chính Hãng Apple', 15000000, 10, 'img/products/iphone-14-2-8604.jpeg', '/img/products/iphone-14-7572.jpeg', '/img/products/iphone-14-mau-tim-8096.jpg', 3, '6.1 inches 2532 x 1170 pixels', 'IOS 17 ', '– camera kép 12 MP, f/1.5 – Camera góc rộng 12 MP,', '12 MP, ƒ/1.9 Camera trước với tính năng tự động lấ', 'Apple A15 Bionic', '8GB', '128 GB', 'không', '5000mAh', 0, 0, 1, '<p><span style=\"color: rgb(8, 27, 58); font-family: SegoeuiPc, \"Segoe UI\", \"San Francisco\", \"Helvetica Neue\", Helvetica, \"Lucida Grande\", Roboto, Ubuntu, Tahoma, \"Microsoft Sans Serif\", Arial, sans-serif; font-size: 15px; letter-spacing: 0.2px; white-space-collapse: preserve; background-color: rgb(219, 235, 255);\">iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</span></p>', '2025-05-05 00:23:47'),
(67, 46, 1, 'IPhone 14 Pro Max 256GB - Chính Hãng Apple ', 19500000, 10, 'img/products/ip-14-pro-max-trang-1-7276.jpg', '/img/products/ip-14-pro-max-trang-3-5066.jpg', '/img/products/ip-14-pro-max-trang-4-2185.jpg', 2, '6.7 inches 2796 x 1290 pixels', 'IOS 17', 'Camera chính: 48MP Camera góc siêu rộng: 12MP Came', '12 MP', 'Apple A16 Bionic', '8GB', '256 GB', 'không', '5000mAh', 0, 0, 0, '<p><span style=\"color: rgb(8, 27, 58); font-family: SegoeuiPc, \"Segoe UI\", \"San Francisco\", \"Helvetica Neue\", Helvetica, \"Lucida Grande\", Roboto, Ubuntu, Tahoma, \"Microsoft Sans Serif\", Arial, sans-serif; font-size: 15px; letter-spacing: 0.2px; white-space-collapse: preserve; background-color: rgb(219, 235, 255);\">iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</span></p>', '2025-05-04 23:49:21'),
(68, 47, 1, 'iPhone 13 Pro Max 128GB - Chính Hãng Apple ', 12500000, 10, 'img/products/ip-13-pro-max-xanh-reu-a1-4140.jpg', '/img/products/ip-13-pro-max-xanh-reu-a1-2-6120.jpg', '/img/products/ip-13-pro-max-xanh-reu-a1-4-9138.jpg', 2, ' Công nghệ màn hình	OLED LPTO Độ phân giải	2778×12', 'IOS 17', 'Cụm 3 camera gồm có: – 12 MP: Kích thước khẩu độ: ', 'Độ phân giải: 12 MP (Thời gian bay (ToF), EIS, HDR', 'Apple A15 Bionic', '6GB', '128GB', 'không', '4000mAh', 0, 0, 1, '<p>iPhone là dòng điện thoại thông minh (smartphone) do Apple Inc. phát triển và lần đầu ra mắt vào năm 2007. Đây là sản phẩm mang tính cách mạng, kết hợp điện thoại, trình duyệt web, máy nghe nhạc và máy ảnh vào một thiết bị duy nhất. iPhone nổi bật với thiết kế cao cấp, hệ điều hành iOS mượt mà, và hệ sinh thái chặt chẽ với các sản phẩm khác của Apple như MacBook, iPad, Apple Watch, AirPods,…</p>', '2025-05-05 00:23:54'),
(69, 51, 3, 'Macbook Air M3 15 2024 8CPU 10GPU/8GB/256GB', 33500000, 10, 'img/products/macbook-air-m3-xam-1-9132.jpg', '/img/products/macbook-air-m3-xam-4-5682.jpg', '/img/products/macbook-air-m3-xam-5-9749.jpg', 1, 'Kích thước màn hình 15.3 inch và 13 inch  Công ngh', 'OS macOS Version Ventura', 'Không', 'Không', 'Hãng CPU Apple  Công nghệ CPU M3  Loại CPU 8 - Cor', '8GB', 'SSD 256GB', 'Không', 'Không', 0, 0, 1, '<p>MacBook là dòng máy tính xách tay cao cấp do Apple sản xuất, nổi tiếng với thiết kế tinh tế, hiệu năng mạnh mẽ và hệ điều hành macOS tối ưu. Được chế tác từ chất liệu nhôm nguyên khối, MacBook mang lại vẻ ngoài sang trọng, mỏng nhẹ và bền bỉ. Dòng sản phẩm này bao gồm các phiên bản như MacBook Air và MacBook Pro, phù hợp với nhu cầu học tập, làm việc văn phòng cho đến xử lý đồ họa chuyên nghiệp.</p>', '2025-05-05 00:24:00'),
(70, 52, 3, 'Macbook Air M3 15 2024 8CPU 10GPU/8GB/512GB', 36500000, 10, 'img/products/macbook-air-m3-xam-1-9132.jpg', '/img/products/macbook-air-m3-xam-4-5682.jpg', '/img/products/macbook-air-m3-xam-5-9749.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '<p><span style=\"color: rgb(8, 27, 58); font-family: SegoeuiPc, \"Segoe UI\", \"San Francisco\", \"Helvetica Neue\", Helvetica, \"Lucida Grande\", Roboto, Ubuntu, Tahoma, \"Microsoft Sans Serif\", Arial, sans-serif; font-size: 15px; letter-spacing: 0.2px; white-space-collapse: preserve; background-color: rgb(219, 235, 255);\">MacBook là dòng máy tính xách tay cao cấp do Apple sản xuất, nổi tiếng với thiết kế tinh tế, hiệu năng mạnh mẽ và hệ điều hành macOS tối ưu. Được chế tác từ chất liệu nhôm nguyên khối, MacBook mang lại vẻ ngoài sang trọng, mỏng nhẹ và bền bỉ. Dòng sản phẩm này bao gồm các phiên bản như MacBook Air và MacBook Pro, phù hợp với nhu cầu học tập, làm việc văn phòng cho đến xử lý đồ họa chuyên nghiệp.</span></p>', '2025-05-05 00:28:36'),
(72, 52, 3, 'Macbook Air M3 13 2024 8CPU 10GPU/16GB/256GB', 31500000, 10, 'img/products/macbook-air-m3-vang-1-4955.jpg', '/img/products/macbook-air-m3-vang-3-2187.jpg', '/img/products/macbook-air-m3-vang-5-2398.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:32:25'),
(73, 52, 3, 'Macbook Air M3 15 2024 8CPU 10GPU/16GB/512GB', 41000000, 10, 'img/products/macbook-air-m3-xanh-den-1-2237.jpg', '/img/products/macbook-air-m3-xam-4-5682.jpg', '/img/products/macbook-air-m3-vang-3-2187.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:34:06'),
(74, 51, 3, 'Macbook Pro 13 inch M1 2020 Ram 16GB SSD 1TB ', 20500000, 10, 'img/products/macbook-pro-m2-xam-1-5547.jpg', '/img/products/macbook-pro-2022-13-inch-m2-xam-1-3350.jpg', '/img/products/macbook-pro-m2-xam-6637.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:41:58'),
(75, 51, 3, 'MacBook Pro 13 M2 16GB 512GB - Chính hãng Apple', 36000000, 10, 'img/products/macbook-pro-m2-xam-1-5547.jpg', '/img/products/macbook-pro-2022-13-inch-m2-xam-1-3350.jpg', '/img/products/macbook-pro-m2-xam-6637.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:42:45'),
(76, 51, 3, 'Macbook Pro 13 inch M1 2020 Ram 16GB SSD 512GB', 25000000, 10, 'img/products/macbook-pro-m2-xam-1-5547.jpg', '/img/products/macbook-pro-2022-13-inch-m2-xam-1-3350.jpg', '/img/products/macbook-pro-m2-xam-6637.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:43:38'),
(77, 51, 3, 'MacBook Pro 13 M2 8GB 256GB - Chính hãng Apple', 29790000, 10, 'img/products/macbook-pro-m2-xam-1-5547.jpg', '/img/products/macbook-pro-2022-13-inch-m2-xam-1-3350.jpg', '/img/products/macbook-pro-m2-xam-6637.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:44:25'),
(78, 54, 2, 'Apple Watch Series 10 GPS 46mm viền nhôm dây vải', 14390000, 10, 'img/products/apple-watch-series-10-13-5211.jpg', '/img/products/apple-watch-series-10-14-2054.jpg', '/img/products/apple-watch-series-10-15-4308.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:50:15'),
(79, 54, 2, 'Apple Watch Series 10 GPS  46mm viền nhôm dây thể thao', 9000000, 10, 'img/products/apple-watch-s10-hong-1-1901.jpg', '/img/products/apple-watch-series-10-14-2054.jpg', '/img/products/apple-watch-series-10-15-4308.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:50:05'),
(80, 54, 2, 'Apple Watch Series 10 46mm viền nhôm dây vải', 13400000, 10, 'img/products/apple-watch-series-10-13-2540.jpg', '/img/products/apple-watch-series-10-14-2054.jpg', '/img/products/apple-watch-series-10-15-4308.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:48:10'),
(81, 54, 2, 'Apple Watch Series 10 42mm viền nhôm dây vải', 12400000, 10, 'img/products/apple-watch-series-10-7-7085.jpg', '/img/products/apple-watch-series-10-14-2054.jpg', '/img/products/apple-watch-series-10-15-4308.jpg', 1, '', '', '', '', '', '', '', '', '', 0, 0, 1, '', '2025-05-05 00:49:06');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`Id`) USING BTREE;

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD KEY `MaHD` (`MaHD`) USING BTREE,
  ADD KEY `MaSP` (`MaSP`) USING BTREE;

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDM`) USING BTREE;

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`) USING BTREE,
  ADD KEY `MaKH` (`MaND`) USING BTREE;

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`MaKM`) USING BTREE;

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLSP`) USING BTREE,
  ADD KEY `MaDM` (`MaDM`) USING BTREE,
  ADD KEY `MaLSP` (`MaLSP`,`MaDM`) USING BTREE,
  ADD KEY `MaLSP_2` (`MaLSP`) USING BTREE;

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaND`) USING BTREE,
  ADD KEY `MaQuyen` (`MaQuyen`) USING BTREE;

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`MaQuyen`) USING BTREE;

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`) USING BTREE,
  ADD KEY `LoaiSP` (`MaLSP`) USING BTREE,
  ADD KEY `MaKM` (`MaKM`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaND` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `MaQuyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`);

--
-- Các ràng buộc cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD CONSTRAINT `MaDM` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc` (`MaDM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `phanquyen` (`MaQuyen`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`MaKM`) REFERENCES `khuyenmai` (`MaKM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`MaLSP`) REFERENCES `loaisanpham` (`MaLSP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
