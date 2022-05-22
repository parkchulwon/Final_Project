<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<title>스테이크 하우스</title>
<body>
	<div class="container">
		<div class="row">
			<div class="mt-3 pb-2"
				style="position: relative; border-bottom: 1px solid #222;">
				<h3>STEAK HOUSE</h3>
			</div>
			<div class="text-center" style="padding: 60px 20px; border-bottom: 1px solid #222;">
				<p> ${result.info_content }</p>
			</div>
			
			<div class="mt-2">
				<c:if test="${SID.user_id eq 'admin' }">
					<a class="btn btn-info float-end" onclick="location.href='/main/info_update?info_no=1'">수정</a>
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