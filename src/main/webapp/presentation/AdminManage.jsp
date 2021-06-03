<%@page import="storage.user.User"%>
<%@page import="storage.user.UserDAO"%>
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

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<title>SE Team7 Restaurant Booking System // AdminManage</title>
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
<link rel="shortcut icon" type="image/x-icon" href="../resources/images/seven.svg">

<!-- Custom styles for this template -->
   <link href="dashboard.css" rel="stylesheet">
    <link href="css/bootstrap.css">
</head>
<body>

<div class="container-fluid" style = "padding : 100px;">
<div class="row">
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style = "margin-right : 111px;">
   <h2>회원 정보 확인</h2>
   <br>
   <div class="table-responsive">
      <table class="table">
         <thead>
            <tr>
               <th width = "10%" style = "background-color:#dcdcdc;">#</th>
               <th width = "20%" style = "background-color:#dcdcdc;">이름</th>
               <th width = "35%" style = "background-color:#dcdcdc;">전화번호</th>
               <th width = "35%" style = "background-color:#dcdcdc;">이메일</th>
            </tr>
         </thead>
         <%

      ArrayList<User> list = userdao.getMemberAll();
      
      int i = 1;
      for(User user1 : list){
      %>
         <tbody>
            <tr>
               <td><%=i++%></td>
               <td><%=user1.getUserName() %></td>
               <td><%=user1.getUserPhone() %></td>
               <td><%=user1.getUserEmail() %></td>
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