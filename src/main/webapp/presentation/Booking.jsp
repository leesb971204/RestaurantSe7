<%@page import="storage.booking.BookingDAO"%>
<%@page import="storage.booking.Booking"%>
<%@page import="storage.user.User"%>
<%@page import="storage.user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8");%>
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
    <title>SE Team7 Restaurant Booking System // Booking</title>

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

      select {
       padding: .7em .5em; /* 여백으로 높이 설정 */
       /*background: url() no-repeat 95% 50%; 네이티브 화살표를 커스텀 화살표로 대체 */
       border: 1px solid #999;
       border-radius: 10px;
      }
      #checkboxtext {
      text-align: left;
      }
      div.button{
   		margin: auto;
   		width: 30%;
	}
	img:hover{
   		cursor : pointer;
	}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="..\resources\css\signin.css" rel="stylesheet">
    
    <script>
        // 공백 사용 못 하게
        function noSpaceForm(obj) 
        {             
            var str_space = /\s/;               // 공백 체크
            if(str_space.exec(obj.value)) 
            {     // 공백 체크
                obj.focus();
                obj.value = obj.value.replace(' ',''); // 공백제거
                return false;
            }
        }
   </script>
   
   <script>
      document.getElementById('currentDateTime').value = 
      new Date().toISOString().slice(0, 16);
   </script>

<script>
   if (document.getElementById("input_check").checked) {
      document.getElementById("input_check_hidden").disabled = true;
   }
</script>


</head>
  <body class="text-center">
  
    <%
      // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
      String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String)session.getAttribute("userID");
      }
   %>
<div class="container">
         <form method="post" action="../application/BookingAction.jsp">
            <div class="py-5 text-center">
               <img class="d-block mx-auto mb-4" src="..\resources\images\seven.svg"  onclick="location.href='Main.jsp'" width="150" height="100">
               <h2 style="color: #ffffff;">예약하기</h2>
            </div>
            <div class="row g-3">
               <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">  
                  <div class="row g-3">
                     <div class="col-sm-12">
                        <div class="col-12">
                        </div>
                     </div>
                     <div class="col-12">
                        <label for="bookingDateTime" class="form-label" style="color: #ffffff;">예약 날짜 및 시간</label>
                        <input type="datetime-local" id='currentDateTime' class="form-control" 
                        min= 'currentDateTime' placeholder="날짜 시간" name="bookingDateTime">      
                     </div>
                     
                     <div class="col-md-6">              
                     <label for="ageOver" class="form-label" style="color: #ffffff;">대인</label>
                        <select name="ageOver" class="form-select">
                        <option value='0' selected="selected">0</option>
                    <option value='1'>1</option>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    </select>
                    </div>
                    
                    <div class="col-md-6">   
                        <label for="ageUnder" class="form-label" style="color: #ffffff;">소인</label>
                        <select name="ageUnder" class="form-select">
                        <option value='0' selected="selected">0</option>
                    <option value='1'>1</option>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                        </select> 
                        <br>     
                     </div>
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name ="carNumber1" value="1" id="carNumber" autocomplete="off">
                         <label class="btn btn-outline-warning" for="carNumber">자차 이용</label>
                    
                        <input type="radio" class="btn-check" name ="carNumber1" value="0" id="carNumber2" autocomplete="off" checked>
                       <label class="btn btn-outline-warning" for="carNumber2">이용 안함</label>
                      </div>
                      
                      <div class="col-12">
                        <label for="carNumber" class="form-label" style="color: #ffffff;">차 번호 입력</label>
                        <input type="text" class="form-control" name="carNumber" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">      
                     </div>
                     
                     
                     &nbsp;<div class="form-check" id="checkboxtext">
                    &nbsp;<input class="form-check-input" name="notCancel" type="checkbox" value="1" id="input_check" />
                    <label class="form-check-label" for="flexCheckDefault" style="color: #ffffff;">
                      No-show 방지 예약으로 10%할인 혜택을 받으시겠습니까?
                    </label>
                    </div>
                    <div class="button">
              		 <br>
                     <input type="submit" class="btn btn-warning form-control" value="예약하기">
                     </div>
                     </div>
                     </div>
                     </div>
                    
                    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
                    <script>
                    $(document).ready(function(){
                       $("input:text[name=carNumber]").attr("disabled",true);
                        // 라디오버튼 클릭시 이벤트 발생
                        $("input:radio[name=carNumber1]").click(function(){
                     
                            if($("input[name=carNumber1]:checked").val() == "1"){
                                $("input:text[name=carNumber]").attr("disabled",false);
                                $("input:text[name=carNumber]").val('');
                                // radio 버튼의 value 값이 1이라면 활성화
                     
                            }else if($("input[name=carNumber1]:checked").val() == "0"){
                                  $("input:text[name=carNumber]").attr("disabled",true);
                                  $("input:text[name=carNumber]").val('이용 안함');
                                // radio 버튼의 value 값이 0이라면 비활성화
                            }
                        });
                        });
                        $('#input_check').on('click',function(){
                        	$('input_check').val(this.checked ? 1 : 0);
                        });
                    

                    </script>
                    
                    <script>
                    $('#input_check').on('change', function(){
                          $('#input_check_hidden').val(this.checked ? 1 : 0);
                       });
               </script>
               
               
</form>
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