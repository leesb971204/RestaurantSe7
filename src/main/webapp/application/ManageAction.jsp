<%@page import="java.io.PrintWriter"%>
<%@page import="storage.user.UserDAO"%>
<%@page import="storage.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="storage.user.User" scope="session" />
<jsp:setProperty name="user" property="*" />
<jsp:useBean id="userInfo" class="storage.user.User" scope="page" />
<jsp:setProperty name="userInfo" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
   UserDAO userdao = new UserDAO();
   int result;
   
   if (userInfo.getUserPassword() != null) {
      result = userdao.editInfoPassword(userInfo.getUserPassword(), user.getUserID());
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('정보 수정 실패')");
         script.println("history.back()");
         script.println("</script>");
         }
      else{
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('수정 성공')");
         script.println("history.back()");
         script.println("</script>");
      }
   }
   
   else if (userInfo.getUserName() != null) {
      result = userdao.editInfoName(userInfo.getUserName(), user.getUserID());
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('정보 수정 실패')");
         script.println("history.back()");
         script.println("</script>");
         }
      else{
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('수정 성공')");
          script.println("history.back()");
          script.println("</script>");
       }
   }
   
   else if (userInfo.getUserPhone() != null) {
	      result = userdao.editInfoPhone(userInfo.getUserPhone(), user.getUserID());
	      if(result == -1){
	         PrintWriter script = response.getWriter();
	         script.println("<script>");
	         script.println("alert('정보 수정 실패')");
	         script.println("history.back()");
	         script.println("</script>");
	         }
	      else{
	          PrintWriter script = response.getWriter();
	          script.println("<script>");
	          script.println("alert('수정 성공')");
	          script.println("history.back()");
	          script.println("</script>");
	       }
	   }
   
   else if (userInfo.getUserEmail() != null) {
      result = userdao.editInfoEmail(userInfo.getUserEmail(), user.getUserID());
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('정보 수정 실패')");
         script.println("history.back()");
         script.println("</script>");
         }
      else{
          PrintWriter script = response.getWriter();
          script.println("<script>");
          script.println("alert('수정 성공')");
          script.println("history.back()");
          script.println("</script>");
       }
   }
   
   else {
      PrintWriter script = response.getWriter();
       script.println("<script>");
       script.println("alert('정보 수정 실패')");
       script.println("history.back()");
       script.println("</script>");
     }
     
   %>
</body>
</html>