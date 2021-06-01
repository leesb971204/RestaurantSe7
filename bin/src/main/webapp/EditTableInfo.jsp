<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="table.Table"%>
<%@page import="table.TableDAO"%>
<!DOCTYPE html>
<jsp:useBean id="editable" class="table.Table" scope="page" />
<jsp:setProperty name="edittable" property="tableName" />
<jsp:setProperty name="edittable" property="tablePeople" />
<jsp:setProperty name="edittable" property="tableContent" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   TableDAO tabledao = new TableDAO();
   int result;
   
   if(edittable.getTable1Name() != null && edittable.getTablePeople() != null){
         result = tabledao.manageTableInfo(edittable.getTableName(), edittable.getTablePeople(),edittable.getTableContent());   
         if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류')");
            script.println("history.back()");
            script.println("</script>");
         } 
         else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('테이블 정보 수정 완료')");
            script.println("location.href='ManageTable.jsp'");
            script.println("</script>");
         }
   }
   %>

</body>
</html>