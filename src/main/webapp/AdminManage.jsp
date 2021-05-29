<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

    <!-- Bootstrap core CSS -->
<link href=".\resources\css\bootstrap.min.css" rel="stylesheet">

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
    </style>

<title>Insert title here</title>
<!-- Custom styles for this template -->
    <link href=".\resources\css\dashboard.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid" style = "padding : 100px;">
   <h2>테스트</h2>
   <div class="table-responsive">
      <table class="table table-striped table-sm">
         <thead>
            <tr>
               <th>#</th>
               <th>이름</th>
               <th>전화번호</th>
               <th>이메일</th>
            </tr>
         </thead>
         <%
      UserDAO userdao = new UserDAO();
      ArrayList<User> list = userdao.getMemberAll();
      
      int i = 1;
      for(User user : list){
      %>
         <tbody>
            <tr>
               <td><%=i++%></td>
               <td><%=user.getUserName() %></td>
               <td><%=user.getUserPhone() %></td>
               <td><%=user.getUserEmail() %></td>
            </tr>
            <%
      }
   %>
         </tbody>
      </table>
   </div>
   </div>
   <script src=".\resources\js\bootstrap.bundle.min.js"></script>
</body>
</html>