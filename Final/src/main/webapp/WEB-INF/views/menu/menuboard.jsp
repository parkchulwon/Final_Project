<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
<link rel="stylesheet" href="/resources/css/menu.css">
<title>메뉴</title>
<body>
	<div class="container">
		<div class="row">

			<div class="mt-3">
				<h2 class="d-inline">Our Menus</h2>
			</div>
			<hr>
			
			<c:forEach var="menu" items="${result }" varStatus="idx">
			<c:if test="${menu.menu_group eq '1' }">
			<div class="mt-4">
				<h2>${menu.menu_name}</h2>
				<hr>
				<div class="menu_gruop p-3" id="wrap">
				<c:forEach var="result" items="${result }" varStatus="idx2">
				<c:if test="${menu.menu_name eq result.menu_group }">
					<div class="articlebox text-center mb-4">
						<div class="img-wrapper">
							<img src="/resources/upload/${result.f_savename}">
						</div>
						<div class="menu-info mt-2">
							<span style="font-size: 20px;">${result.menu_name }</span> <strong
								class="me-1" style="font-size: 24px;">${result.menu_price }</strong>원
						</div>
						<a href="#" class="menu-list-detail" style="cursor: default;">
							<div class="hover-wrap">
								<div class="hover-data">
									<div class="hover-cell">
										<p class="en-title">${result.menu_name }</p>
										<p class="info">${result.menu_info }</p>
										<dl class="material">
											<dt>재료</dt>
											<dd>
												<p>${result.menu_teg }</p>
											</dd>
										</dl>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:if>
				</c:forEach>
				</div>
			</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        
    })
</script>

</html>
