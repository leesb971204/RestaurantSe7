<%@page import="java.io.PrintWriter"%>
<%@page import="booking.BookingDAO"%>
<%@page import="booking.Booking"%>
<%@page import="user.UserDAO"%>
<%@page import="waiting.Waiting"%>
<%@page import="waiting.WaitingDAO"%>
<%@page import="table.TableDAO"%>
<%@page import="table.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />


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
   if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
   }

   UserDAO userdao = new UserDAO();
   BookingDAO bookingdao = new BookingDAO();
   WaitingDAO waitingdao = new WaitingDAO();
   TableDAO tabledao = new TableDAO();
   Booking cancel = bookingdao.getReservationInfo(user.getUserID());
   int result = bookingdao.cancel(users1.getUserPoint(), user.getUserID());

   if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('예약 취소 실패')");
      script.println("history.back()");
      script.println("</script>");
   }

   else {
      //대기자 추가부분
      Waiting ableWaiting = null;
      Table canceledTable = tabledao.getTableInfo(cancel.getTableID());
      ArrayList<Waiting> list = waitingdao.returnWaitPeople(canceledTable.getTablePeople());
      for (Waiting waiting : list) {
         if (waitingdao.getAbleWaiting(cancel.getTableID(), waiting.getBookingDateTime()) == -1) {
            continue;
         } else {
            ableWaiting = waiting;
            break;
         }
      }

      if (ableWaiting != null) { //추가 가능한 대기자가 있으면
         int added = bookingdao.reservation(ableWaiting.getUserID(), ableWaiting.getUserPhone(), ableWaiting.getBookingDateTime(), ableWaiting.getAgeOver(), ableWaiting.getAgeUnder(), cancel.getTableID(), ableWaiting.getCarNumber(), ableWaiting.getNotCancel());
         if (added != -1) { //정상적으로 추가되었다면
        	User u = userdao.getUserInfo(ableWaiting.getUserID());
            bookingdao.pointUpdate(u.getUserPoint(),u.getUserID());
            waitingdao.deleteWaiting(ableWaiting.getPriority());
         }
      }
      //대기자 추가부분 끝

      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('예약이 취소되었습니다.')");
      script.println("location.href='Main.jsp'");
      script.println("</script>");
   }
   %>
</body>
</html>