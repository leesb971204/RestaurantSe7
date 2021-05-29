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

</body>
</html>