<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/css/theme-1.css">
<title>스테이크 하우스</title>
<style>
.thumbnail{
	max-width:100%;
	height: auto;
}.
</style>
<div id="hero" class="hero-section active">
	<div class="content-wrapper">
		<div class="container text-center">
			<div class="branding">
				<div class="script">Welcome to</div>
				<h1 class="logo text-center">
					<img class="img-fluid block-center"
						src="/resources/images/steakehouse4.png" alt="logo">
				</h1>
				<!--//logo-->
				<div class="tagline text-center">
					<ul class="list me-auto ms-auto">
						<li class="type"> <i class="fa fa-coffee" aria-hidden="true"></i> Cafe </li>
						<li class="type ms-2"> <i class="fa fa-cutlery" aria-hidden="true"></i> Restaurant </li>
						<li class="type ms-2"> <i class="fa fa-glass" aria-hidden="true"></i> Wine Bar </li>
					</ul>
				</div>
				<!--//tagline-->
			</div>
			<!--//branding-->
			<h2 class="promo-line">Steak house, the taste recognized</h2>
			<!--//promo-->
			<div class="cta-container">
				<button type="button" class="btn btn-theme-primary"
					data-bs-toggle="modal" data-bs-target="#reserve-modal"
					onclick="location='/booking/booking'">Book a Table</button>
			</div>
			<!--//cta-container-->
		</div>
		<!--//container-->
	</div>
	<div class="bg-slider-wrapper">

		<div id="bg-carousel"
			class="bg-carousel carousel slide carousel-fade pointer-event"
			data-bs-ride="carousel">
			<div class="carousel-inner carousel-zoom">
				<div class="carousel-item slide-1">
					<div
						class="d-flex align-items-center justify-content-center min-vh-100">

					</div>
				</div>
				<div class="carousel-item slide-2" data-bs-interval="6000">
					<div
						class="d-flex align-items-center justify-content-center min-vh-100">

					</div>
				</div>
				<div class="carousel-item slide-3 active" data-bs-interval="6000">
					<div
						class="d-flex align-items-center justify-content-center min-vh-100">

					</div>
				</div>

			</div>
		</div>
		<!--//bg-carousel-->
	</div>
	<!--//bg-slider-wrapper-->
</div>
<div id="menus" class="menus-section active">
        <div class="container text-center">
            <h2 class="section-title">
                <span class="script">Discover</span>
                <span class="title-text">Go To Menus</span>
                <span class="title-border"></span>
            </h2>
            
            <div class="featured">
                <h3 class="title script">Signature Dishes</h3>
                <div class="media-wrapper row">
                    <div class="col-left col-12 col-md-8">
                        <div class="row">
                            <div class="col-12"> 
                                <div class="media-item">
                                    <div class="media-item-inner">
                                        <img class="img-fluid" src="/resources/images/menu/media-1.jpg" alt="">
                                        
                                    </div><!--//media-item-inner-->
                                </div><!--//media-item-->
                            </div>
                            
                            <div class="col-12 col-md-6">    
                                <div class="media-item">
                                    <div class="media-item-inner">
                                        <img class="img-fluid" src="/resources/images/menu/media-2.jpg" alt="">
                                       
                                    </div><!--//media-item-inner-->
                                </div><!--//media-item-->
                            </div>
                            <div class="col-12 col-md-6"> 
                                <div class="media-item">
                                    <div class="media-item-inner">
                                        <img class="img-fluid" src="/resources/images/menu/media-3.jpg" alt="">
                                       
                                    </div><!--//media-item-inner-->
                                </div><!--//media-item-->
                            </div>
                        </div><!--//row-->
                    </div>
                    
                    <div class="col-right col-12 col-md-4">
                        <div class="media-item">
                            <div class="media-item-inner">
                                <img class="img-fluid" src="/resources/images/menu/media-4.jpg" alt="">
                              
                            </div><!--//media-item-inner-->
                        </div><!--//media-item-->
                        
                        <div class="media-item">
                            <div class="media-item-inner">
                                <img class="img-fluid" src="/resources/images/menu/media-5.jpg" alt="">
                                
                            </div><!--//media-item-inner-->
                        </div><!--//media-item-->
                    </div><!--//col-right-->

                </div><!--//media-wrapper-->
            </div><!--//featured-->
        </div><!--//container-->
    </div>
<script type="text/javascript">
$(function () {
	$(".media-item").click(function(){
		location.href='/menu/menuboard';
	});
});
</script>

</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>