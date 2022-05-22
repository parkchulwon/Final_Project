<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<title>공지수정</title>
<body>
    <div class="mt-4">
        <div class="container">
			<form action="notice_updateproc" method="post" enctype="multipart/form-date" id="form1">
				<input type="hidden" value="${result.notice_no}" name="notice_no" >
				<div class="form-group">
					<input type="text" class="form-control" placeholder="제목을 입력해 주세요" id="title" name="notice_title" value="${result.notice_title}">
				</div>
				
				<div class="form-group mt-1">
					<textarea class="form-control" rows="5" id="summernote" name="notice_content">${result.notice_content }</textarea>
				</div>
				
				<diV class="text-center mt-3">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="button" class="btn btn-primary" onclick="checkNull()">등록</button>
				</diV>
			</form>
		</div>
    </div>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script type="text/javascript">
    function checkNull() {

        if (!$('#title').val()) {
            alert("제목을 입력 하세요.");

            return;
        }

        if (!$('#summernote').val()) {
            alert("내용을 입력 하세요.");

            return;
        }

        $('#form1').submit();

    }

    $(function () {
        $('#summernote').summernote({
            tabsize: 2,
            height: 400,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload: function (files) {
                    if (files[0].size > 1024 * 1024 * 5) {
                        alert(files[i].name + "5MB 미만의 이미지만 업로드 가능합니다.");
                        return;
                    }
                    sendFile(files[0]);
                }
            }
        });
    });

    function sendFile(file) {
        data = new FormData();
        data.append("file", file);

        $.ajax({
            data: data,
            type: "POST",
            url: "/notice/upload",
            cache: false,
            contentType: false,
            enctype: "multipart/form-data",
            processData: false,
            success: function (data) {
                $("#summernote").summernote("insertImage", data);

            }
        });
    }
</script>

</html>