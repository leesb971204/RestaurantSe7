<%@page import="java.io.PrintWriter"%>
<%@page import="storage.table.Table"%>
<%@page import="storage.table.TableDAO"%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
   TableDAO tabledao = new TableDAO();
   
   int result = tabledao.insertTable(tabledao.tableID());
   if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류')");
      script.println("history.back()");
      script.println("</script>");
   } else {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href='../presentation/ManageTableModify.jsp'");
      script.println("</script>");
   }
   %>
</body>
</html>