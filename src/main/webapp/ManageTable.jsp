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

<jsp:useBean id="table1" class="table.Table" scope="session" />
<jsp:setProperty name="table1" property="tableName" />

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
<link href="css/bootstrap.css">
</head>
<body>

   <div class="container-fluid" style="padding: 100px;">
      <div class="row">
         <form method="post" action="ManageTableAction.jsp">
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
               style="margin-right: 111px;">

               <h2>테이블 정보 수정</h2>
               <table class="table table-striped table-sm" id="testTable">
                  <thead>
                     <tr>
                        <th width="20%">테이블 명</th>
                        <th width="20%">테이블 별 인원</th>
                        <th width="55%">비고</th>
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
                     
                        <td style="width: 20%;"><input type="text" class="form-control" value="<%=table.getTableName()%>" name="b_TITLE" maxlength="50"></td>
                        <td style="width: 20%;"><select class="form-select"><option value="0" selected="selected">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></td>
                        <td style="width: 55%;"><input type="text" class="form-control" placeholder="테이블에 대한 자세한 설명" name="b_TITLE" maxlength="50"></td>
                        <td style="width: 5%;"><input type="button" class="btn btn-warning" value="삭제"
                        onclick="location.href='Test.jsp'"></td>
                     </tr>
                     <%
                     }
                     %>
                  </tbody>
               </table>


               <input type="submit" class="btn btn-secondary pull-right"
                  value="저장" style="float: right;"> <input type='button'
                  class="btn btn-secondary pull-left" value='행추가'
                  onclick="addRow(); location.href='ManageTableAction.jsp'"
                  style="float: left;" />
            </main>
         </form>
      </div>
   </div>

   <script>
      function addRow() {
         // table element 찾기
         var table = document.getElementById('tbody');

         var row = tbody.insertRow(tbody.rows.length); // 하단에 추가

         // 새 행(Row)에 Cell 추가
         var newCell1 = row.insertCell(0);
         var newCell2 = row.insertCell(1);
         var newCell3 = row.insertCell(2);
         var newCell4 = row.insertCell(3);

         // Cell에 텍스트 추가
         newCell1.innerHTML = '<td style="width: 20%;"><input type="text" class="form-control" placeholder="테이블 이름 입력" name="b_TITLE" maxlength="50"></td>';
         newCell2.innerHTML = '<td style="width: 20%;"><select class="form-select"><option value="0" selected="selected">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></td>';
         newCell3.innerHTML = '<td style="width: 55%;"><input type="text" class="form-control" placeholder="테이블에 대한 자세한 설명" name="b_TITLE" maxlength="50"></td>';
         newCell4.innerHTML = '<td style="width: 5%;"><input type="button" class="btn btn-warning" value="삭제"></td>';

         var eventTarget = document
               .getElementsByClassName('btn btn-warning')

         for (var i = 0; i < eventTarget.length; i++) {
            eventTarget[i].addEventListener('click', function() {
               var parent = document.querySelector('#testTable tbody')
               parent.removeChild(this.parentElement.parentElement)
               i--
            })
         }
      }
   </script>
</body>
</html>