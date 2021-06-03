<%@page import="java.io.PrintWriter"%>
<%@page import="storage.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user1" class="storage.user.User" scope="page" />
<jsp:setProperty name="user1" property="userID" />
<jsp:setProperty name="user1" property="userPassword" />
<jsp:setProperty name="user1" property="userName" />
<jsp:setProperty name="user1" property="userPhone" />
<jsp:setProperty name="user1" property="userGender" />
<jsp:setProperty name="user1" property="userBirth" />
<jsp:setProperty name="user1" property="userEmail" />

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
      // 이미 로그인했으면 회원가입을 할 수 없게 한다
      if(userID != null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('이미 로그인이 되어 있습니다')");
         script.println("location.href='../presentation/Main.jsp'");
         script.println("</script>");
      }
   
      if(user1.getUserID() == null || user1.getUserPassword() == null || user1.getUserName() == null ||
         user1.getUserGender() == null || user1.getUserEmail() == null || user1.getUserPhone() == null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('입력이 안 된 사항이 있습니다')");
         script.println("history.back()");
         script.println("</script>");
      }else{
         UserDAO userDAO = new UserDAO();
         int result = userDAO.join(user1);
         if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다')");
            script.println("history.back()");
            script.println("</script>");
         }else {
            session.setAttribute("userID", user1.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('회원가입 성공')");
            %>
            <jsp:useBean id="user" class="storage.user.User" scope="session" />
            <jsp:setProperty name="user" property="userID" />
            <jsp:setProperty name="user" property="userPassword" />
            <% 
            user.setUserID(user1.getUserID());
            user.setUserPassword(user1.getUserPassword());
            script.println("location.href='../presentation/Main.jsp'");
            script.println("</script>");
         }
      }
   %>
</body>
</html>