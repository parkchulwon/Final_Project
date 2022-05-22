<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


</head>  

<h1>상단 내비게이션 수정</h1>
<hr></hr>
<div class="container">
    <div class="row">
    	<c:forEach var="i" items="${nav_result}">
    	<c:if test="${i.nav_depth == 0}">
        <div class="col-md-6">
            <fieldset>
                <legend class="mt-4 text">${i.nav_title }</legend>
                <input class="d_input" type="text" style="display: none;" name="nav_title">
                <input type="hidden" value="1" name="nav_no">
                &ensp;
                <c:forEach var="result2" items="${nav_result}">
                <c:if test="${result2.nav_parent == i.nav_no }">
                <div class="form-check form-switch">
                  <input class="form-check-input hide_check" type="checkbox" id="flexSwitchCheck1" name="nav_available" value ="${result2.nav_no}"<c:if test="${result2.nav_available == 1 }">checked=""</c:if>>                 
                   <label class="form-check-label text" for="" name="title" >${result2.nav_title }</label>
                  <input class="d_input" type="text" style="display: none;" name="nav_title" accesskey="${result2.nav_no }">
                  <input type="hidden" value="5" name="nav_no">
                  &ensp;
                  <lavel class="text hide_check" name="etc" >${result2.etc }</lavel>
                  <input class="d_input" type="text" style="display: none;" name="etc" accesskey="${result2.nav_no }">
                  <input type="hidden" value="5" name="nav_no">
                </div>
                &ensp;
                </c:if>
                </c:forEach>
                
              </fieldset>

        </div>
        </c:if>
        </c:forEach>
     </div>
</div>
<hr>


 
 
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/jquery.min.js"></script>
  <script type="text/javascript">



// #은 아이디값 얘는 하나만 존재할 수 있음
// .은 클래스값 얘는 여러개 존재할 수 있음

			$(".text").dblclick(function() {

				$(this).css("display", "none");
				$(this).next().css("display", "block");
				$(this).next().focus();

			});
			
			
			$(".d_input").focusout(function() {
				var bool; //수정할 텍스트가 타이틀인지 etc인지 구분하기 위해 bool 사용 
				if($(this).attr("name") == "nav_title"){
					bool = 1;
				} else {
					bool = 0;
				}
				if ($(this).val() || !$(this).val() == "") { // this 밸류값이 비어있거나 공백이면 선택한 this의 다음 텍스트값이 내가 입력한 밸류값과 같게끔 처리(수정) 

					$(this).prev().text($(this).val());
					$(this).prev().css("display", "block");
					$(this).css("display", "none");
					a_update($(this).val(),bool,$(this).attr("accesskey"));
				} else {
					
					$(this).prev().css("display", "block");
					$(this).css("display", "none");
				}

			})
			  $(document).ready(function() {


			$(".d_input").keyup(function(key) {
				var bool;
				if($(this).attr("name") == "nav_title"){
					bool = 1;
				} else {
					bool = 0;
				}
				if(key.keyCode == 13){
						
					if ($(this).val() || !$(this).val() == "") {
		
						$(this).prev().text($(this).val());
						$(this).prev().css("display", "block");
						$(this).css("display", "none");
						a_update($(this).val(),bool,$(this).attr("accesskey"));
					} else {
						$(this).prev().css("display", "block");
						$(this).css("display", "none");
					}
		
				}
			})
			})
			
			$(".hide_check").change(function(){
				var no = $(this).val();
				var ava;
				if($(this).is(":checked")) {
					
					
					ava = 1; 
				} else {
					
					ava = 0; 
				}
				hide(no, ava);
				
			})
			
			
			function hide(no, ava) {
				
				$.ajax({

					url : "/jquery/hide",
					type : "POST",
					data : {
						nav_no : no,
						nav_available : ava
					},
					success : function() {

						
					}

				})
				
			}
			
function a_update(text, bool, no) { //텍스트 불 no받아서 제이쿼리로 보냄 

				
				$.ajax({

					url : "/jquery/a_update",
					type : "POST",
					data : {
						bool : bool, 
						etc : text, 
						nav_no : no 
					},
					success : function() {

						
					}

				})
				
			}
			
		</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
