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
   <jsp:useBean id="waitingDAO" class="storage.waiting.WaitingDAO" scope="page" />
    <jsp:useBean id="userDAO" class="storage.user.UserDAO" scope="page" />
   <%
       PrintWriter script = response.getWriter();
      // 현재 세션 상태를 체크한다
       String userID = null;
       if(session.getAttribute("userID") != null){
          userID = (String)session.getAttribute("userID");
       }
       WaitingDAO waitingdao = new WaitingDAO();
       int result = waitingdao.checkWaitingInfo(userID);
       
       //예약정보가 없다면
       if(result == -1){
           script.println("<script>");
          script.println("alert('대기정보가 없습니다.')");
          script.println("location.href='../presentation/Main.jsp'");
           script.println("</script>");
       }
       else if(result == 1){
          script.println("<script>");
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