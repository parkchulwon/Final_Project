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
<link rel="stylesheet" type="text/css" href="/resources/css/style_4.css">
</head>
<body>
	<div class="main">
		<div class="intro_text">
			<h3>개인 정보 수정</h3>
		</div>
		<form id ="member" name="member_info" action="/user/user_update" method="post">
			<input type="hidden" value="${result.user_no}" name="user_no">
				<table class="table tableborder">
					<tr>
						<th>이름</th>
						<td>
							<input type="text" class="form-control" name="user_name"
							id="name" aria-describedby="nameHelp"
							placeholder="변경할 이름을 입력해 주세요." value="${result.user_name }"> 
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" name="user_id"
							id="id" disabled aria-describedby="idHelp"
							placeholder="${result.user_id }">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" class="form-control" id="user_password"
							name="pw" aria-describedby="passwordHelp"
							placeholder="비밀번호를 입력해 주세요." value="${result.user_password }"> 
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>
							<input type="tel" class="form-control" name="user_number" 
                         	id="number" aria-describedby="phoneHelp" 
                         	placeholder="변경할 휴대폰번호를 입력해 주세요." value="${result.user_number }">
                        </td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="email" class="form-control" name="user_email"
							id="email" disabled aria-describedby="emailHelp"
							placeholder="${result.user_email }"> 
						</td>
					</tr>
				</table>
		</form>
	</div>
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary" onclick="location.href='member'">이전으로</button>
			<button type="submit" class="btn btn-primary" onclick="validate()">변경완료</button>
		</div>
		
<script type="text/javascript">
	function validate(){
    /* var re = /^[a-zA-Z0-9]{4,12}$/;
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
    var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    
    if(!check(/^[a-zA-Z0-9]{4,12}$/,id,"아이디는 4~12자리의 영문 대소문자와 숫자로만 입력")) {
    	
        return false;
    }
    if(!check(re,pw,"패스워드는 4~12자리의 영문 대소문자와 숫자로만 입력")) {
    	
        return false;
    }
    
    if(email.value==""){
        alert("이메일을 입력해 주세요");
        
        return false;
    }
    if(join.name.value==""){
        alert("이름을 입력해 주세요");
        
        return false;
    }
    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")){
    	
        return false;
    }
     */
    
    alert("정보수정이 완료되었습니다.");
    
    $("#member").submit();
}
/*  function check(re, what, message) {
    
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    return false; 
}  */
</script>
</body>
</html>