<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<title>공지사항 : ${result.notice_title }</title>
<body>
	<div class="container">
		<div class="row">
			<div class="mt-3 pb-2"
				style="position: relative; border-bottom: 1px solid #222;">
				<h3>${result.notice_title }</h3>
				<span style="position: absolute; top: 15px; right: 74px; overflow: hidden;">${result.dateform1 }</span>
				<span style="position: absolute; top: 15px; right: 5px; overflow: hidden;">ㅣ조회 ${result.etc } </span>
			</div>
			<div class="text-center" style="padding: 60px 20px; border-bottom: 1px solid #222;">
				<p> ${result.notice_content }</p>
			</div>
			
			<div class="mt-2">
				<button class="btn btn-secondary my-2 my-sm-0" type="button" onclick="location.href='/notice/notices'">목록</button>
				<c:if test="${SID.user_no eq 1}">
					<a class="btn btn-danger float-end ms-2" onclick="location.href='/notice/notice_delete?notice_no=${result.notice_no}'">삭제</a>
					<a class="btn btn-info float-end" onclick="location.href='/notice/notice_update?notice_no=${result.notice_no}'">수정</a>
				</c:if>
			</div>
		
		</div>
	</div>
</body>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script type="text/javascript">
    $(function(){
        $('.btn').click(function () {
            var idval = $(this).attr('id');
            var url;

            switch (idval){
                case 'list':
                    location.href ='공지사항.html';
                    break;
                case 'fix':
                    location.href ='공지수정.html';
                    break;
                case 'delete':
                    if(confirm('정말 삭제 하시겠습니까?')){
                        location.href ='삭제.html';
                        break;
                    }else{
                        break;
                    }
                default :
                    url='error.html';
            }
            
            
        })
    })
</script>

</html>