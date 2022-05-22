<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>

tbody tr {
	cursor: pointer;
}
</style>
<title>예약조회</title>
<body>

	<div class="container">
		<div class="row">
			<h2 class="mt-3">예약조회</h2>
			<hr>
			<table class="table table-hover">
				<thead class="text-center">
					<tr>
						<th scope="col">접수일</th>
						<th scope="col">예약일</th>
						<th scope="col">시간</th>
						<th scope="col">이름</th>
						<th scope="col" >연락처</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${not empty result}">
					<c:forEach var="booking" items="${result }">
					<fmt:parseDate value="${booking.bk_update}" var="dateValue" pattern="yyyy-MM-dd HH:ss"/>
						<tr class=" t_title text-center">
							<td><fmt:formatDate value="${dateValue}" pattern="MM.dd HH:ss"/></td>
							<td>${booking.bk_date }</td>
							<td>${booking.bk_time }</td>
							<td>${booking.bk_name }</td>
							<td>${booking.bk_number }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty result}">
					<tr>
						<td colspan="4" class="mt-3 text-center">예약목록이 없습니다.</td>
					</tr>
				</c:if>
				</tbody>
			</table>
			
			<div class="">
				<div>
					<ul class="pagination " style="justify-content: center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item "><a class="page-link" href="booking_check?page=${pageMaker.startPage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum" varStatus="status">
							<li class="page-item <c:out value="${pageMaker.page == status.index ? 'active' : ''}"/>"><a class="page-link" href="booking_check?page=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item "><a class="page-link" href="booking_check?page=${pageMaker.endPage+1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>

		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
    /* $(function () {
        $(".t_title").click(function () {
            location.href="/notice/notice_detail?notice_no="+$(this).find("th").text();
        })
    }) */
</script>

</html>