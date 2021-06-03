<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="storage.table.Table"%>
<%@page import="storage.table.TableDAO"%>
<!DOCTYPE html>
<jsp:useBean id="table" class="storage.table.Table" scope="page" />
<jsp:setProperty name="table" property="tableID" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   TableDAO tabledao = new TableDAO();
   int result = tabledao.deleteTable(table.getTableID());
   
   if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류')");
      script.println("history.back()");
      script.println("</script>");
   } else {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href='../presentation/ManageTable.jsp'");
      script.println("</script>");
   }
   %>
</body>
</html>