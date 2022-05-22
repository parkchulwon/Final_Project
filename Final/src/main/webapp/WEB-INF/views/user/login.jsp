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
<link rel="icon" type="image/png"  href="/resources/images/logo.png"/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<script src="/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="container" style="width: 550px">
		<div class="title">
			<h1>STEAKHOUSER LOGIN</h1>
			<h6>로그인을 하시면 STEAKHOUSE의 서비스를 이용할 수 있습니다</h6>
		</div>
		<form>
			<div class=loginmenu>
				<div class=loginbar>
					<div class="form-group">
						<input name="user_id" type="text" class="form-control" id="user_id" placeholder="아이디 입력">
					</div>
					<div class="form-group">
						<input name="user_password" type="password" class="form-control" id="user_password" placeholder="비밀번호 입력">
					</div>
				</div>
				
				<div class="colorBtn" onclick="loginValidation()">로그인</div>
					<div class="container2">
						<button type="button" class="btn float-end" onclick="location.href='pwfind'">비밀번호찾기</button>
						<button type="button" class="btn float-end" onclick="location.href='idfind'">아이디찾기</button>
					</div>
				</div>
		</form>
		
		<div class="subtitle">
			<h6>STEAKHOUSE로 떠나요</h6>
			<div class="lBtn" onclick="location.href='join'">회원가입</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function loginValidation() {

			user_id = $("#user_id").val();
			user_password = $("#user_password").val();

			if (!user_id) {
				alert("아이디를 입력하세요.");
				$("#user_id").focus();
				return false;
			} else if (!user_password) {
				alert("비밀번호를 입력하세요");
				$("#user_password").focus();
				return false;
			} else {
				login(user_id, user_password);
			}
		}
		//**************************************************************************************************************************************************************************************
		function login(user_id, user_password) {

			$.ajax({

				url : "/jquery/loginOK",
				type : 'POST',
				data : {
					user_id : user_id, //보낼 값 
					user_password : user_password
				},
				success : function(data) {
					if (data == 2) {
						alert("아이디 혹은 비밀번호 맞지 않습니다");
						return false;
					} else if (data == 3) {
						location.href = "/";
					}
				}
			})
		}
		//**************************************************************************************************************************************************************************************
		function enterKeyCheck() {

			if (event.keyCode == 13) {
				loginValidation();
			}
		}
		
	</script>
</body>
</html>