<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.83.1">
<title>Signin Template · Bootstrap v5.0</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
   
<link rel="stylesheet" href=".\\resources\\css\\bootstrap.css"/>


<!-- Bootstrap core CSS -->
<link href=".\\resources\\css\\bootstrap.min.css" rel="stylesheet">

<!-- Favicons -->
<link rel="apple-touch-icon"
   href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
   sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
   sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
   sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
   href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
   color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


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
label{
         margin-left : 10px;
      }
.col-12{
         text-align : left;
      }
.col-sm-12{
         text-align : left;
      }
      
      
      /* .help-block 을 일단 보이지 않게 설정 */
        #myForm .help-block{
            display: none;
        }
        /* glyphicon 을 일단 보이지 않게 설정 */
        #myForm .glyphicon{
            display: none;
        }
</style>


<!-- Custom styles for this template -->
<link href=".\resources\css\signin.css" rel="stylesheet">
</head>
<body class="text-center">

   <div class="container">
      <form method="post" action="JoinAction.jsp" id="myForm">
         <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src=".\resources\images\seven.svg"
               width="150" height="100">
            <h2>회원가입</h2>
         </div>
         <div class="row g-3">
            <div class="col-sm-6 center-block" style="float: none; margin: 0 auto;">
               <div class="row g-3">
                  <div class="col-sm-12">
                     <label for="id" class="form-label">ID</label>
                     <div style="display: flex">
                        <input type="text" class="form-control" placeholder="아이디"
                           name="userID" id="id">
                         <span id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
            			 <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                     </div>
                  </div>
                  <div class="col-12">
                     <label for="userPassword" class="form-label">password</label> <input
                        type="password" class="form-control" placeholder="비밀번호"
                        name="userPassword" id="userPassword">
                        <span id="pwdRegErr" class="help-block">8글자 이상 입력하세요.</span>
            			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>
                  <div class="col-12">
                     <label for="userPasswordCheck" class="form-label">passwordCheck</label> <input
                        type="password" class="form-control" placeholder="비밀번호확인"
                        name="userPasswordCheck" id="userPasswordCheck">
                        <span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>
                  <div class="col-12">
                     <label for="userName" class="form-label">Name</label> <input
                        type="text" class="form-control" placeholder="이름"
                        name="userName">
                  </div>
                  <div class="col-12">
                     <label for="userPhone" class="form-label">Phone Number</label> <input
                        type="text" maxlength='11' class="form-control"
                        placeholder="010xxxxyyyy" name="userPhone">
                  </div>
                  <div class="form-group" style="text-align: center;">
                     <div class="col-12">
                        <label>Gender</label> <select class="form-select"
                           id="userGender" name="userGender">
                           <option value="" style="display: none;">성별</option>
                           <option>남자</option>
                           <option>여자</option>
                        </select>
                     </div>
                  </div>

                  <div class="col-12">
                     <label for="userBirth" class="form-label">Birthday</label> <input
                        type="text" maxlength='8' class="form-control"
                        placeholder="ex)20210510" name="userBirth">
                  </div>

                  <div class="col-12">
                     <label for="email" class="form-label">Email</label> <input
                        type="email" class="form-control" placeholder="이메일"
                        name="userEmail">
                        <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>
                  <input type="submit" class="btn btn-warning form-control"
                     value="회원가입" name="userEmail" id="email">
               </div>
            </div>
            <footer class="mt-auto text-black-50">
            <br>
               <p>
                  소공A+수공 Restaurant Booking System 
                  <a href="https://github.com/leesb971204/RestaurantSe7.git" class="text-black">SE7</a>.
               </p>
            </footer>
         </div>
      </form>
   </div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
$("#id").keyup(function(){
    //입력한 문자열을 읽어온다.
    var id=$(this).val();
    //ajax 요청을 해서 서버에 전송한다.
    $.ajax({
        method:"post",
        url:"/idCheck",
        data:{inputId:id},
        success:function(data){
            var obj=JSON.parse(data);
            if(obj.canUse){//사용 가능한 아이디 라면 
                $("#overlapErr").hide();
                // 성공한 상태로 바꾸는 함수 호출
                successState("#id");
                
            }else{//사용 가능한 아이디가 아니라면 
                $("#overlapErr").show();
                errorState("#id");
            }
        }
    });
});
$("#userPassword").keyup(function(){
    var pwd=$(this).val();
    // 비밀번호 검증할 정규 표현식
    var reg=/^.{8,}$/;
    if(reg.test(pwd)){//정규표현식을 통과 한다면
                $("#pwdRegErr").hide();
                successState("#userPassword");
    }else{//정규표현식을 통과하지 못하면
                $("#pwdRegErr").show();
                errorState("#userPassword");
    }
});
$("#userPasswordCheck").keyup(function(){
    var rePwd=$(this).val();
    var pwd=$("#userPassword").val();
    // 비밀번호 같은지 확인
    if(rePwd==pwd){//비밀번호 같다면
        $("#rePwdErr").hide();
        successState("#userPasswordCheck");
    }else{//비밀번호 다르다면
        $("#rePwdErr").show();
        errorState("#userPasswordCheck");
    }
});
$("#email").keyup(function(){
    var email=$(this).val();
    // 이메일 검증할 정규 표현식
    var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(reg.test(email)){//정규표현식을 통과 한다면
                $("#emailErr").hide();
                successState("#email");
    }else{//정규표현식을 통과하지 못하면
                $("#emailErr").show();
                errorState("#email");
    }
});
function successState(sel){
    $(sel)
    .parent()
    .removeClass("has-error")
    .addClass("has-success")
    .find(".glyphicon")
    .removeClass("glyphicon-remove")
    .addClass("glyphicon-ok")
    .show();

    $("#myForm input[type=submit]")
                .removeAttr("disabled");
};
// 에러 상태로 바꾸는 함수
function errorState(sel){
    $(sel)
    .parent()
    .removeClass("has-success")
    .addClass("has-error")
    .find(".glyphicon")
    .removeClass("glyphicon-ok")
    .addClass("glyphicon-remove")
    .show();

    $("#myForm input[type=submit]")
                .attr("disabled","disabled");
};
</script>
</body>
</html>