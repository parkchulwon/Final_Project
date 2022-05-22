<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="/resources/css/make-datepicker.css">
<script src="/resources/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.ko.min.js"></script>
    
<title>예약</title>
<body>
	<div class="container">
		<div class="row py-4">
			<div class="col">
				<div class="text-center">
					<h1>예약하기</h1>
				</div>
			</div>
		</div>


		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-8">				
				<form action="bookinginsert" method="post" id="registration">
					<nav>
						<div class="nav nav-pills nav-fill" id="nav-tab" role="tablist">
							<a class="nav-link active" id="step1-tab" data-bs-toggle="tab" href="#step1">날짜 및 시간 </a>
							<a class="nav-link" id="step2-tab" data-bs-toggle="tab" href="#step2">예약자 상세정보</a>
							<a class="nav-link" id="step3-tab" data-bs-toggle="tab" href="#step3">예약확인</a>
						</div>
					</nav>
					<div class="tab-content py-4">
						<div class="tab-pane fade show active" id="step1">
							<p class="">날짜 및 시간</b></p>
							<hr>
							<div class="row justify-content-center mx-0">
								<div class="col-lg-10">
									<div class="card border-0">
										<div class="card-header bg-primary">
											<div class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1">
												<input required style="width: initial !important;" type="text" id="datePick"
												 class="datepicker is-invalid me-1" placeholder="날짜를 선택해 주세요." name="bk_date" readonly>
												<span class="fa fa-calendar" style="width: initial;"></span>
											</div>
										</div>
										<input type="hidden" id="timePick" required name="bk_time">
										<input type="hidden" id="bk_datetime" name="bk_datetime">
										<div class="card-body p-3 p-sm-5">
											<div class="row text-center mx-0">
												<c:forEach var="i" items="${bkVO.timeTable}">
												<div class="col-md-4 col-4 my-1 px-2">
													<div class="cell py-1 pick">${ i }</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="tab-pane fade" id="step2">
							<p class="">예약자 상세정보</b></p>
							<hr>
							<div class="row mb-3 text-center">
								<div class="col-md-2 col-2">예약자</div>
								<div class="col-md-10 col-10">
									<input type="text" name="bk_name" class="form-control" id="bk_name" required value='<c:if test="${not empty sessionScope.SID }">${sessionScope.SID.user_name }</c:if>'>
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-md-2 col-2">연락처</div>
								<div class="col-md-10 col-10">
									<input type="tel" name="bk_number" class="form-control" id="bk_number"  placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"  required value='<c:if test="${not empty sessionScope.SID }">${sessionScope.SID.user_number }</c:if>'>
								</div>
							</div>
							<div class="row mb-3 text-center">
								<div class="col-md-2 col-2">이메일</div>
								<div class="col-md-10 col-10">
									<input type="email" name="bk_email" class="form-control" id="bk_email" required value='<c:if test="${not empty sessionScope.SID }">${sessionScope.SID.user_email }</c:if>'>
								</div>
							</div>


							<div class="mb-3">
								<label for="order-detail">요청사항</label>
								<textarea name="order-detail" rows="5" class="form-control" id="order-detail" placeholder="요청하실 내용을 적어주세요."></textarea>
							</div>
						</div>

						<div class="tab-pane fade" id="step3">
							<p class="">예약확인</b></p>
							<hr>
							<div style="height: 250px; overflow: auto;">개인정보보호법에 따라 스테이크하우스에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
<p class="mt-3"><b>1. 수집하는 개인정보</b></p>
이용자는 회원가입을 하지 않아도 정보 검색, 게시물 보기 등 대부분의 스테이크하우스 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 스테이크하우스는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 스테이크하우스가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
<p class="mt-3"><b>서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.</b></p>
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.

- 스테이크하우스 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

<p class="mt-3"><b>서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.</b></p>
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
스테이크하우스에서 제공하는 위치기반 서비스에 대해서는 '스테이크하우스 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
<p class="mt-3"><b>2. 수집한 개인정보의 이용</b></p>
스테이크하우스 및 스테이크하우스 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 스테이크하우스 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
<p class="mt-3"><b>3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.</b></p>
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
ID : 서비스 탈퇴 후 6개월 보관

<p class="mt-3"><b>전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 스테이크하우스는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.</b></p>
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 통신비밀보호법
로그인 기록: 3개월
참고로  ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
<p class="mt-3"><b>4. 개인정보 수집 및 이용 동의를 거부할 권리</b></p>
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</div>
						<hr>
						<div class="mb-3"  style="text-align: end;"><h6> 개인정보 수집동의<i class="text-primary">(필수)</i> <input class="form-check-input" type="checkbox" id="bk_agreed1" name="bk_agreed1" value="true"></h6></div>
						</div>
						
					</div>
					
					<div class="row justify-content-between">
						<div class="col-auto">
							<button type="button" class="btn btn-secondary" data-enchanter="previous">이전</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-primary" data-enchanter="next">다음</button>
							<button type="button" class="btn btn-primary" data-enchanter="finish" onclick="sub()">예약완료</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="/resources/js/enchanter.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datepicker').datepicker({
            format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
            startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
            endDate: '+30d', 
            datesDisabled: ['2022-03-11', '2022-03-12'],
            /* todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false */
            language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
            , autoclose: true
        });
        
        $(document).on("click",".cell",function(){
        	if($("#datePick").val()){
	            $('.cell').removeClass('select');
	            $(this).addClass('select');            
	            $("#timePick").val($(this).text());
	            $("#bk_datetime").val($("#datePick").val()+" "+$("#timePick").val());
        	}else{
        		alert("날짜를 선택해 주세요.");
        		$("#datePick").focus();
        	}
        });
        
        
    });

    
    
    $(document).on("change","#datePick",function(){
    	var pick = document.getElementsByClassName('pick');
    	
    	$.ajax({
			url : "/booking/bookingTimeSet",
			type : 'POST',
			data : {
				bk_date : $(this).val()
			},
			success : function(data) {
		    	for (var i = 0; i < pick.length; i++) {
			    	pick[i].classList.add('cell');
			    	pick[i].classList.remove('disabled');
		    		for(var j = 0; j < data.length; j++){
		    			
		    			if(pick[i].innerText == data[j].bk_time ){
		    				pick[i].classList.toggle('cell');
		    				pick[i].classList.toggle('disabled');
		
		    			}
		    		}
					
				}
			}
		})
    });
    
    
    
    function timeSet() {
    	
	}
    
    
	function sub() {
		if(!$("#datePick").val() ){
			alert("날짜가 선택되지 않았습니다.");
			return;
		}else if(!$("#timePick").val() ){
			alert("예약시간이 선택되지 않았습니다.");
			return;
		}else if(!$("#bk_name").val()){
			alert("이름이 입력되지 않았습니다.");
			return;
		}else if(!$("#bk_number").val()){
			alert("연락처가 입력되지 않았습니다.");
			return;
		}else if(!$("#bk_email").val()){
			alert("이메일이 입력되지 않았습니다.");
			return;
		}else if(!$("#bk_agreed1").prop("checked")){
			alert("필수항목에 동의 해주세요.");
			return;
		}else{
			$("#bk_agreed1").val(1);
			$("#registration").submit();
		}
	}
    
    
    var registrationForm = $('#registration');
    
    var formValidate = registrationForm.validate({
      errorClass: 'is-invalid',
      errorPlacement:()=> false
    });

    const wizard = new Enchanter('registration', {}, {
		onNext: ()=> {
			if (!registrationForm.valid()) {
	        	formValidate.focusInvalid();
				return false;
			}
		}
    });
</script>
</html>
