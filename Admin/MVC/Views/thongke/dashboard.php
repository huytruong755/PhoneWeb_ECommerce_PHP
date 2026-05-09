<div class="container-fluid">
  <h1 class="h3 mb-2 text-gray-800">Thống kê</h1>
  <p class="mb-4">Biểu đồ lấy dữ liệu trực tiếp từ cơ sở dữ liệu.</p>

  <div class="row">
    <div class="col-xl-8 col-lg-7">
      <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Doanh thu theo tháng</h6>
        </div>
        <div class="card-body">
          <div class="chart-area">
            <canvas id="myAreaChart"></canvas>
          </div>
        </div>
      </div>
    </div>

    <div class="col-xl-4 col-lg-5">
      <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Đơn hàng theo trạng thái</h6>
        </div>
        <div class="card-body">
          <div class="chart-pie pt-4 pb-2">
            <canvas id="myPieChart"></canvas>
          </div>
          <div class="mt-4 text-center small" id="pieLegend"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Top sản phẩm bán chạy</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Mã SP</th>
                  <th>Tên SP</th>
                  <th>Số lượng</th>
                </tr>
              </thead>
              <tbody id="topProductsBody">
                <tr><td colspan="3">Đang tải...</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

