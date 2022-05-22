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
<link rel="icon" type="image/png" href="/resources/images/logo.png" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/style_3.css">
<script src="/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="main">
		<div class="intro_text">
			<h3>회원정보 입력</h3>
			<h6>이용약관과 개인정보처리방침에 대한 안내를 읽고 동의 해주세요</h6>
		</div>
		<form id="join" name="join" method="post" action="/user/joinproc">
			<table class="table border">
				<tr>
					<th>이름</th>
					<td>
						<input name="user_name" type="text" class="form-control" id="name" placeholder="이름을 입력하세요">
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input name="user_id" type="text" class="form-control" id="id" style="display: inline-block;" placeholder="아이디를 입력하세요" onchange="rset()" >
						<input type="button" id="emailCodes" onclick="idCheck()" value="중복체크" style="height:38px; float: right: ;">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="user_password" type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>
						<input name="user_number" type="text" class="form-control" id="number" placeholder="휴대폰 번호를 입력하세요">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input name="user_email" type="text" class="form-control" id="email" style="float:left" placeholder="이메일을 입력하세요">
						<input type="button" id="emailCodes" onclick="emailCode()" value="인증버튼" style="height:38px; float: right: ;">
					</td>
						 
				</tr>
				<tr id="checkTr" style="display: none;">
					<th>이메일인증</th>
					<td>
						<input name="user_code" type="text" class="form-control" id="code" style="float:left" placeholder="인증번호 입력하세요">
						<div id="time"></div>
						<input type="button" id="emailCodeCheck" onclick="codeCheck()" value="인증확인" style="height:38px; float: right: ;">
						<input type="hidden" id="emailCheck" value="0"/>
					</td>
				</tr>
				

			</table>
		</form>
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary"  onclick="validate()">회원 가입</button> 
		</div>
	</div>

	<script type="text/javascript">
		//변수 생성
		var iCheck = false;
		var timer = null;
		var isRunning = false;
		var ecode = "";
		//**************************************************************************************************************************************************************************************
		function codeCheck(){
			/* alert(ecode); 
			$("#code").val(); */
			if (ecode == $("#code").val()){     // ==(비교연산자) 왼쪽 오른쪽 값이 같으면 true, $("#code").val() : id가 code인 값
				alert("이메일 인증에 성공하였습니다"); 
				$("#emailCheck").val(1); 		//id가 emailCheck인 값을 1로 지정
				clearInterval(timer); //타이머 정지
				
			}else{
				alert("이메일 인증이 안되었습니다.") 
			}
		}
		
		//**************************************************************************************************************************************************************************************
		function validate() {
			var re = /^[a-zA-Z0-9]{4,12}$/;
			var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			var id = document.getElementById("id");
			var password = document.getElementById("password");
			var email = document.getElementById("email");

			if (!check(/^[a-zA-Z0-9]{4,12}$/, id,
					"아이디는 4~12자리의 영문 대소문자와 숫자로만 입력")) {
				return false;
			}
			else if (!check(re, password, "패스워드는 4~12자리의 영문 대소문자와 숫자로만 입력")) {
				return false;
			}

			else if (email.value == "") {
				alert("이메일을 입력해 주세요");

				return false;
			}
			else if (name.value == "") {
				alert("이름을 입력해 주세요");

				return false;
			}
			else if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
				return false;
			}
			else if ($("#emailCheck").val() == 0){
				alert("이메일 인증을 해주세요");
				return false;
			}
				
			
			/* 아이디 체크가 flase인 경우 중복검사 미인증 상태. */
			else if (!iCheck){
				alert("중복검사를 해주세요");
				return false;
			}
		
			$("#join").submit(); // id가 join인 함수실행
		}
		//**************************************************************************************************************************************************************************************
		function check(re, what, message) {

			if (re.test(what.value)) {
				return true;
			}
			alert(message);
			what.value = "";
			what.focus();
			/* return false; */
		}
		//**************************************************************************************************************************************************************************************
		function emailCode() {
			if (!$("#email").val()) {  // id가 email인 값이 비어있으면 
				alert("이메일이 비어있습니다");
				$("#email").focus();  // focus:id가 email인 박스에 커서 위치
			} else {

				$.ajax({

					url : "/jquery/emailCode",
					type : 'POST',
					data : {
						user_email : $("#email").val()
					},
					success : function(data) {
						ecode = data;
						emailconfirm();
					}
				})
			}
		}

		//**************************************************************************************************************************************************************************************
		 function emailconfirm() {
			var display = $('#time');
			$("#checkTr").css('display', "table-row");
			//table의 tr태그에 display을 none & block 을 주어야 할 때 크롬에선 block시 테이블이 깨진다. tr을 다시 보여지게 할때는 jquery 에서는 table-row를 입력하면된다
			var leftSec = 180;
			// 남은 시간
			// 이미 타이머가 작동중이면 중지
			if (isRunning) {
				clearInterval(timer);
				display.html("");
				startTimer(leftSec, display);
			} else {
				startTimer(leftSec, display);

			}
		}
		//**************************************************************************************************************************************************************************************
		function startTimer(count, display) {

			var minutes, seconds;
			timer = setInterval(function() { //setInterval 함수 : 일정한 시간 간격으로 작업을 수행하기 위해서 사용합니다.clearInterval 함수를 사용하여 중지할 수 있습니다. 주의할 점은 일정한 시간 간격으로 실행되는 작업이 그 시간 간격보다 오래걸릴 경우 문제가 발생할 수 있습니다.

				minutes = parseInt(count / 60, 10);
				seconds = parseInt(count % 60, 10);

				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;

				display.html(minutes + ":" + seconds);

				// 타이머 끝
				if (--count < 0) {
					clearInterval(timer); //clearInterval() 실행중인 작업을 중지시키는 것은 아닙니다. 지정된 작업은 모두 실행되고 다음 작업 스케쥴이 중지 되는 것입니다.

					alert("시간초과");
					display.html("시간초과");
					$('#code').attr("disabled", "disabled");
					isRunning = false;
				}
			}, 1000);
			isRunning = true;
		}
		//**************************************************************************************************************************************************************************************
		function rset(){
			iCheck=false;
		}
		//**************************************************************************************************************************************************************************************
		function idCheck(){
			iCheck=false;
			user_id = $("#id").val();
			if(!$("#id").val()) {
				alert("아이디가 입력되지 않았습니다.");
				$("#id").focus();
			}else{
			$.ajax({
				url : "/jquery/idCheck",
				type : 'POST',
				data : { user_id : user_id
				},
				success:function(data){
					if(data == 1){
						alert("중복된 아이디 입니다.");
					}else{
				        alert("사용 가능한 아이디 입니다.");
				        iCheck=true;
					}
						
				}
			})
		}
	}
		//**************************************************************************************************************************************************************************************
	</script>
</body>
</html>