<%@page import="java.io.PrintWriter"%>
<%@page import="table.Table"%>
<%@page import="table.TableDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="table1" class="table.Table" scope="session" />
<jsp:setProperty name="table1" property="tableName" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
   TableDAO tabledao = new TableDAO();
   int result = tabledao.deleteTable(table1.getTableName());
   if (result == 1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href='ManageTable.jsp'");
      script.println("</script>");
   } else if(result == -1){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류')");
      script.println("history.back()");
      script.println("</script>");
   }
   %>
</body>
</html>