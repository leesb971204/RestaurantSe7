<%@page import="java.io.PrintWriter"%>
<%@page import="storage.user.UserDAO"%>
<%@page import="storage.booking.BookingDAO"%>
<%@page import="storage.waiting.WaitingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user1" class="storage.user.User" scope="page" />
<jsp:setProperty name="user1" property="userID" />
<jsp:setProperty name="user1" property="userPassword" />
<jsp:setProperty name="user1" property="userPhone"/>
<jsp:setProperty name="user1" property="userAuthority"/>

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
      // 이미 로그인했으면 다시 로그인을 할 수 없게 한다
      if(userID != null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('이미 로그인이 되어 있습니다')");
         script.println("location.href='../presentation/Main.jsp'");
         script.println("</script>");
      }
      UserDAO userDAO = new UserDAO();
      BookingDAO bookingDAO = new BookingDAO();
      WaitingDAO waitingDAO = new WaitingDAO();
      int result = userDAO.login(user1.getUserID(), user1.getUserPassword());
      if(result == 1){
         // 로그인에 성공하면 세션을 부여
         session.setAttribute("userID", user1.getUserID());
         session.setAttribute("userPhone", user1.getUserPhone());
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인 성공')");
         %>
         <jsp:useBean id="user" class="storage.user.User" scope="session" />
         <jsp:setProperty name="user" property="userID" />
         <jsp:setProperty name="user" property="userPassword" />
         <%
         user.setUserID(user1.getUserID());
         user.setUserPassword(user1.getUserPassword());
         bookingDAO.autoDelete();
         waitingDAO.autoDeleteWaiting();
         
         script.println("location.href='../presentation/Main.jsp'");
         script.println("</script>");
      }
      else if(user1.getUserPassword() == null && user1.getUserID() == null){
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('아이디와 비밀번호를 입력해주세요')");
          script.println("history.back()");
          script.println("</script>");
      }
      else if(user1.getUserID() == null){
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('아이디를 입력해주세요')");
          script.println("history.back()");
          script.println("</script>");
      }
      else if(user1.getUserPassword() == null){
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('비밀번호를 입력해주세요')");
          script.println("history.back()");
          script.println("</script>");
      }
      
      else if(result == 0){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다')");
         script.println("history.back()");
         script.println("</script>");
      }else if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지 않는 아이디입니다')");
         script.println("history.back()");
         script.println("</script>");
      }else if(result == -2){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류입니다')");
         script.println("history.back()");
         script.println("</script>");
      }
   %>
</body>
</html>