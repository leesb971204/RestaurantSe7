<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />

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
      
      .col-sm-6 {
         width: 500px;
      }
      
      .col-12 {
         display: flex;
       width: 80%;
       margin: .5rem;
       margin-top: 0px;
      }
      
      .col-13 {
         display: flex;
       width: 100%;
      }
      
      label {
         margin: .5rem;
         width: 30%;
      }
      
      .btn {
         height: 40px;
      }
    </style>

    <!-- Custom styles for this template -->
    <link href=".\resources\css\signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <jsp:useBean id="users" class="user.UserDAO" scope="page" />
    <jsp:useBean id="users1" class="user.User" scope="page" />
    <%
       User userex = users.getUserInfo(user.getUserID());
       users1.setUserID(userex.getUserID());
       users1.setUserPassword(userex.getUserPassword());
       users1.setUserName(userex.getUserName());
       users1.setUserPhone(userex.getUserPhone());
       users1.setUserGender(userex.getUserGender());
       users1.setUserBirth(userex.getUserBirth());
       users1.setUserEmail(userex.getUserEmail());
    %>
<div class="container">
            <div class="py-5 text-center">
               <img class="d-block mx-auto mb-4" src=".\resources\images\seven.svg" width="150" height="100">
               <h2>회원 정보 수정</h2>
            </div>
            <div class="row g-3">
               <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">
                  <h4 class="mb-3">내 정보</h4>
                   <div class="col-13">
                   <div class="col-12">
                        <label for="userID" class="form-label">ID</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userID" /> name="userID" disabled>
                        </div>
                        </div>
                     
                     <form action="ManageAction.jsp">
                     <div class="col-13">
                     <div class="col-12">
                        <label for="userPassword" class="form-label">Password</label>
                        <input type="Password" class="form-control" name="userPassword">      
                     </div>
                     <input type="submit" class="btn btn-outline-secondary form-control" value="수정" name="userPassword" >
                     </div>
                       </form>
                   
                       <div class="col-13">
                     <div class="col-12">
                        <label for="userPassword" class="form-label">PwConfirm</label>
                        <input type="Password" class="form-control" name="userPassword">      
                     </div>
                     </div>
                     
                     <form action="ManageAction.jsp">
                     <div class="col-13">
                     <div class="col-12">
                        <label for="userName" class="form-label">Name</label>
                        <input type="text" class="form-control" name="userName">      
                     </div>
                     <input type="submit" class="btn btn-outline-secondary form-control" value="수정" name="userName">
                     </div>
                     </form>
                     
                     <form action="ManageAction.jsp">
                     <div class="col-13">
                     <div class="col-12">
                        <label for="userPhone" class="form-label">PhoneNumber</label>
                        <input type="text" class="form-control" name="userPhone">      
                     </div>
                     <input type="submit" class="btn btn-outline-secondary form-control" value="수정" name="userPhone">
                     </div>
                     </form>
                     
                  <div class="col-13">   
                  <div class="col-12">
                        <label for="userGender" class="form-label">Gender</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userGender" /> name="userGender" disabled>  
                     </div>
                     </div>
                     
                     <div class="col-13">
                     <div class="col-12">
                        <label for="userBirth" class="form-label">Birthday</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userBirth" /> name="userBirth" disabled>      
                     </div>
                     </div>
                     
                     <form action="ManageAction.jsp">
                     <div class="col-13">
                     <div class="col-12">
                        <label for="userEmail" class="form-label">Email</label><br/>
                        <input type="email" class="form-control" name="userEmail">      
                     </div>
                     <input type="submit" class="btn btn-outline-secondary form-control" value="수정" name="userEmail">
                     </div>
                     </form>
                     
                     <br>
                     <button type="button" class="btn btn-warning" onclick="location.href='Main.jsp'">메인으로</button>
                     
                     </div>
                     
                     </div>
                     </div>

  </body>
</html>