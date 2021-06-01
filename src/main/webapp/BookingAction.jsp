<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.ArrayList"%>
<%@page import="table.TableDAO"%>
<%@page import="booking.BookingDAO"%>
<%@page import="booking.Booking"%>
<%@page import="user.UserDAO"%>
<%@page import="user.User" %>
<%@page import="waiting.WaitingDAO"%>
<%@page import="table.Table" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="booking" class="booking.Booking" scope="page" />
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPhone"/>
<jsp:setProperty name="booking" property="bookingDateTime" />
<jsp:setProperty name="booking" property="ageOver" />
<jsp:setProperty name="booking" property="ageUnder" />
<jsp:setProperty name="booking" property="carNumber" />
<jsp:setProperty name="booking" property="tableID" />
<jsp:setProperty name="booking" property="notCancel" />
                       

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
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
    %>
   
   <%
       String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String)session.getAttribute("userID");
      }
      
      BookingDAO bookingDAO = new BookingDAO();
      TableDAO tableDAO = new TableDAO();
      WaitingDAO waitingDAO = new WaitingDAO();
      //테이블 자동배정
      int tableID = -1;
      int totalPeople = booking.getAgeOver() + booking.getAgeUnder();
      ArrayList<Table> myTableID = bookingDAO.getMyTable(totalPeople);
      for (Table table: myTableID) {
         if(bookingDAO.getUsableTable(booking.getBookingDateTime(), table.getTableID()) == -1) {
            continue;
         } else {
            tableID = table.getTableID();
            break;
         }
      }
      
      if(tableID == -1) {
         PrintWriter script = response.getWriter();
         waitingDAO.reservationWaiting(userID, users1.getUserPhone(), booking.getBookingDateTime(), booking.getAgeOver(), booking.getAgeUnder(), booking.getTableID(), booking.getCarNumber(), booking.getNotCancel(), waitingDAO.priority());
         script.println("<script>");
         script.println("alert('이 시간에 예약 가능한 테이블이 없습니다.')");
         script.println("alert('대기리스트에 추가되었습니다.')");
         script.println("location.href='Main.jsp'");
         script.println("</script>");
      }
      booking.setTableID(tableID);
      //테이블 자동배정 끝
      
   
      if(booking.getBookingDateTime() == null || (booking.getAgeOver() == 0 && booking.getAgeUnder() == 0)){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('입력이 안 된 사항이 있습니다')");
         script.println("history.back()");
         script.println("</script>");
      }else if(tableID != -1) { //조건 안걸어주면 db에 들어감
         int result = bookingDAO.reservation(userID, users1.getUserPhone(), booking.getBookingDateTime(), booking.getAgeOver(), booking.getAgeUnder(), booking.getTableID(), booking.getCarNumber(), booking.getNotCancel());
         if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류')");
            script.println("history.back()");
            script.println("</script>");
         }else {
            session.setAttribute("userID", user.getUserID());
            bookingDAO.pointUpdate(users1.getUserPoint(), user.getUserID());
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