<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/style_5.css">
<script src="/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="container" style="width: 550px">
		<div class="title">
			<h1>비밀번호 찾기</h1>
			<h6>회원정보에 등록된 아이디와 이메일로 비밀번호를 확인하실 수 있습니다</h6>
		</div>
		<form>
			<div class=loginmenu>
				<div class=loginbar>
					<div class="form-group">
						<input name="id" type="text" class="form-control" id="user_id" placeholder="아이디 입력">
					</div>
					<div class="form-group">
						<input name="email" type="email" class="form-control" id="user_email2" placeholder="이메일 입력">
					</div>
					<div class="form-group">
						<input name="ez2" type="text" class="form-control" id="ez2" placeholder=""> 
					</div>
				</div>
			</div>
		</form>
		<div style="width: 300px;margin: 0 auto;" class="d-grid gap-2">
			<h6>회원 가입 시 입력한 정보를 입력해주세요</h6>
			<button type="button" class="btn btn-primary btn-lg" onclick="findPwValidation()">확인</button> 
		</div>
		
	</div>
<script type="text/javascript">
function findPwValidation(){

	var user_id = $("#user_id").val();
	var user_email2 = $("#user_email2").val();

	if(!user_id){
	    alert("아이디를 입력하세요.");
		$("#user_id").focus();
		return false;
	}else if(!user_email2){
		alert("이메일을 입력하세요");
		$("#user_email2").focus();
		return false;
	}else {
		pwfind(user_id,user_email2);
	}
}
//**************************************************************************************************************************************************************************************
function pwfind(user_id,user_email2){

	$.ajax({
		url : "/jquery/pwfind",
		type : 'POST',
		data : { user_id : user_id,
					user_email : user_email2
	},
		success:function(data){
			if(data == "fail"){
				alert("없는 계정입니다.");
			}else{
		        $('#ez2').val(data);
			}
				
		}
	})
}
</script>
</body>
</html>