<%@page import="storage.booking.BookingDAO"%>
<%@page import="storage.waiting.WaitingDAO"%>
<%@page import="storage.user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <jsp:useBean id="bookingDAO" class="storage.booking.BookingDAO" scope="page" />
    <jsp:useBean id="userDAO" class="storage.user.UserDAO" scope="page" />
   <%
       PrintWriter script = response.getWriter();
      // 현재 세션 상태를 체크한다
       String userID = null;
      if(session.getAttribute("userID") == null){
         script.println("<script>");
          script.println("alert('로그인이 필요한 기능입니다.')");
          script.println("location.href='../presentation/Login.jsp'");
          script.println("</script>");
      }
      else if(session.getAttribute("userID") != null){
          userID = (String)session.getAttribute("userID");
       }
       BookingDAO bookingdao = new BookingDAO();
       int result = bookingdao.checkReservationInfo(userID);
       WaitingDAO waitingdao = new WaitingDAO();
       int result1 = waitingdao.checkWaitingInfo(userID);
       
       //예약정보가 없고 대기리스트도 없고
       if(result == -1  && result1 == -1){
           script.println("<script>");
          script.println("location.href='../presentation/Booking.jsp'");
           script.println("</script>");
       }
       //에약정보가 있다면 2개이상 예약불가
       else if(result == 1){
           script.println("<script>");
           script.println("alert('이미 예약정보가 있습니다.')");
           script.println("location.href='../presentation/ReservationInfo.jsp'");
           script.println("</script>");
       }//대기리스트 정보가 있다면
       else if(result1 == 1){
           script.println("<script>");
           script.println("alert('이미 대기리스트에 있습니다.')");
           script.println("location.href='../presentation/WaitingInfo.jsp'");
           script.println("</script>");
       }
       else{
           script.println("<script>");
            script.println("alert('데이터베이스 오류입니다')");
            script.println("history.back()");
            script.println("</script>");
       }
   %>
</body>
</html>