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
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<script src="/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="container" style="width: 550px">
		<div class="title">
			<h1>비밀번호 재확인</h1>
			<h6>안전한 STEAKHOUSER의 사용을 위해 비밀번호를 다시 한 번 입력해주세요</h6>
		</div>
		<form name="delete1" id="delete1" method="post" action="/user/user_delete">
			<input type="hidden" value="${result.user_no}" name="user_no">
				<div class=loginmenu>
					<div class=loginbar>	
						<div class="form-group">
							<input type="text" class="form-control" value="${result.user_id }">
						</div>
						<div class="form-group">
							<input name="user_password" type="password" class="form-control" 
								id="user_password" placeholder="비밀번호 입력">
						</div>
					</div>
						<div class="lBtn" onclick="dval()">회원탈퇴</div>
				</div>
		</form>
	</div>
	
	<script type="text/javascript">
	
	function dval(){

		var user_password = $("#user_password").val();

		if(!user_password){
		    alert("비밀번호를 입력하세요.");
			$("#user_password").focus();
			return false;
		}else {
			userdelete(user_password);
		}
	}
	//**************************************************************************************************************************************************************************************
	function userdelete(user_password){

		$.ajax({
			url : "/jquery/pwfind",
			type : 'POST',
			data : $("#delete1").serializeArray() /* 기존에 폼형식 데이터를 키벨류형식으로 전환해서 전송할때 사용 */
		, 
		success : function(data){
				if(data > 0){
					alert("비밀번호를 확인해주세요.")
				}else{
			        $('#delete1').submit();
			        alert("정상적으로 탈퇴되었습니다.")
				}
					
			}
		})
	}	
	</script>
</body>
</html>