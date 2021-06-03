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
<script>
   if (!confirm("정말로 탈퇴하시겠습니까?.")) {
       // 취소(아니오) 버튼 클릭 시 이벤트
	   location.href="../presentation/MyInfo.jsp";
   } else {
       // 확인(예) 버튼 클릭 시 이벤트
	   location.href="DeleteAction.jsp";
   }
   </script>
</body>
</html>
