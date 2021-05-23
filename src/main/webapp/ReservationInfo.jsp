<%@page import="booking.Booking"%>
<%@page import="booking.BookingDAO"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
   <jsp:useBean id="user" class="user.User" scope="session" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Signin Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href=".\\resources\\css\\bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
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
      
      .col-sm-6{
      width: 400px;
      }
      .col-12{
      display: flex;
      width: 100%;
      margin: .5rem;
      }
      
      label {
      margin: .5rem;
      width: 30%;
      }
    </style>
  
    <!-- Custom styles for this template -->
    <link href=".\resources\css\signin.css" rel="stylesheet">
  </head>
  <body class="text-center">

  
    <jsp:useBean id="bookingDAO" class="booking.BookingDAO" scope="page" />
    <jsp:useBean id="bookings" class="booking.Booking" scope="page" />
    <jsp:useBean id="userDAO" class="user.UserDAO" scope="page" />
    <%
       User u =  userDAO.getUserInfo(user.getUserID());
       user.setUserName(u.getUserName());
       
       Booking bk = bookingDAO.getReservationInfo(u.getUserID());
	   bookings.setUserPhone(bk.getUserPhone());
       bookings.setBookingDateTime(bk.getBookingDateTime());
       bookings.setAgeOver(bk.getAgeOver());
       bookings.setAgeUnder(bk.getAgeUnder());
       bookings.setTotalPeople(bk.getTotalPeople());
       bookings.setTableNumber(bk.getTableNumber());
    %>
<div class="container">
            <div class="py-5 text-center">
               <img class="d-block mx-auto mb-4" src=".\resources\images\seven.svg" width="150" height="100">
               <h2>예약 정보 확인</h2>
            </div>
            <div class="row g-3">
               <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">
                  <h4 class="mb-3">예약 정보</h4>
                  
                  <div class="col-12">
                        <label for="userName" class="form-label">예약자</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="user" property="userName" /> disabled/>
                     </div>
                
                <div class="col-12">
                        <label for="userPhone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="userPhone" /> disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="bookingDateTime" class="form-label">예약날짜 및 시간</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="bookingDateTime" /> name="bookingDateTime" disabled/>
                     </div>
                     
                  <div class="col-12">
                        <label for="ageOver" class="form-label">대인</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="ageOver" /> name="ageOver" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="ageUnder" class="form-label">소인</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="ageUnder" /> name="ageUnder" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="totalPeople" class="form-label">총 인원</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="totalPeople" /> name="to" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="tableNumber" class="form-label">테이블 번호</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="bookings" property="tableNumber" /> name="to" disabled/>
                     </div>
                     <br>
                     <button type="button" class="btn btn-warning" onclick="location.href='Main.jsp'">메인으로</button>
                     <button type="button" class="btn btn-warning" onclick="location.href='CancelConfirm.jsp'">예약 취소</button>
                     
                     </div>
                     </div>
                     </div>

  </body>
</html>