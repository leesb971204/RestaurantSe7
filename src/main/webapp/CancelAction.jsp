<%@page import="java.io.PrintWriter"%>
<%@page import="booking.BookingDAO"%>
<%@page import="booking.Booking"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%request.setCharacterEncoding("utf-8");%>

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
   String userID = null;
   if(session.getAttribute("userID") != null){
      userID = (String)session.getAttribute("userID");
   }
   
	   
   BookingDAO bookingdao = new BookingDAO();
   int result = bookingdao.cancel(user.getUserID());

   if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('예약 취소 실패')");
         script.println("history.back()");
         script.println("</script>");
         }
      
      else{
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('예약이 취소되었습니다.')");
         script.println("history.back()");
         script.println("</script>");
      }
     %>
</body>
</html>