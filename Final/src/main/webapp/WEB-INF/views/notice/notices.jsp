<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>

tbody tr {
	cursor: pointer;
}
</style>
<title>공지사항</title>
<body>
	<div class="container">
		<div class="row">
			<h2 class="mt-3">공지사항</h2>
			<hr>
			<table class="table table-hover">
				<thead class="text-center">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${result }">
						<tr class=" t_title">
							<th class="text-center" id="b_no">${b.notice_no }</th>
							<td>${b.notice_title }</td>
							<td class="text-center" >${b.etc }</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<c:if test="${SID.user_no eq 1}">
				<div class="mt-3">
					<button id="write" type="button" class="btn btn-secondary float-end" onclick="location.href='notice_write'">글작성</button>
				</div>
			</c:if>	
			<div class="">
				<div>
					<ul class="pagination " style="justify-content: center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item "><a class="page-link" href="notices?page=${pageMaker.startPage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum" varStatus="status">
							<li class="page-item <c:out value="${pageMaker.page == status.index ? 'active' : ''}"/>"><a class="page-link" href="notices?page=${pageNum}">${pageNum}</a></li>
							</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item "><a class="page-link" href="notices?page=${pageMaker.endPage+1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>

		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        $(".t_title").click(function () {
            location.href="/notice/notice_detail?notice_no="+$(this).find("th").text();
        })
    })
</script>

</html>