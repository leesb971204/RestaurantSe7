<%@page import="storage.user.User"%>
<%@page import="storage.user.UserDAO"%>
<%@page import="storage.waiting.Waiting"%>
<%@page import="storage.waiting.WaitingDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

    <!-- Bootstrap core CSS -->
<link href="..\\resources\\css\\bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/seven.svg">
<title>SE Team7 Restaurant Booking System // WaitingList</title>
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

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
    <link href="..\resources\css\signin.css" rel="stylesheet">
    <link href="css/bootstrap.css">
</head>
<body>

<div class="container-fluid" style = "padding : 100px; margin-bottom:20%;">
<div class="row">
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style = "margin-right : 111px;">
   <h2 style="color: #ffffff;">예약 대기리스트 명단</h2>
   <br>
   <h8 style="color:#ffffff;">이 명단은 날짜가 빠른 순, 총원이 적은 순으로 정렬되어 있습니다.</h8>
   <br>
   <br>
   <div class="table-responsive">
      <table class="table">
         <thead>
            <tr>
               <th width = "15%" class="bg-warning">#</th>
               <th width = "25%" class="bg-warning">아이디</th>
               <th width = "35%" class="bg-warning">예약시간</th>
               <th width = "25%" class="bg-warning">총원</th>
            </tr>
         </thead>
         <%
     WaitingDAO waitingdao = new WaitingDAO();
      ArrayList<Waiting> list = waitingdao.getWaitingListAll();     
      
      int i = 1;
      for(Waiting wait : list){
      %>
         <tbody>
            <tr>
               <td style="color: #ffffff;"><%=i++%></td>
               <td style="color: #ffffff;"><%=wait.getUserID()%></td>
               <td style="color: #ffffff;"><%=wait.getBookingDateTime().substring(0, 16)%></td>
               <td style="color: #ffffff;"><%=wait.getTotalPeople() %></td>
            </tr>
            <%
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