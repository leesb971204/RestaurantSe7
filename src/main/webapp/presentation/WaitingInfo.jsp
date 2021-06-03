<%@page import="storage.waiting.Waiting"%>
<%@page import="storage.waiting.WaitingDAO"%>
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

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<title>SE Team7 Restaurant Booking System // WaitingInfo</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="..\\resources\\css\\bootstrap.min.css" rel="stylesheet">

<!-- Favicons -->
<link rel="apple-touch-icon"
   href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
   sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
   sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
   sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
   href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
   color="#7952b3">
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

@media ( min-width : 768px) {
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
   width: 100%;
}

label {
   margin: .5rem;
   width: 30%;
}

.btn {
   height: 40px;
}
img:hover{
   cursor : pointer;
}
</style>

<!-- Custom styles for this template -->
<link href="..\resources\css\signin.css" rel="stylesheet">
</head>
<body class="text-center">


   <jsp:useBean id="waitingDAO" class="storage.waiting.WaitingDAO" scope="page" />
   <jsp:useBean id="waitings" class="storage.waiting.Waiting" scope="page" />
   <jsp:useBean id="tables" class="storage.table.Table" scope="page" />
   <jsp:useBean id="tableDAO" class="storage.table.TableDAO" scope="page" />
   <jsp:useBean id="userDAO" class="storage.user.UserDAO" scope="page" />
   <%
       User u =  userDAO.getUserInfo(user.getUserID());
       user.setUserName(u.getUserName());

       Waiting wt = waitingDAO.getWaitingInfo(u.getUserID());
       waitings.setUserPhone(wt.getUserPhone());
       waitings.setBookingDateTime(wt.getBookingDateTime());
       
       String dateTime = (wt.getBookingDateTime().substring(0, 16));
       
       waitings.setAgeOver(wt.getAgeOver());
       waitings.setAgeUnder(wt.getAgeUnder());
       waitings.setTotalPeople(wt.getTotalPeople());
       waitings.setCarNumber(wt.getCarNumber());
       waitings.setNotCancel(wt.getNotCancel());
    %>
    
   <div class="container">
      <div class="py-5 text-center">
         <img class="d-block mx-auto mb-4" src="..\resources\images\seven.svg" onclick="location.href='Main.jsp'" width="150" height="100">
         <h2 style="color: #ffffff;">대기 정보 확인</h2>
      </div>
      <div class="row g-3">
         <div class="col-sm-6 center-block"
            style="float: none; margin: 0 auto;">
            <h4 class="mb-3" style="color: #ffffff;">대기 정보</h4>

            <div class="col-13">
               <div class="col-12">
                  <label for="userName" class="form-label" style="color: #ffffff;">예약자</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="user" property="userName" />
                     disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="userPhone" class="form-label" style="color: #ffffff;">전화번호</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="waitings" property="userPhone" />
                     disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="bookingDateTime" class="form-label" style="color: #ffffff;">예약날짜</label>
                  <input type="text" class="form-control"
                     placeholder="<%=dateTime%>"   
                     name="Date" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="ageOver" class="form-label" style="color: #ffffff;">대인</label> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="waitings" property="ageOver" />
                     name="ageOver" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="ageUnder" class="form-label" style="color: #ffffff;">소인</label><br /> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="waitings" property="ageUnder" />
                     name="ageUnder" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="totalPeople" class="form-label" style="color: #ffffff;">총 인원</label><br /> <input
                     type="text" class="form-control"
                     placeholder=<jsp:getProperty name="waitings" property="totalPeople" />
                     name="to" disabled />
               </div>
            </div>

            <div class="col-13">
               <div class="col-12">
                  <label for="tableID" class="form-label" style="color: #ffffff;">테이블 이름</label><br /> <input
                     type="text" class="form-control"
                     placeholder="테이블이 아직 배정되지 않았습니다."
                     name="to" disabled />
               </div>
            </div>


            <div class="col-13">
               <div class="col-12">
                  <label for="carNumber" class="form-label" style="color: #ffffff;">자차 이용</label><br />
                  <%
                     if(wt.getCarNumber()!=null){
                        %>
                  <input type="text" class="form-control"
                     placeholder=<jsp:getProperty name="waitings" property="carNumber" />
                     name="to" disabled />
                  <%
                        }
                     else{
                        %>
                  <input type="text" class="form-control" placeholder="자자 이용하지 않음"
                     name="to" disabled />
                  <%
                     }
                     %>
               </div>
              

               <%
                  if(wt.getCarNumber()!=null){
                      %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal" value="주차권확인">
               <%
                     }
                  else{
                     %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal" value="주차권확인" disabled>
               <%
                  }
                  %>
                   </div>
                   
                   
                  <div class="col-13">
               <div class="col-12">
                  <label for="notCancel" class="form-label" style="color: #ffffff;">예약 타입</label>
                  <%
                     if(wt.getNotCancel() == 1){
                        %>
                  <input type="text" class="form-control" placeholder="No-show 방지 예약" name="to" disabled />
                     <%
                     }
                     if(wt.getNotCancel() == 0){
                     %>
                     <input type="text" class="form-control"placeholder="No-show 방지 예약 사용하지 않음" name="to" disabled />
                     <%
                  }
                  %>
               </div>
               
               <%
                  if(wt.getNotCancel() == 1){
                      %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal2" value="쿠폰">
               <%
                     }
                  if(wt.getNotCancel() == 0){
                     %>
               <input type="button" class="btn btn-warning" data-bs-toggle="modal"
                  data-bs-target="#exampleModal2" value="쿠폰" disabled>
               <%
                  }
                  %>
            </div>
            

            <!-- Button trigger modal -->

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><img class="mb-1" src="..\resources\images\seven.svg" alt="" width="31" height="25">주차권</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <input type="text" class="form-control"
                           placeholder="차량 번호 : <jsp:getProperty name="waitings" property="carNumber" />"
                           name="to" disabled /><img src="..\resources\images\qrcode.png" style="margin-top:15px;">
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-bs-dismiss="modal">닫기</button>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="modal fade" id="exampleModal2" tabindex="-1"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">No-Show 방지 예약 10% 할인 쿠폰</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <img src="..\resources\images\qrcode.png" style="margin-top:15px;">
                        <p style="margin-top : 25px; margin-bottom : 0;">유의사항 : 사용 기간은 발급일로 부터 3개월</p>
                     </div>
                     <div class="modal-footer">
                     <p style="margin-right:60px;">※ 이 쿠폰은 예약 취소 시 자동으로 사라집니다.</p>
                        <button type="button" class="btn btn-secondary"
                           data-bs-dismiss="modal">닫기</button>
                     </div>
                  </div>
               </div>
            </div>

            <br>
            <button type="button" class="btn btn-warning"
               onclick="location.href='Main.jsp'">메인으로</button>&nbsp;&nbsp;
               
               
               
               
               
               <button type="button" class="btn btn-warning"
               onclick="location.href='../application/CancelWaitingConfirm.jsp'">대기 취소</button>

                      
                      

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
   <script src="..\resources\js\bootstrap.bundle.min.js"></script>
</body>
</html>