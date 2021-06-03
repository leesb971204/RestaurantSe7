<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>SE Team7 Restaurant Booking System // Login</title>

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
	img:hover{
   		cursor : pointer;
	}
      
    </style>

    
    <!-- Custom styles for this template -->
    <link href="..\resources\css\signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form method="post" action="..\application\LoginAction.jsp">
    <img class="mb-4" src="..\resources\images\seven.svg" onclick="location.href='Main.jsp'" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal" style="color: #FFFFFF;">Login</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="아이디" name="userID" maxlength="20">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
      <label for="floatingInput">비밀번호</label>
    </div>
    

    <input type="submit" class="btn btn-warning form-control" value="로그인">
    
    <div>
    <a href="Join.jsp" style="text-decoration:none; color: #FFFFFF;">회원이 아니신가요?</a>
    </div>
    <footer class="mt-auto text-black-50" style=" position:absolute; bottom:0;">
               <br>
               <p style="color: #ffffff; text-decorate:none;">
               <a href="https://github.com/leesb971204/RestaurantSe7.git" class="text-white" style="text-decoration:none;">
                  소공A+수공 Restaurant Booking System</a>.
               </p>
            </footer>
  </form>
</main>


    
  </body>
</html>
