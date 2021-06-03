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
        <style>
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
                    <h1 class="fst-italic lh-1 mb-4" style="width:730px; color:rgb(255, 193, 7);" >SE Team7 Term Project</h1>
                    <p class="mb-5">소공A+수공 Restaurant Booking System</p>
                    <p class="mb-5">AboutUs<br>201912061 박경주<br>201713841 박준후<br>201912095 윤한결<br>201613126 이수빈<br>201611853 정재헌</p>
                    <div class="input-group input-group-newsletter">
                    <button type="button" class="btn btn-warning" id ="btn2" onclick="location.href='Main.jsp'">Main</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Core theme JS-->
        <script src="..\resources\js\scripts.js"></script>
    </body>
</html>