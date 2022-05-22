<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

.g {
  width: 0px; height: 0px;
  transition: all ease 1s 0s;
}
.h {
  width: 550px; height: auto;
  transition: all ease 1s 0s;
  
}
.block1 {
	display : block;
	
}

.none1 {
	display : none;
	
}
</style>

<footer class="mt-5 navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container-fluid">
		<div style="color: white;font-size: 13px;margin: 15px 0;">
대표이사 : 김스테이크 주소 : 경기도 안양시 만안구 만안로 232 (안양동) 안양역사  7층
<br>
사업자등록번호 : 211-86-42619 통신판매업신고번호 : 제2019-경기안양-02729호 사업자정보확인
<br>
대표번호 : 1111-2222  /  딜리버리 주문번호 : 3333-4444
<br>
홈페이지 관련 문의070-1234-5678
<br>
상담시간 : 월~금 10:00~17:00(토/일, 공휴일 휴무, 점심시간 12:00~13:30)
<br>
copyright ⓒ STEAKHOUSE all rights reserved.
		</div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"  ><a href="/main/info" >스테이크하우스 이야기</a></li>
            <li class="breadcrumb-item"  ><a href="/booking/booking" >예약하기</a></li>
            <li class="breadcrumb-item"  ><a href="/notice/map" >찾아오시는 길</a></li>
         
         
          </ol>
    </div>
 
   		
		<div id="type2" class="g" style="position:fixed;bottom:30px;right:3px;overflow: hidden;">
			<div class="card mb-3">
  				<h3 class="card-header bg-primary text-white" >찾아오는 길</h3>
  				<div class="card-body con none1" id="a">
  				<div>
주소  : 경기도 안양시 만안구 만안로 232 (안양동) 안양역사  7층<br>
<br>
[버스]<br>
(일반)1, 1-2, 2, 3, 5, 6, 8, 8-1, 8-2, 9, 9-3, 10, 11, 11-3, 12, 15, 15-1, 15-2, 
	 20, 31-7, 32, 52, 64, 65, 80, 81, 83, 88, 350<br>
<br>
(마을)1, 2, 3-1, 9<br>
<br>
(직행)333, 1303, 1650, 3330<br>
  				</div>
  				
  				</div>
  				
  				<h3 class="card-header bg-primary text-white">예약하는 방법</h3>
  				<div class="card-body con none1" id="b">
  			<div>
  1. 상단 예약하기를 눌러주세요.<br>
  <br>
  2. 예약 날짜와 시간을 정해주세요.<br>
  <br>
  3. 성함, 연락처, 요청사항 등을 기재해주세요.<br>
  <br>
  4. 개인정보 이용동의를 해주시고 예약완료를 누르시면 예약이 끝납니다.<br>
  <br>
  5. 재확인시에는 예약 조회를 이용해주세요.<br>
  				
  			</div>
  				</div>
  				 
  				<h3 class="card-header bg-primary text-white" >불만/건의사항이 있어요 </h3>
  				<div class="card-body con none1 " id="c">
					<div>
1. 상단에 고객의 소리란을 활용해주세요.<br>
<br>
2. 1:1 문의에 직원 칭찬, 건의사항 등을 입력해주세요.<br>
<br>
3. 이메일이나 휴대폰 문자메시지로 결과를 통보해드립니다.<br>
			
					</div>
  				</div>
  				
  				<h3 class="card-header bg-primary text-white">인재 채용</h3>
  				<div class="card-body con none1" id="d">
					<div>
입사지원서를 다운로드 하셔서 원하는 매장의 공고에 지원해 주세요.<br>	
<br>				
지원서 작성 시 참고 사항<br>
1. 입사지원 관련 궁금하신 사항은<br>
 고객의 소리를 이용해 주시기 바랍니다.<br>
<br>
2. 입사관련 일정/합격여부는 각 매장별 담당자가 <br>
직접 전화/이메일을 통해 공지합니다.<br>

					</div>
					
  				</div>
  				
 			 </div>
 		
		
		</div>
  
    <div style="position:fixed;bottom:30px;right:15px;" id ="asd" rel="nofollow"  title="Back to Top" style="font-size:2em" onclick="toggle()">
    
    	<button type="button"style="color: #fff; background:#325d88; font-size:1em; border-radius:0.3em; padding:5px 10px;">Help</button>
    </div>


<script type="text/javascript">
function toggle() {
	
	if($("#type2").css("overflow") == "auto") {
		
	$("#type2").css("overflow","hidden");

		
	}else {
		$("#type2").css("overflow","auto");		
		
	}
	
}

$(".card-header").on("click", function() {
	
	

	
	$(".con").removeClass("block1");
	$(".con").addClass("none1");

	console.log($(this).next().text());
	if($(this).next().css("display") == "none") {
		
	$(this).next().css("display","block");
	console.log("click1");
		
	}else {
		$(this).next().css("display","none");	
		console.log("click2");
			} 
	
			
})


$("#asd").click(function(){
	
	
	if($("#type2").attr("class") == "g" ){
		$("#type2").attr("class","h"); 
	}else if($("#type2").attr("class") == "h"){
		$("#type2").attr("class","g");
		
	}
	
})
</script>
</footer>

