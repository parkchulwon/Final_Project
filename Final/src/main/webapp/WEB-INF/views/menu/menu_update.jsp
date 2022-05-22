<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<style>
		* {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		.form-group * {
			width: auto;
		}
		
		.badge {
			font-size: 15px !important;
			font-weight: normal;
		}
		
		.close {
			line-height: 1.4;
			cursor: pointer;
			font-size: 6px !important;
			border-radius: 50% !important;
			display: inline-block;
			content: "\00d7";
			font-size: 15pt;
			position: absolute;
			top: -5px;
		}
		.image-box {
		    overflow: hidden;
		    padding-top: 10px;
		}
		.img-wrapper {
			position: relative;
		    max-height: 140px;
		    max-width: 140px;
		}
		.form-label {
			width: 100px;
		}
		
		.list-group-item {
			border: none !important;
		}
		
		.list-group {
			border: 1px solid rgba(0, 0, 0, .125);
		}
		.small{
			font-size: 0.75em !important;
			
		}
		.small:hover{
		    cursor: pointer;
		}
	</style>
	<link rel="stylesheet" href="/resources/css/menu.css">
</head>

<body >
	<div class="container">
		<div class="row" >
			<div class="col-md-5">
				<div class="bs-component mt-4">
					<span class="badge small rounded-pill bg-primary eButton" id="addGroup"><i class="fa fa-plus"></i> 그룹추가</span>
					<span class="badge small rounded-pill bg-primary eButton" id="addMenu"><i class="fa fa-plus"></i> 메뉴추가</span>
					<span class="badge small rounded-pill bg-primary eButton" id="remove"><i class="fa fa-minus"></i> 삭제</span>
				</div>
				
				<div class="list-group mt-1 mb-3 overflow-auto" style="height:530px;" id="menuList">
					<c:forEach var="menu" items="${result }" varStatus="idx2">	
						<c:if test="${menu.menu_group eq '1' }">
						<div class="list-group-box${menu.menu_no }" accesskey="${menu.menu_no }">
							<a href="#" class="list-group-item list-group-item-action menuGroup fs-5" 
							 accesskey="${menu.menu_no }">${menu.menu_name }</a>
							<c:forEach var="menus" items="${result }">
							<c:if test="${menu.menu_name eq menus.menu_group }">
							<a href="#" class="list-group-item list-group-item-action ps-5 menu" 
							accesskey="${menus.menu_no }">${menus.menu_name }</a>
							</c:if>
							</c:forEach>
						</div>
						</c:if>
					</c:forEach>
					
				</div>

			</div>
			<div class="col-md-7">
				<form class="mt-5 mb-3" id="form1" action="menu_updateProc" enctype="multipart/form-data" method="post">
					<div class="form-group d-flex mb-3">
						<label for="menu_group" class="form-label mt-2">메뉴 그룹</label>
						<select class="form-select menu_grouplist showInfo" id="menu_group">
							<c:forEach var="menu" items="${result }" varStatus="idx2">
							<c:if test="${menu.menu_group eq '1' }">
								<option value="${menu.menu_name }">${menu.menu_name}</option>
							</c:if>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group d-flex mb-3">
						<label for="menu_name" class="form-label mt-2">메뉴 이름</label>
						<input type="text" class="form-control showInfo" id="menu_name" placeholder="메뉴이름을 작성하세요">
					</div>
					<div class="form-group d-flex mb-3">
						<label for="menu_price" class="form-label mt-2">메뉴 가격</label>
						<input type="text" class="form-control showInfo" id="menu_price" placeholder="메뉴가격을 작성하세요">
					</div>
					<div class="form-group d-flex mb-3">
						<label for="menu_info" class="form-label mt-2">메뉴 설명</label>
						<textarea class="form-control showInfo" id="menu_info" rows="2" style="width: 300px; height: 40px;"></textarea>
					</div>
					<div class="form-group d-flex mb-3">
						<label for="teg" class="form-label mt-2">재료 원산지</label>
						<input type="text" class="form-control showInfo" id="menu_teg" placeholder="ex) 돼지갈비:스페인산">
					</div>
					
					<p for="teg" class="mt-2">상품 이미지 선택</p>
					<div class="form-group d-flex mb-3" id="fileBox">
					<c:forEach items="${result}" var="hiddenInput" varStatus="i">
						<input type="file" name="menu_list[${i.index}].menu_file" id="hidden_menu_file${hiddenInput.menu_no}" class="showInfo form-control file" style="display: none" accept="image/*"/>
					</c:forEach>
					
					</div>
					<c:forEach items="${result}" var="imgBox">
						<div id ="hidden_menu_img${imgBox.menu_no}" class="img-wrapper file" style="display: none">
						<c:if test="${!empty imgBox.f_savename}">
		                    <img class="" src="/resources/upload/${imgBox.f_savename}">
						</c:if>
		                </div>
					</c:forEach>
					<!-- 로우 값이 바뀌거나, 추가 -->
					
					<div style="display: none;" id="menu_list_box">
						<c:forEach items="${result}" var="hiddenInput" varStatus="i">
						<div style="display: none;" id="menu_list${hiddenInput.menu_no}" accesskey="${hiddenInput.menu_no}" class="menu_list">
							<input type="hidden" name="menu_list[${i.index}].menu_no" class="hidden_menu_no" value="${hiddenInput.menu_no}"/>
							<input type="hidden" name="menu_list[${i.index}].menu_group" class="hidden_menu_group"  value="${hiddenInput.menu_group }"/>
							<input type="hidden" name="menu_list[${i.index}].menu_name" class="hidden_menu_name" value="${hiddenInput.menu_name}"/>
							<input type="hidden" name="menu_list[${i.index}].menu_price" class="hidden_menu_price" value="${hiddenInput.menu_price}"/>
							<input type="hidden" name="menu_list[${i.index}].menu_info" class="hidden_menu_info" value="${hiddenInput.menu_info}"/>
							<input type="hidden" name="menu_list[${i.index}].menu_teg" class="hidden_menu_teg" value="${hiddenInput.menu_teg}"/>
							<input type="hidden" name="menu_list[${i.index}].etc" class="hidden_etc" value="${hiddenInput.etc}" />
							<input type="hidden" name="menu_list[${i.index}].bool" class="hidden_bool" value="${hiddenInput.bool}"/>
							
						</div>
						</c:forEach>
						
						
					</div>
				</form>
			</div>
				<diV class="text-center">
					<button type="submit" class="btn btn-primary" onclick="submit()">등록</button>
					<button type="button" class="btn btn-warning" onclick="history.back()">취소</button>
				</diV>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript">
	var index = 1;
	var info;
	function submit(){
		
		$("#form1").submit();
	}
	$(function(){
		
		// list 클릭시 메뉴정보 값 가져오기
		$(document).on("click",".list-group-item",function(){
			$(".list-group-item").removeClass("active")
			$(this).addClass("active")
					
			
			index = $(this).attr('accesskey');
			info = $("#menu_list"+index);
			
			/* console.log("index ->" + index );
			
			console.log("info ->" + info.val() ); */
			$(".file").css("display","none");
			$("#hidden_menu_file"+index).css("display","block");
			$("#hidden_menu_img"+index).css("display","block");
			
			
			if(info.find(".hidden_menu_group").val() == 1){
				$("#menu_name").val(info.find(".hidden_menu_name").val());
				$("label[for='menu_name']").text("그룹 이름");	
			}else{
				$("label[for = 'menu_name']").text("메뉴 이름");
				$("#menu_name").val(info.find(".hidden_menu_name").val());
				$("#menu_group").val(info.find(".hidden_menu_group").val()).prop("selected", true);
			}
				$("#menu_price").val(info.find(".hidden_menu_price").val());
				$("#menu_info").val(info.find(".hidden_menu_info").val());
				$("#menu_teg").val(info.find(".hidden_menu_teg").val());
				$("#menu_tegView").html(info.find(".hidden_menu_teg").val()+"<span class='close badge bg-danger'>&#215;</span>");
			
				
		})
		
		
		// 그룹,메뉴 추가,삭제
		$(document).on("click",".eButton",function(){
			var ids = $(this).attr("id");
			var str;
			var valueStr;
			var list = $("#menuList").find(".active");
			var listidex = $(".list-group-item").length;
			var key = listidex+1;
			var group = info.find(".hidden_menu_group").val();
			var menuGroupCount = $(".menuGroup").length+1;
			
			/* console.log("ids ->"+ ids);
			console.log("list ->" + list);
			console.log("listidex ->" + listidex);
			console.log("group ->" + group); */
			
			
			switch(ids){
			case "addGroup" :
				str =" <div class='list-group-box"+key+"' accesskey='"+key+"'>"
				str += "<a href='#' class='list-group-item list-group-item-action menuGroup fs-5' accesskey='"+key+"'>새로운 그룹"+menuGroupCount+"</a>"
				str += "</div>"
				$("#menuList").append(str);
				
				valueStr = "<div style='display: none;' id='menu_list"+key+"' accesskey='"+key+"' class='menu_list'>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_group' class='hidden_menu_group' value='1'>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_name' class='hidden_menu_name' value='새로운 그룹"+menuGroupCount+"'>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_price' class='hidden_menu_price' value=''>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_info' class='hidden_menu_info' value=''>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_teg' class='hidden_menu_teg' value=''>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].etc' class='hidden_etc' value='1'>"
				valueStr += "<input type='hidden' name='menu_list["+listidex+"].bool' class='hidden_bool' value='1'>"
				valueStr +="</div>"
				$("#menu_list_box").append(valueStr);
				
				
				valueStr += "<input type='file' name='menu_list["+listidex+"].menu_file' class='hidden_menu_file' value=''>"				
			    $("#menu_group").append("<option value='새로운 그룹"+menuGroupCount+"'>새로운 그룹"+menuGroupCount+"</option>");
				$("#fileBox").append("<input type='file' name='menu_list["+listidex+"].menu_file' id='hidden_menu_file"+key+"' class='showInfo form-control file' style='display: none' accept='image/*'/>");
				
		
				break;
				
			case "addMenu" :
				if(group == 1){
					var groupName = info.find('.hidden_menu_name').val();
					str = "<a href='#' class='list-group-item list-group-item-action ps-5 menu' accesskey='"+key+"'>새로운 메뉴</a>"
					$(".list-group-box"+index).append(str);
					
					valueStr = "<div style='display: none;' id='menu_list"+key+"' accesskey='"+key+"' class='menu_list'>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_group' class='hidden_menu_group' value='"+groupName+"'>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_name' class='hidden_menu_name' value='새로운 메뉴'>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_price' class='hidden_menu_price' value='0'>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_info' class='hidden_menu_info' value=''>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].menu_teg' class='hidden_menu_teg' value=''>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].etc' class='hidden_etc' value='1'>"
					valueStr += "<input type='hidden' name='menu_list["+listidex+"].bool' class='hidden_bool' value='1'>"
					valueStr += "<input type='file' name='menu_list["+listidex+"].menu_file' class='hidden_menu_file' value=''>"
					valueStr +="</div>"
					
					$("#menu_list_box").append(valueStr);
					
					$("#fileBox").append("<input type='file' name='menu_list["+listidex+"].menu_file' id='hidden_menu_file"+key+"' class='showInfo form-control file' style='display: none' accept='image/*'/>");
					
				}else{
					alert("그룹을 선택해 주세요");
				}
				
				break;
				
			case "remove" :
				if(group == 1){
					if(confirm("그룹 삭제시 하위 메뉴가 모두 삭제 됩니다. 그래도 삭제 하시겠습니까?")){
						console.log(list.text());
						list.parent().css("display","none");
						info.find(".hidden_etc").val(0);
					}else{
						break;
					}
				}else{
						list.css("display","none");
						info.find(".hidden_etc").val(0);
				}
				break;
			}
		});
		
		$("#menu_nameSelect").change(function(){
			$(".list-group-item").removeClass("active");
			$(this).addClass("active");
		})
		
		
		// 입력값이 변경되면 기존입력값을 수정함
		$(".showInfo").change(function(){
			
			var menuID = $(this).attr("id");
			info.find(".hidden_"+menuID).val($(this).val());
			info.find(".hidden_bool").val(1);
			
			if(menuID == "menu_name"){
				$("#menuList").find(".active").text($(this).val());
			}
		});
		
		$(".list-group-item").first().click();
	});
</script>
</html>
