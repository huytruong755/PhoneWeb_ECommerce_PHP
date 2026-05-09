<!-- pages-title-start -->
<div class="pages-title section-padding">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="pages-title-text text-center">
					<h2>Order Complete</h2>
					<ul class="text-left">
						<li class="text-white"><a href="index.php?act=home">Trang chủ</a></li>
						<li class="text-white"><span> // </span>HOÀN THÀNH ĐƠN HÀNG</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- pages-title-end -->
<!-- order-complete content section start -->
<section class="pages checkout order-complete section-padding">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 text-center">
				<div class="complete-title">
					<p>Cảm ơn bạn. Đơn đặt hàng của bạn đã được nhận.</p>
					<p><?= isset($order_status_text) ? $order_status_text : "Vui Lòng Chờ Xét Duyệt" ?></p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="padding60">
					<div class="log-title">
						<h3><strong>ĐƠN ĐẶT HÀNG CỦA BẠN</strong></h3>
					</div>
					<div class="cart-form-text pay-details">
						<table>
							<thead>
								<tr>
									<th>Sản Phẩm</th>
									<td>Tiền</td>
								</tr>
							</thead>
							<tbody>
								<?php if (!empty($order_items)) {
									foreach ($order_items as $value) { ?>
										<tr>
											<th><?= $value['TenSP'] ?></th>
											<td><?= number_format($value['SoLuong'] * $value['DonGia']) ?> VNĐ</td>
										</tr>
								<?php }
								} ?>
								<tr>
									<th>VAT</th>
									<td>0 VNĐ</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>Tổng tiền</th>
									<td><?= isset($order) ? number_format($order['TongTien']) : '0' ?> VNĐ</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6">
				<div class="order-details padding60">
					<div class="log-title">
						<h3><strong>CHI TIẾT ĐƠN HÀNG</strong></h3>
					</div>
					<div class="por-dse clearfix">
						<ul>
							<?php if (isset($order)) { ?>
								<li><span>Mã đơn:<strong>:</strong></span> <?= $order['MaHD'] ?></li>
								<li><span>Ngày đặt:<strong>:</strong></span> <?= date('d/m/Y H:i', strtotime($order['NgayLap'])) ?></li>
								<li><span>Trạng thái:<strong>:</strong></span> 
									<span style="color: <?= ($order['TrangThai'] == 1) ? 'green' : 'orange' ?>;">
										<?= ($order['TrangThai'] == 1) ? '✓ Đã duyệt' : '⏱ Chờ duyệt' ?>
									</span>
								</li>
							<?php } ?>
						</ul>
					</div>
				</div>
				<div class="order-details padding60">
					<div class="log-title">
						<h3><strong>CHI TIẾT KHÁCH HÀNG</strong></h3>
					</div>
					<div class="por-dse clearfix">
						<ul>
							<li><span>Tên KH:<strong>:</strong></span> <?php echo $_SESSION['login']['Ho']. " " .$_SESSION['login']['Ten']?></li>
							<li><span>Email<strong>:</strong></span> <?=$_SESSION['login']['Email']?></li>
							<li><span>Số ĐT<strong>:</strong></span> <?=$_SESSION['login']['SDT']?></li>
						</ul>
					</div>
				</div>
				<div class="order-address bill padding60">
					<div class="log-title">
						<h3><strong>ĐỊA CHỈ THANH TOÁN</strong></h3>
					</div>
					<p><?=$_SESSION['login']['DiaChi']?></p>
					<p>Phone: <?=$_SESSION['login']['SDT']?></p>
					<p>Email: <?=$_SESSION['login']['Email']?></p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- order-complete content section end -->