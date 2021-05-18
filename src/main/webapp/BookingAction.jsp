<%@page import="java.io.PrintWriter"%>
<%@page import="booking.BookingDAO"%>
<%@page import="booking.Booking"%>
<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="booking" class="booking.Booking" scope="page" />
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="booking" property="bookingDateTime" />
<jsp:setProperty name="booking" property="ageOver" />
<jsp:setProperty name="booking" property="ageUnder" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
      // 현재 세션 상태를 체크한다
      String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String)session.getAttribute("userID");
      }
   
      if(booking.getBookingDateTime() == null || (booking.getAgeOver() == 0 && booking.getAgeUnder() == 0)){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('입력이 안 된 사항이 있습니다')");
         script.println("history.back()");
         script.println("</script>");
      }else{
         BookingDAO bookingDAO = new BookingDAO();
         int result = bookingDAO.reservation(userID, booking.getBookingDateTime(), booking.getAgeOver(), booking.getAgeUnder());
         if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류')");
            script.println("history.back()");
            script.println("</script>");
         }else {
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('예약 성공')");
            script.println("location.href='Main.jsp'");
            script.println("</script>");
         }
      }
   %>
</body>
</html>