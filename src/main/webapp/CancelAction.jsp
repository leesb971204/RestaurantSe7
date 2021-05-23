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
<title></title>
</head>
<body>
	<jsp:useBean id="users" class="user.UserDAO" scope="page" />
    <jsp:useBean id="users1" class="user.User" scope="page" />
   <%
   User userex = users.getUserInfo(user.getUserID());
   users1.setUserID(userex.getUserID());
   users1.setUserName(userex.getUserName());
   users1.setUserPhone(userex.getUserPhone());
   users1.setUserGender(userex.getUserGender());
   users1.setUserBirth(userex.getUserBirth());
   users1.setUserEmail(userex.getUserEmail());
   users1.setUserPoint(userex.getUserPoint());
   
   String userID = null;
   if(session.getAttribute("userID") != null){
      userID = (String)session.getAttribute("userID");
   }
   
	   
   BookingDAO bookingdao = new BookingDAO();
   int result = bookingdao.cancel(users1.getUserPoint(), user.getUserID());

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
         script.println("location.href='ReservationConfirm.jsp'");
         script.println("</script>");
      }
     %>
</body>
</html>