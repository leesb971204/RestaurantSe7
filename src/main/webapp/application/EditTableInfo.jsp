<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="storage.table.Table"%>
<%@page import="storage.table.TableDAO"%>
<jsp:useBean id="table" class="storage.table.Table" scope="page" />
<jsp:setProperty name="table" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	TableDAO tabledao = new TableDAO();
	int result;
	
	if ((table.getTableID() != 0 && table.getTableName() != null && table.getTablePeople() != 0 && table.getTableContent() != null) == true) {
		result = tabledao.manageTableInfo(table.getTableID(), table.getTableName(), table.getTablePeople(), table.getTableContent());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('테이블 정보 수정 완료')");
			script.println("location.href='../presentation/ManageTableModify.jsp'");
			script.println("</script>");
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>

</body>
</html>