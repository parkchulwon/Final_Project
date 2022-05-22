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
			<h3>개인 정보</h3>
		</div>
		<form>
			<input type="hidden" value="${result.user_no}" name="user_no">
				<table class="table tableborder"> 
					<tr>
						<th>이름</th>
						<td>
							<input type="text" class="form-control" value="${result.user_name }" Readonly>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" class="form-control" value="${result.user_id }" Readonly>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="text" class="form-control" value="${result.user_password }" Readonly>
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>
							<input type="text" class="form-control" value="${result.user_number }" Readonly>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" class="form-control" value="${result.user_email }" Readonly>
						</td>
						</tr>
				</table>
			</form>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary" onclick="location.href='/'">이전으로</button>
			<button type="button" class="btn btn-primary" onclick="location.href='/user/member_info?user_id=${result.user_id}' ">정보수정</button>
			<button type="button" class="btn btn-primary" onclick="location.href='delete'">회원탈퇴</button>
		</div>
</body>
</html>