<%@page import="booking.BookingDAO"%>
<%@page import="user.UserDAO"%>
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
   <jsp:useBean id="bookingDAO" class="booking.BookingDAO" scope="page" />
    <jsp:useBean id="userDAO" class="user.UserDAO" scope="page" />
   <%
       PrintWriter script = response.getWriter();
      // 현재 세션 상태를 체크한다
       String userID = null;
       if(session.getAttribute("userID") != null){
          userID = (String)session.getAttribute("userID");
       }
       BookingDAO bookingdao = new BookingDAO();
       int result = bookingdao.checkReservationInfo(userID);
       
       //예약정보가 없다면
       if(result == -1){
           script.println("<script>");
          script.println("alert('예약정보가 없습니다.')");
          script.println("location.href='Main.jsp'");
           script.println("</script>");
       }
       else if(result == 1){
          script.println("<script>");
          script.println("location.href='ManageReservation.jsp'");
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