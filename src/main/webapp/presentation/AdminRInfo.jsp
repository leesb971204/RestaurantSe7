<%@page import="storage.booking.Booking"%>
<%@page import="storage.booking.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>SE Team7 Restaurant Booking System // AdminRInfo</title>
    <link rel="shortcut icon" type="image/x-icon" href="../resources/images/seven.svg">
   <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/seven.svg">
    <!-- Bootstrap core CSS -->
<link href="..\\resources\\css\\bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->

<%@ include file="NavBar.jsp"%>
    <style type = "text/css">
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      th, td {
        text-align: center;
      }
    </style>

<!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
    <link href="css/bootstrap.css">
</head>
<body>
<div class="container-fluid" style = "padding : 100px;">
  <div class="row">
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style = "margin-right : 111px;">
   <h2>예약자 정보 확인</h2>
   <br>
   <div class="table-responsive">
      <table class="table">
         <thead>
            <tr>
               <th width = "5%" style = "background-color:#dcdcdc;">#</th>
               <th width = "10%" style = "background-color:#dcdcdc;">이름</th>
               <th width = "25%" style = "background-color:#dcdcdc;">예약 시간</th>
               <th width = "20%" style = "background-color:#dcdcdc;">전화번호</th>
               <th width = "10%" style = "background-color:#dcdcdc;">성인</th>
               <th width = "10%" style = "background-color:#dcdcdc;">어린이</th>
               <th width = "10%" style = "background-color:#dcdcdc;">총원</th>
            </tr>
         </thead>
         <%
      BookingDAO bookingdao = new BookingDAO();
      ArrayList<Booking> list = bookingdao.getBookingAll();
      int i = 1;
      for(Booking booking : list){
         String id = booking.getUserID();
      %>
         <tbody>
            <tr>
               <td><%= i %></td>
               <td><%= bookingdao.getUserName(id) %></td>
               <td><%= booking.getBookingDateTime().substring(0, 16) %></td>
               <td><%= booking.getUserPhone() %></td>
               <td><%= booking.getAgeOver()+"명" %></td>
               <td><%= booking.getAgeUnder()+"명" %></td>
               <td><%= booking.getTotalPeople()+"명" %></td>
            </tr>
            <%
            i++;
            }
            %>
         </tbody>
      </table>
   </div>
   </main>
   </div>
   </div>
    <script src="..\resources\js\dashboard.js"></script>
</body>
</html>