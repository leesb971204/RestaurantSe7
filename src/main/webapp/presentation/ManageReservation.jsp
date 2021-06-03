<%@page import="storage.booking.Booking"%>
<%@page import="storage.booking.BookingDAO"%>
<%@page import="storage.user.User"%>
<%@page import="storage.user.UserDAO"%>
<%@page import="storage.table.Table"%>
<%@page import="storage.table.TableDAO"%>
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
    <title>SE Team7 Restaurant Booking System // ManageReservation</title>

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
      
      .col-sm-6 {
         width: 500px;
      }
      
      .col-12 {
         display: flex;
       width: 90%;
       margin: .5rem;
       margin-top: 0px;
      }
      
      .col-13 {
       display: flex;
       width: 110%;
      }
      
      label {
         margin: .5rem;
         width: 40%;
      }
      
      .btn {
         height: 40px;
      }
      #group{
      width:100%;
      height:70%;
      position:relative;
      right:5%;
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
       <jsp:useBean id="bookingDAO" class="storage.booking.BookingDAO" scope="page" />
   <jsp:useBean id="bookings" class="storage.booking.Booking" scope="page" />
   <jsp:useBean id="tables" class="storage.table.Table" scope="page" />
   <jsp:useBean id="tableDAO" class="storage.table.TableDAO" scope="page" />
   <jsp:useBean id="userDAO" class="storage.user.UserDAO" scope="page" />
   <%
       User u =  userDAO.getUserInfo(user.getUserID());
       user.setUserName(u.getUserName());
       
       Booking bk = bookingDAO.getReservationInfo(u.getUserID());
       bookings.setUserPhone(bk.getUserPhone());
       bookings.setBookingDateTime(bk.getBookingDateTime());
       
       String dateTime = (bk.getBookingDateTime().substring(0, 16));
       dateTime = dateTime.replace(" ","T");
       bookings.setAgeOver(bk.getAgeOver());
       bookings.setAgeUnder(bk.getAgeUnder());
       bookings.setTotalPeople(bk.getTotalPeople());
       bookings.setCarNumber(bk.getCarNumber());
       bookings.setNotCancel(bk.getNotCancel());
       
       Table t = tableDAO.getTableInfo(bk.getTableID());
       tables.setTableName(t.getTableName());
    %>
<div class="container">
            <div class="py-5 text-center">
               <img class="d-block mx-auto mb-4" src="..\resources\images\seven.svg" onclick="location.href='Main.jsp'" width="150" height="100">
               <h2 style="color: #ffffff;">예약 정보 수정</h2>
            </div>
            <div class="row g-3" >
               <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">
                  <h4 class="mb-3" style="color: #ffffff;">예약 정보</h4>
                  <div id="group">
                  
                  <form action="../application/ManageRAction.jsp">
                   <div class="col-13">
                   <div class="col-12">
                       <label for="userName" class="form-label" style="color: #ffffff;">예약자</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="user" property="userName" /> readonly />
                        </div>
                        </div>
                     

                     <div class="col-13">
                     <div class="col-12">
                        <label for="userPhone" class="form-label" style="color: #ffffff;">전화번호</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="bookings" property="userPhone" /> readonly />      
                     </div>
                     </div>

                   
                       <div class="col-13">
                     <div class="col-12">
                        <label for="bookingDateTime" class="form-label" style="color: #ffffff;">예약날짜</label>
                        <input type="datetime-local" class="form-control" value=<%=dateTime%> name="bookingDateTime" />     
                     </div>
                     </div>
                     

                     <div class="col-13">
                     <div class="col-12">
                        <label for="ageOver" class="form-label" style="color: #ffffff;">대인</label>
                        <select name="ageOver" class="form-select">
                        <option selected="selected" style="display: none;"><%=bookings.getAgeOver()%></option>
                        <option value='0'>0</option>
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
                     </div>

                     

                     <div class="col-13">
                     <div class="col-12">
                        <label for="ageUnder" class="form-label" style="color: #ffffff;">소인</label><br />
                        <select name="ageUnder" class="form-select">
                        <option selected="selected" style="display: none;"><%=bookings.getAgeUnder()%></option>
                        <option value='0'>0</option>
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
                     </div>
                     
                     <div class="col-13">
                     <div class="col-12">
                     <label style="color: #ffffff; padding-top:8px;" >차량 이용</label>
                     <div class="btn-group" style="width:100%;" role="group" aria-label="Basic radio toggle button group">
                     
                        <input type="radio" class="btn-check" name ="carNumber1" value="1" id="carNumber" autocomplete="off">
                         <label class="btn btn-outline-warning" for="carNumber">자차 이용</label>

                        <input type="radio" class="btn-check" name ="carNumber1" value="0" id="carNumber2" autocomplete="off" checked>
                       <label class="btn btn-outline-warning" for="carNumber2">이용 안함</label>
                      </div>
                      </div>
                     </div>
                      
                      <div class="col-13">
                      <div class="col-12">
                        <label for="carNumber" class="form-label" style="color: #ffffff;">차 번호 입력</label>
                        <%
                         if(bk.getCarNumber() == null){
                        %>
                        <input type="text" class="form-control" name="carNumber" value="자차이용 하지않음" disabled>  
                        <%
                         }
                         else{
                        %>
                        <input type="text" class="form-control" name="carNumber" placeholder="<jsp:getProperty name="bookings" property="carNumber" />" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                        <% 
                        }
                        %>      
                     </div>
                     </div>
                     
                     
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" style="width:30%"class="btn btn-warning form-control" value="수정하기">
                    
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
                                  $("input:text[name=carNumber]").val('자차이용 하지않음');
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