<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="storage.user.User"%>
<%@page import="storage.user.UserDAO"%>    
<%@page import="storage.statistics.Statistics"%>
<%@page import="storage.statistics.StatisticsDAO"%>   
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
   <link rel="shortcut icon" type="image/x-icon" href="../resources/images/seven.svg">
    <title>SE Team7 Restaurant Booking System // Chart</title>


    <!-- Custom fonts for this template-->
    <link href="../resources/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
    
      <%@ include file="NavBar.jsp"%>
</head>

<body id="page-top">
<%
      // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
      String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String)session.getAttribute("userID");
      }
      
%>

    <!-- Page Wrapper -->
    <div id="wrapper">
      
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content"  style="margin-top:100px;">
                         
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">레스토랑 통계</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                  
                  <% 
                  StatisticsDAO dao =new StatisticsDAO();
                  Statistics stat = new Statistics();
                  dao.getTodayStat(stat);
                  dao.getWeekStat(stat);
                  dao.getMonthStat(stat);
                  dao.getTableCount(stat);
                  %>
                  
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                오늘 예약 고객 수 / 테이블 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align:center;">
                                            <%=stat.getTodayReservationTotal() %>명 / <%=stat.getTodayReservation()%>개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                이번주 예약 고객 수 / 테이블 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align:center;">
                                            <%=stat.getWeekReservationTotal() %>명 / <%=stat.getWeekReservation()%>개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                이번 달 예약 고객 수 / 테이블 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align:center;">
                                            <%=stat.getMonthReservationTotal()%>명 / <%=stat.getMonthReservation()%>개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                  
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                현재 레스토랑 내 테이블 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="text-align:center;">
                                             <%=stat.getTableCount()%>개
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">2021년도 예약 테이블 수</h6>

                                    <div class="dropdown no-arrow">

                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400">
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                  
                  <!--  -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">성별 통계</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <canvas id="barChart" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                                    
                    <!-- Content Row -->
                    
                    
                    
                    
                    <div class="row">
                  <div class="col-lg-7 mb-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 예약 총원 아동/성인 비율</h6>

                                    <div class="dropdown no-arrow">

                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400">
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-multi">
                                        <canvas id="myMultiChart" height="300"></canvas>
                                    </div>
                                </div>
                            </div>
                            
                            
                        
                            
                        </div>

                        
                  
<!-- Pie Chart -->
                        <div class="col-lg-5 mb-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">연령별 고객비율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 영유아
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 10대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 20대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-dart"></i> 30대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-warning"></i> 40대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-secondary"></i> 50대
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-danger"></i> 60대 이상
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                            

                        
                    </div>

                </div>
                    </div>
               
               
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



       
        <!-- End of Content Wrapper -->

    
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="../resources/js/jquery.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../resources/js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../resources/js/chart-pie-demo.js"></script>
    <script src="../resources/js/chart-area-demo.js"></script>

   <script>


   // Set new default font family and font color to mimic Bootstrap's default styling

      Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#858796';

      function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
          prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
          sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
          dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
          s = '',
          toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
          };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
          s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
          s[1] = s[1] || '';
          s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
      }

      // Area Chart Example
      
      var ctx = document.getElementById("myAreaChart");
      var jan='<%=dao.getEachMonthStatistics("01")%>';
      var feb='<%=dao.getEachMonthStatistics("02")%>';
      var mar='<%=dao.getEachMonthStatistics("03")%>';
      var apr='<%=dao.getEachMonthStatistics("04")%>';
      var may='<%=dao.getEachMonthStatistics("05")%>';
      var jun='<%=dao.getEachMonthStatistics("06")%>';
      var jul='<%=dao.getEachMonthStatistics("07")%>';
      var aug='<%=dao.getEachMonthStatistics("08")%>';
      var sep='<%=dao.getEachMonthStatistics("09")%>';
      var oct='<%=dao.getEachMonthStatistics("10")%>';
      var nov='<%=dao.getEachMonthStatistics("11")%>';
      var dec='<%=dao.getEachMonthStatistics("12")%>';
      
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
          datasets: [{
            label: "예약 테이블 수",
            lineTension: 0.3,
            backgroundColor: "rgba(78, 115, 223, 0.05)",
            borderColor: "rgba(78, 115, 223, 1)",
            pointRadius: 3,
            pointBackgroundColor: "rgba(78, 115, 223, 1)",
            pointBorderColor: "rgba(78, 115, 223, 1)",
            pointHoverRadius: 3,
            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
            pointHitRadius: 10,
            pointBorderWidth: 2,
            data: [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec],
          }],
        },
        options: {
          maintainAspectRatio: false,
          layout: {
            padding: {
              left: 10,
              right: 25,
              top: 25,
              bottom: 0
            }
          },
          scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false,
                drawBorder: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                maxTicksLimit: 5,
                padding: 10,
                // Include a dollar sign in the ticks
                callback: function(value, index, values) {
                  return number_format(value)+'개 예약테이블';
                }
              },
              gridLines: {
                color: "rgb(234, 236, 244)",
                zeroLineColor: "rgb(234, 236, 244)",
                drawBorder: false,
                borderDash: [2],
                zeroLineBorderDash: [2]
              }
            }],
          },
          legend: {
            display: false
          },
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            titleMarginBottom: 10,
            titleFontColor: '#6e707e',
            titleFontSize: 14,
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            intersect: false,
            mode: 'index',
            caretPadding: 10,
            callbacks: {
              label: function(tooltipItem, chart) {
                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + number_format(tooltipItem.yLabel)+"개";
              }
            }
          }
        }
      });

   </script>
   
   <script>
   // Set new default font family and font color to mimic Bootstrap's default styling
   Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
   Chart.defaults.global.defaultFontColor = '#858796';

   // Pie Chart Example
   
   var baby=parseInt('<%=dao.getAgeStatistics(0)%>'/'<%=dao.getAllUser()%>'*100);
   var teen=parseInt('<%=dao.getAgeStatistics(10)%>'/'<%=dao.getAllUser()%>'*100);
   var twenty=parseInt('<%=dao.getAgeStatistics(20)%>'/'<%=dao.getAllUser()%>'*100);
   var thirty=parseInt('<%=dao.getAgeStatistics(30)%>'/'<%=dao.getAllUser()%>'*100);
   var firty=parseInt('<%=dao.getAgeStatistics(40)%>'/'<%=dao.getAllUser()%>'*100);
   var fifty=parseInt('<%=dao.getAgeStatistics(50)%>'/'<%=dao.getAllUser()%>'*100);
   var sixty=parseInt('<%=dao.getAgeStatistics(60)%>'/'<%=dao.getAllUser()%>'*100);
   
   var ctx = document.getElementById("myPieChart");
   var myPieChart = new Chart(ctx, {
     type: 'doughnut',
     data: {
       labels: ["영유아", "10대", "20대", "30대", "40대", "50대", "60대 이상"],
       datasets: [{
         data: [baby, teen, twenty, thirty, firty, fifty, sixty],
         backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#5a5c69', '#f6c23e', '#858796', '#e74a3b'],
         hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#5a5c69', '#f6c23e', '#858796', '#e74a3b'],
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

   </script>
   
   
   <script>
   
   // Set new default font family and font color to mimic Bootstrap's default styling
   Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
   Chart.defaults.global.defaultFontColor = '#858796';

   // Pie Chart Example
   
   var man='<%=dao.getGenderStatistics("남자")%>';
   var woman='<%=dao.getGenderStatistics("여자")%>';
   
   var ctx = document.getElementById("barChart");
   var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["남성", "여성"],
          datasets: [{
            backgroundColor: ['#4e73df', '#e74a3b'],
           hoverBackgroundColor: ['#4e73df', '#e74a3b'],
            borderColor: "rgba(78, 115, 223, 1)",
            pointRadius: 3,
            pointBackgroundColor: "rgba(78, 115, 223, 1)",
            pointBorderColor: "rgba(78, 115, 223, 1)",
            pointHoverRadius: 3,
            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
            pointHitRadius: 10,
            pointBorderWidth: 2,
            data: [man, woman],
          }],
        },
        options: {
          maintainAspectRatio: false,
          layout: {
            padding: {
              left: 10,
              right: 25,
              top: 25,
              bottom: 0
            }
          },
          scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false,
                drawBorder: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                maxTicksLimit: 5,
                padding: 10,
                beginAtZero: true,
                
                // Include a dollar sign in the ticks
                callback: function(value, index, values) {
                  return number_format(value)+'명';
                }
              },
              gridLines: {
                color: "rgb(234, 236, 244)",
                zeroLineColor: "rgb(234, 236, 244)",
                drawBorder: false,
                borderDash: [2],
                zeroLineBorderDash: [2]
              }
            }],
          },
          legend: {
            display: false
          },
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            titleMarginBottom: 10,
            titleFontColor: '#6e707e',
            titleFontSize: 14,
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            intersect: false,
            mode: 'index',
            caretPadding: 10,
            callbacks: {
              label: function(tooltipItem, chart) {
                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + number_format(tooltipItem.yLabel)+"명";
              }
            }
          }
        }
      });
   </script>
   
   
   <script>


   // Set new default font family and font color to mimic Bootstrap's default styling

      Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#858796';

      function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
          prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
          sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
          dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
          s = '',
          toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
          };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
          s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
          s[1] = s[1] || '';
          s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
      }

      // Area Chart Example
      
      var ctx = document.getElementById("myMultiChart");
      var jan='<%=dao.getEachMonthTotal("01")%>';
      var feb='<%=dao.getEachMonthTotal("02")%>';
      var mar='<%=dao.getEachMonthTotal("03")%>';
      var apr='<%=dao.getEachMonthTotal("04")%>';
      var may='<%=dao.getEachMonthTotal("05")%>';
      var jun='<%=dao.getEachMonthTotal("06")%>';
      var jul='<%=dao.getEachMonthTotal("07")%>';
      var aug='<%=dao.getEachMonthTotal("08")%>';
      var sep='<%=dao.getEachMonthTotal("09")%>';
      var oct='<%=dao.getEachMonthTotal("10")%>';
      var nov='<%=dao.getEachMonthTotal("11")%>';
      var dec='<%=dao.getEachMonthTotal("12")%>';
      
      var jan1='<%=dao.getUnderAgeStatistics("01")%>';
      var feb1='<%=dao.getUnderAgeStatistics("02")%>';
      var mar1='<%=dao.getUnderAgeStatistics("03")%>';
      var apr1='<%=dao.getUnderAgeStatistics("04")%>';
      var may1='<%=dao.getUnderAgeStatistics("05")%>';
      var jun1='<%=dao.getUnderAgeStatistics("06")%>';
      var jul1='<%=dao.getUnderAgeStatistics("07")%>';
      var aug1='<%=dao.getUnderAgeStatistics("08")%>';
      var sep1='<%=dao.getUnderAgeStatistics("09")%>';
      var oct1='<%=dao.getUnderAgeStatistics("10")%>';
      var nov1='<%=dao.getUnderAgeStatistics("11")%>';
      var dec1='<%=dao.getUnderAgeStatistics("12")%>';
      
      var myMixedChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
          datasets: [{
            label: "월별 예약 총원",
            lineTension: 0.3,
            backgroundColor: "rgba(256, 0, 0, 0.5)",
            borderColor: "rgba(78, 115, 223, 1)",
            pointRadius: 3,
            pointBackgroundColor: "rgba(78, 115, 223, 1)",
            pointBorderColor: "rgba(78, 115, 223, 1)",
            pointHoverRadius: 3,
            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
            pointHitRadius: 10,
            pointBorderWidth: 2,
            data: [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec],
          },
          {
             label: "월별 아동 인원 수",
               lineTension: 0.3,
               backgroundColor: "rgba(78, 115, 223, 0.01)",
               borderColor: "rgba(78, 115, 223, 1)",
               pointRadius: 3,
               pointBackgroundColor: "transparent",
               pointBorderColor: "skyblue",
               pointHoverRadius: 3,
               type:'line',
               pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
               pointHoverBorderColor: "rgba(78, 115, 223, 1)",
               pointHitRadius: 10,
               pointBorderWidth: 2,
               data: [jan1, feb1, mar1, apr1, may1, jun1, jul1, aug1, sep1, oct1, nov1, dec1],
          }],
        },
        options: {
          maintainAspectRatio: false,
          layout: {
            padding: {
              left: 10,
              right: 25,
              top: 25,
              bottom: 0
            }
          },
          scales: {
            xAxes: [{
              time: {
                unit: 'date'
              },
              gridLines: {
                display: false,
                drawBorder: false
              },
              ticks: {
                maxTicksLimit: 7
              }
            }],
            yAxes: [{
              ticks: {
                maxTicksLimit: 5,
                padding: 10,
                // Include a dollar sign in the ticks
                callback: function(value, index, values) {
                  return number_format(value)+'명';
                }
              },
              gridLines: {
                color: "rgb(234, 236, 244)",
                zeroLineColor: "rgb(234, 236, 244)",
                drawBorder: false,
                borderDash: [2],
                zeroLineBorderDash: [2]
              }
            }],
          },
          legend: {
            display: false
          },
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            titleMarginBottom: 10,
            titleFontColor: '#6e707e',
            titleFontSize: 14,
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            intersect: false,
            mode: 'index',
            caretPadding: 10,
            callbacks: {
              label: function(tooltipItem, chart) {
                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + number_format(tooltipItem.yLabel)+"명";
              }
            }
          }
        }
      });

   </script>
</body>

</html>