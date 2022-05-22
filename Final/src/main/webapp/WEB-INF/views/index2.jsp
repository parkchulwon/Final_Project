<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.thumbnail{
	max-width:100%;
	height: auto;
}
</style>
    &nbsp;
    &nbsp;
<title>스테이크 하우스</title>
<div class="container" >

  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
        aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
        aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
        aria-label="Slide 3"></button>
    </div>
    	<div class="carousel-inner">
    <c:forEach var="i"  items="${f_list}" varStatus="status">
      	<div class="carousel-item <c:if test="${status.index == 0 }">active</c:if>" style="text-align : center;">
      		
        		<img src="/resources/upload/${i.f_savename}" class="#" alt="..." style="width: 1100px; height: 700px;">
      		
    	  </div>
    
    </c:forEach>
	    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  
	<div>
  		<img src="/resources/images/55555.png" class="thumbnail">
	</div>
  		<br>
	<div>
  		<img src="/resources/images/66666.png" class="thumbnail">
	</div>
  		<br>
	<div>
 		<img src="/resources/images/77777.png" class="thumbnail">
	</div>
	<%-- 
	<c:if test="${SID.user_no eq 1}">	
		<button type="button" class="btn btn-primary" onclick = "location.href = '/main/img_update' ">이미지 수정</button>
		<button type="button" class="btn btn-primary" onclick = "location.href = '/notice/header_update' ">내비게이션 수정</button>
	</c:if>
	 --%>
</div>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>