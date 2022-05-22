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
			<h1>아이디 찾기</h1>
			<h6>회원정보에 등록된 이름과 이메일로 아이디를 확인하실 수 있습니다</h6>
		</div>
		<form method="POST" action='doFindLoginId'>
			<div class=loginmenu>
				<div class=loginbar>
					<div class="form-group">
						<input name="user_name" type="text" class="form-control" id="user_name" placeholder="이름 입력">
					</div>
					<div class="form-group">
						<input name="user_email" type="email" class="form-control" id="user_email" placeholder="이메일 입력">
					</div>
					<div class="form-group">
						<input name="ez" type="text" class="form-control" id="ez" placeholder=""> 
					</div>
				</div>
			</div>
		</form>
		
		<div style="width: 300px;margin: 0 auto;" class="d-grid gap-2">
			<h6>회원 가입 시 입력한 정보를 입력해주세요</h6>
			<button type="button" class="btn btn-primary btn-lg" onclick="findValidation()">확인</button> 
		</div>
		
		
	</div>
	
	<script type="text/javascript">
 		function findValidation(){
		var user_name = $("#user_name").val();
		var user_email = $("#user_email").val();
	
		if(!user_name){
	  	  alert("이름을 입력하세요.");
		  $("#user_name").focus();
			return false;
		}else if(!user_email){
		  alert("이메일을 입력하세요");
		  $("#user_email").focus();
			return false;
		}else {
			idfind(user_name,user_email);
			}
		}
//**************************************************************************************************************************************************************************************
		 function idfind(user_name,user_email){
	
			$.ajax({
				url : "/jquery/idfind",
				type : 'POST',
				data : { user_name : user_name,
							user_email : user_email
				},
				success:function(data){
					if(data == "fail"){
						alert("아이디가 없습니다.");
					}else{
		 		       $('#ez').val(data);
					}
				
			}
			})
		} 
  
/*  var idV = "";
 //아이디 값 받고 출력하는 ajax
 var idSearch_click = funtion(){
	 
 } 
  */
	</script>
</body>
</html>