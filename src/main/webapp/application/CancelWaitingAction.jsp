<%@page import="java.io.PrintWriter"%>
<%@page import="storage.waiting.Waiting"%>
<%@page import="storage.waiting.WaitingDAO"%>
<%@page import="storage.table.TableDAO"%>
<%@page import="storage.user.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="storage.user.User" scope="session" />
<jsp:setProperty name="user" property="userID" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <%
   
   String userID = null;
   if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
   }

   WaitingDAO waitingdao = new WaitingDAO();
   int result = waitingdao.cancelWaiting(user.getUserID());

   if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('대기리스트 삭제 실패')");
      script.println("history.back()");
      script.println("</script>");
   }
   else {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('대기리스트에서 삭제되었습니다.')");
      script.println("location.href='../presentation/Main.jsp'");
      script.println("</script>");
   }
   %>
</body>
</html>