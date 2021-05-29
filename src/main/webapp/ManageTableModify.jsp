<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="table.Table"%>
<%@page import="table.TableDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.79.0">
<title>Dashboard Template · Bootstrap v5.0</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.0/examples/dashboard/">

<!-- Bootstrap core CSS -->
<link href=".\\css\\bootstrap.min.css" rel="stylesheet">


<%@ include file="NavBar.jsp"%>
<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

th, td {
   text-align: center;
}

pagination a.active {
   background-color: secondary;
   color: secondary;
}

#footer {
   position: absolute;
   bottom: 0;
   width: 100%;
   height: 70px;
   background: #ccc;
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
<link href="css/bootstrap.css">
</head>
<body>
   <div class="container-fluid" style="padding: 100px;">
      <div class="row">
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
               style="margin-right: 111px;">

               <h2>테이블 정보 수정</h2>
               <table class="table table-striped table-sm" id="testTable">
                  <thead>
                     <tr>
                        <th width="15%">테이블 명</th>
                        <th width="20%">테이블 별 인원</th>
                        <th width="60%">비고</th>
                        <th width="5%"></th>
                     </tr>
                  </thead>
                  
                  <br>
                  <tbody id='tbody'>
                  <%
                  TableDAO tabledao = new TableDAO();
                  ArrayList<Table> list = tabledao.getAllTables();
                  for (Table table : list) {
                  %>
                     <tr>
                        <td style="width: 15%;"><input type="text" class="form-control" name="tableName" value="<%=table.getTableName()%>" maxlength="50" readonly></td>
                        <td style="width: 20%;"><select class="form-select" name ="tablePeople" disabled><option value="<%=table.getTablePeople()%>" selected="selected">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></td>
                        <td style="width: 60%;"><input type="text" class="form-control" value="<%=table.getTableContent()%>"placeholder="테이블에 대한 자세한 설명" name="tableContent" maxlength="50" readonly></td>
                        <td style="width: 5%;"><form method="post" action="ManageTableDeleteAction.jsp"><input type="hidden" name="tableID" value="<%=table.getTableID()%>"><input type="submit" class="btn btn-warning " value="삭제"></form></td>
                     </tr>
                     <%
                     }
                     %>
                  </tbody>
               </table>
               
               <input type='button' class="btn btn-secondary" value='추가' onclick="location.href='ManageTableAction.jsp'"/>
               <input type='button' class="btn btn-secondary pull-right" value='수정' onclick="location.href='ManageTableModify.jsp'" style="float: right;" />
            </main>
      </div>
   </div>
</body>
</html>