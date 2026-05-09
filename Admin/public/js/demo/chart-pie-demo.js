// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
if (ctx && typeof Chart !== 'undefined') {
function renderStatusPie(labels, values) {
  return new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
        data: values,
        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796'],
        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#dda20a', '#be2617', '#6c6f7a'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
    },
  });
}

function loadStats(onSuccess, onFail) {
  var url = '?mod=thongke&act=data';
  if (window.fetch) {
    fetch(url, { credentials: 'same-origin' })
      .then(function (r) { return r.json(); })
      .then(onSuccess)
      .catch(onFail);
    return;
  }
  if (window.jQuery && $.getJSON) {
    $.getJSON(url, onSuccess).fail(onFail);
    return;
  }
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState !== 4) return;
    if (xhr.status >= 200 && xhr.status < 300) {
      try {
        onSuccess(JSON.parse(xhr.responseText));
      } catch (e) {
        onFail(e);
      }
    } else {
      onFail(new Error('HTTP ' + xhr.status));
    }
  };
  xhr.send();
}

loadStats(function (res) {
  var labels = (res && res.ordersByStatus && res.ordersByStatus.labels) ? res.ordersByStatus.labels : ['Chưa có'];
  var values = (res && res.ordersByStatus && res.ordersByStatus.values) ? res.ordersByStatus.values : [1];
  renderStatusPie(labels, values);

  // legend đơn giản
  if (document.getElementById('pieLegend')) {
    var legend = document.getElementById('pieLegend');
    legend.innerHTML = labels.map(function (l, i) {
      return '<span class="mr-2"><i class="fas fa-circle text-primary"></i> ' + l + ' (' + values[i] + ')</span>';
    }).join('');
  }
}, function () {
  renderStatusPie(["Direct", "Referral"], [55, 30]);
});
}
