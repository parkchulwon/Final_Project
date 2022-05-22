<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>

tbody tr {
	cursor: pointer;
}
.hide{
    height: 0;
    overflow: hidden;
}
.on{
    height: auto;
    overflow: auto;
}
</style>
<title>예약조회-비회원</title>
<body>

	<div class="container">
		<div class="row">
			<h2 class="mt-3">예약조회-비회원</h2>
			 
			<hr>
			<div style="width: 550px; margin: 0 auto">
		        <div class="input-group mb-3">
			      <input name="etc" type="text" class="form-control" placeholder="예약코드를 입력하세요." aria-describedby="button-addon2" id="writeCode">
			      <button class="btn btn-primary" type="button" id="button-addon2" onclick="submit()">확인</button>
			    </div>
			</div>
			<div class="hide" id="table_box">
				<table class="table table-hover">
					<thead class="text-center">
						<tr>
							<th scope="col">예약일</th>
							<th scope="col">시간</th>
							<th scope="col">이름</th>
							<th scope="col" >연락처</th>
						</tr>
					</thead>
					<tbody id="booking_content">
						<tr class=" t_title text-center">
							<td>date</td>
							<td>time</td>
							<td>name</td>
							<td>number</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
        
    function submit(){
    	var code = $("#writeCode").val();
    	$("#table_box").switchClass("on","hide",0);
    	$.ajax({

			url : "/booking/searchCode",
			type : 'POST',
			data : {
				etc : code 
			},
			success : function(data) {
				var str;
				$("#booking_content").empty();
				if(data.length > 0){
					
					for ( var i in data) {
						
						str ="<tr class='t_title text-center'>"
						str += "<td>"+data[i].bk_date+"</td>"		
						str += "<td>"+data[i].bk_time+"</td>"
						str += "<td>"+data[i].bk_name+"</td>"
						str += "<td>"+data[i].bk_number+"</td>"
						str += "</tr>"
						$("#booking_content").append(str);
						
					}
				}else{
					
					str = "<tr>"
					str +=	"<td colspan='4' class='mt-3 text-center'>예약목록이 없습니다.</td>"
					str += "</tr>"
					
					$("#booking_content").append(str);
				}
				$("#table_box").switchClass("hide","on",1000);
			}
		})
    }
</script>

</html>