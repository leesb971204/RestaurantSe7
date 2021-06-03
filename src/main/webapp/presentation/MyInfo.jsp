<%@page import="storage.user.UserDAO"%>
<%@page import="storage.user.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="storage.user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>SE Team7 Restaurant Booking System // MyInfo</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

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
      width: 120%;
      margin: .5rem;
      }
      
      label {
      margin: .5rem;
      width: 30%;
      }
      #group{
      width:100%;
      height:70%;
      position:relative;
      right:25%;
      }
      img:hover{
   		cursor : pointer;
	}
    </style>

    <!-- Custom styles for this template -->
    <link href="..\resources\css\signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <jsp:useBean id="users" class="storage.user.UserDAO" scope="page" />
    <jsp:useBean id="users1" class="storage.user.User" scope="page" />
    <%
       User userex = users.getUserInfo(user.getUserID());
       users1.setUserID(userex.getUserID());
       users1.setUserName(userex.getUserName());
       users1.setUserPhone(userex.getUserPhone());
       users1.setUserGender(userex.getUserGender());
       users1.setUserBirth(userex.getUserBirth());
       users1.setUserEmail(userex.getUserEmail());
       users1.setUserPoint(userex.getUserPoint());
    %>
<div class="container">
            <div class="py-5 text-center">
               <img class="d-block mx-auto mb-4" src="..\resources\images\seven.svg" onclick="location.href='Main.jsp'" width="150" height="100">
               <h2 style="color: #ffffff;">회원 정보 확인</h2>
            </div>
            <div class="row g-3">
               <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">
                  <h4 class="mb-3" style="color: #ffffff;">내 정보</h4>
                  
                  <div id="group">
                     <div class="col-12" >
                          <label for="userID" class="form-label" style="color: #ffffff;">아이디</label>
                          <input type="text" class="form-control" placeholder = <jsp:getProperty name="users1" property="userID" /> name="userID" disabled/>
                        </div>
                        
                
                     <div class="col-12">
                        <label for="userName" class="form-label" style="color: #ffffff;">이름</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userName" /> name="userName" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="userPhone" class="form-label" style="color: #ffffff;">전화번호</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userPhone" /> name="userPhone" disabled/>
                     </div>
                     
                  <div class="col-12">
                        <label for="userGender" class="form-label" style="color: #ffffff;">성별</label>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userGender" /> name="userGender" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="userBirth" class="form-label" style="color: #ffffff;">생년월일</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userBirth" /> name="userBirth" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="userEmail" class="form-label" style="color: #ffffff;">이메일</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userEmail" /> name="userEmail" disabled/>
                     </div>
                     
                     <div class="col-12">
                        <label for="userPoint" class="form-label" style="color: #ffffff;">포인트</label><br/>
                        <input type="text" class="form-control" placeholder=<jsp:getProperty name="users1" property="userPoint" /> name="userPoint" disabled/>
                     </div>
                     </div>
                     <br>
                     <div>
                     &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning" onclick="location.href='Main.jsp'" style="margin-top:5px;">메인으로</button>&nbsp;
                     <button type="button" class="btn btn-warning" onclick="location.href='ManageMyInfo.jsp'" style="margin-top:5px;">내 정보 수정</button>&nbsp;
                     <button type="button" class="btn btn-warning" onclick="location.href='../application/DeleteConfirm.jsp'" style="margin-top:5px;">회원탈퇴</button>
                     </div>
                     </div>
                     </div>
                     </div>
                     <footer class="mt-auto text-black-50" style="position:absolute; bottom:0; left:0; right:0;">
               			<br>
               			<p style="color: #ffffff; text-decorate:none;">
               			<a href="https://github.com/leesb971204/RestaurantSe7.git" class="text-white" style="text-decoration:none;">
                  		소공A+수공 Restaurant Booking System</a>.
               			</p>
            		</footer>

  </body>
</html>