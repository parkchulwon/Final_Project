<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/resources/images/logo.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/jquery.validate.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>


<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.image-box {
	max-height: 130px;
	max-width: 140px;
	overflow: hidden;
	padding-top: 10px;
}

.image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand image-box me-2" href="/"> <img
				class="image-thumbnail" src="/resources/images/steakehouse3.png">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor01" >
				<ul class="navbar-nav">
					<c:forEach var="i" items="${sessionScope.nav_result}">
						<c:if test="${i.nav_parent == 0 }">
							<li class="nav-item dropdown">
								<c:if test="${i.nav_depth == 0}">
									<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"href="#" role="button" aria-haspopup="true"aria-expanded="false">${i.nav_title }</a>
								</c:if>
								<div class="dropdown-menu">
									<c:forEach var="result2" items="${sessionScope.nav_result}">
										<c:if test="${result2.nav_parent == i.nav_no && result2.nav_available eq 1}">
											<a class="dropdown-item" href="${result2.etc }">${result2.nav_title }</a>
										</c:if>
									</c:forEach>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<c:if test="${SID.user_no eq 1}">
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자 메뉴</a>
						<div class="dropdown-menu" data-bs-popper="none">
							<a class="dropdown-item" href="/main/img_update">메인 이미지 수정</a>
							<a class="dropdown-item" href="/notice/header_update">네비게이션 수정</a>
							<a class="dropdown-item" href="/menu/menu_update">메인메뉴 수정</a>
						</div>
					</li>
				</ul>
				</c:if>
				
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<c:choose>
							<c:when test = "${empty SID}">
								<a class="nav-link" href="/user/login" role="button" >로그인</a>         	
							</c:when>			
		          		    <c:when test = "${not empty SID}">		
								<ul class="navbar-nav">
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${SID.user_id}님 환영합니다</a>
										<div class="dropdown-menu" data-bs-popper="none">
											<a class="dropdown-item" href="/user/member?user_id=${SID.user_id}">프로필</a>
											<a class="dropdown-item" href="/jquery/logout">로그아웃</a>
										</div>
									</li>
								</ul>
							</c:when>
             		   	</c:choose>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>