<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<style>
.img-wrapper {
	position: relative;
	max-height: 150px;
	max-width: 200px;
	width: 200px;
    height: 150px;
}
.img-wrapper img {
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(50, 50);
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: auto;
}
</style>
<head>
<title></title>
</head>
<body>
		<div class="container">
		<h1>이미지 수정</h1>
		<hr>
	<form action="img_updateproc" method="post"
		enctype="multipart/form-data">
			<label for="formFile" class="form-label f_path"></label>
			<div class="mb-3" style="display: flex;">
				<div id="hidden_menu_img" class="img-wrapper file">
					<img class="" src="/resources/upload/${f_list[0].f_savename}">
				</div>
				<div class="form-group ms-2 mt-5" >
					<input class="form-control fileInput" type="file" id="formFile"	name="upload" style="width: 500px;">
				</div>
			</div>
			<hr>
			<div class="mb-3" style="display: flex;">
				<div id="hidden_menu_img" class="img-wrapper file">
					<img class="" src="/resources/upload/${f_list[1].f_savename}">
				</div>
				<div class="form-group ms-2 mt-5" >
					<input class="form-control fileInput" type="file" id="formFile"	name="upload" style="width: 500px;">
				</div>
			</div>
			<hr>
			<div class="mb-3" style="display: flex;">
				<div id="hidden_menu_img" class="img-wrapper file">
					<img class="" src="/resources/upload/${f_list[2].f_savename}">
				</div>
				<div class="form-group ms-2 mt-5" >
					<input class="form-control fileInput" type="file" id="formFile"	name="upload" style="width: 500px;">
				</div>
			</div>
			<hr>
			
			<br> <input type="submit" value="업로드">
	</form>
</div>

</body>
<script type='text/javascript'>
			//1MB(메가바이트)는 1024KB(킬로바이트)
			var maxSize = 2048;
			
			function fileCheck() {
				//input file 태그.
				var file = document.getElementById('fileInput');
				//파일 경로.
				var filePath = file.value;
				//전체경로를 \ 나눔.
				var filePathSplit = filePath.split('\\'); 
				//전체경로를 \로 나눈 길이.
				var filePathLength = filePathSplit.length;
				//마지막 경로를 .으로 나눔.
				var fileNameSplit = filePathSplit[filePathLength-1].split('.');
				//파일명 : .으로 나눈 앞부분
				var fileName = fileNameSplit[0];
				//파일 확장자 : .으로 나눈 뒷부분
				var fileExt = fileNameSplit[1];
				//파일 크기
				var fileSize = file.files[0].size;
				
				console.log('파일 경로 : ' + filePath);
				console.log('파일명 : ' + fileName);
				console.log('파일 확장자 : ' + fileExt);
				console.log('파일 크기 : ' + fileSize);
			}
			
			$(".fileInput").change(function(){
				var file = $(this);
				var filePath = file.val();
				//전체경로를 \ 나눔.
				var filePathSplit = filePath.split('\\'); 
				//전체경로를 \로 나눈 길이.
				var filePathLength = filePathSplit.length;
				//마지막 경로를 .으로 나눔.
				var fileNameSplit = filePathSplit[filePathLength-1].split('.');
				//파일명 : .으로 나눈 앞부분
				var fileName = fileNameSplit[0];
				//파일 확장자 : .으로 나눈 뒷부분
				var fileExt = fileNameSplit[1];
				//파일 크기
				/* var fileSize = file.files[0].size; */
				$(this).siblings(".f_path").val(filePath);
				console.log(filePath);
				console.log(filePathSplit);
				console.log(fileName);
				console.log(fileExt);
			})
			
			
		
		</script>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
