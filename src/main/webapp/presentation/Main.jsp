<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SE Team7 Restaurant Booking System // Main</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="..\\resources\\css\\styles.css" rel="stylesheet" />
        <style type="text/css">
        #btn1 {
  			border-radius: 12px;
		}
        #btn2 {
  			border-radius: 12px;
		}
        </style>
    </head>
    
    <body>
      <%
      // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
      String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String)session.getAttribute("userID");
      }
   %>
   <%@ include file="NavBar.jsp"%>
        <!-- Background Video-->
        <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"><source src="..\resources\mp4\bg.mp4" type="video/mp4" /></video>
        <!-- Masthead-->
        <div class="masthead">
            <div class="masthead-content text-white">
                <div class="container-fluid px-4 px-lg-0">
                    <h1 class="fst-italic lh-1 mb-4">Welcome to Our Restaurant</h1>
                    <p class="mb-5">SE Team7 Term Project</p>
                    <div class="input-group input-group-newsletter">
                        <button type="button" class="btn btn-warning" id ="btn1" onclick="location.href='../application/BookingConfirm.jsp'">Booking</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-warning" id ="btn2" onclick="location.href='AboutUs.jsp'">AboutUs</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Core theme JS-->
        <script src="..\resources\js\scripts.js"></script>
    </body>
</html>