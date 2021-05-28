<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.menu{
width:50%;
height:50%;
margin:0 auto;
margin-top:100px;
}

.container{
width:70%;
margin:0 auto;
overflow:hidden;
}

.chart{
margin:0 auto;
margin-top:100px;
width:80%;
text-align:center;
}

#allReservation{
margin-top:30px;
}
</style>

<!-- 통계부분 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>



</head>
<body>
<!-- 통계 부분 -->
<script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
%>

<%@ include file="NavBar.jsp"%>
<div class="menu">
	<div class="row">
        <div class="col-12">
          <h1>Restaurant Statistics Chart</h1>
          <div class="list-group">
            <a href="#" class="list-group-item">전체 예약 통계</a>
            <a href="#" class="list-group-item">연령별 통계</a>
            <a href="#" class="list-group-item">성별 통계</a>
          </div>
          </div>
      </div>
</div>

<div class="container">
	<div class="chart">
		<h2>전체 예약 통계</h2>
		<div id="allReservation">
		<%
				
		%>

		<script>
		//일단은 주 단위로 통계
		var allReservation = c3.generate({
			  bindto: "#allReservation",
			  data: {
	    		columns: [
	   			 ['고객', 300, 350, 300, 190, 50, 25],
	        	 ['테이블', 130, 100, 140, 200, 150, 50]
	    		],
	    		types: {
	    		  고객: 'area-spline',
	      		테이블: 'area-spline'
	    		}
	  		}
			});
		</script>
		</div><!-- allReservation -->
	</div> <!-- chart1 -->
	
	
</div> <!-- container -->


											

</body>
</html>