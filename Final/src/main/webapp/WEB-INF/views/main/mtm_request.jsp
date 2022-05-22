<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	    <script src="/resources/js/bootstrap.bundle.min.js"></script>
	    <script src="/resources/js/jquery.min.js"></script>
	    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	    <style>
	        *{
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	        
	    </style>
	    <title> 이메일 문의</title>
	</head>

<body>
    <div class="container">
        <div class="row">
            <h2 class="mt-3">이메일 문의</h2>
            <hr>
            <form class="mt-4 mb-3 text-center" id="form1" action="email_send" method="post"> 
                <div class="d-inline-block me-3 text-start">
                    500 Terry Francois St.
                    <br>
                    San Francisco,CA 94158
                    <br>
                    info@mysite.com
                    <br>
                    Tel: 123-456-7890
                    <br>
                    Fax: 123-456-7890
                    <br>
                </div>
                <div class="d-inline-block" style="width:500px">
                    <input type="text" class="form-control mb-2" id="name" placeholder="Name" name="senderName">
                    <input type="text" class="form-control mb-2" id="mail" placeholder="Email" name="senderMail">
                    <input type="hidden" name="receiveMail" value="steak.house20220202@gmail.com">
                    <input type="text" class="form-control mb-2" id="number" placeholder="Number" name="callNumber">
                </div>
                <br>
                <div class="d-inline-block">
                    <textarea style="width: 700px; height: 150px;" class="form-control" id="message"  placeholder="Message" name="message" ></textarea>
                </div>
                <br>
                <button type="button" class="btn btn-primary" onclick="checkNull()">전송</button>
            </form>
        </div>
    </div>
</body>

<script type="text/javascript">
    function checkNull() {

        if (!$('#name').val()) {
            alert("이름을 입력 하세요.");
			$('#name').focus();
            return;
        }
        
        if (!$('#mail').val()) {
            alert("이메일을 입력 하세요.");
			$('#mail').focus();
            return;
        }
        
        if (!$('#message').val()) {
            alert("내용을 입력 하세요.");
			$('#message').focus();
            return;
        }
		
		
        $('#form1').submit();

    }
    $(function () {
        $(document).on("click", ".close", function () {
            $(this).parent().remove();
        });

        $("#add_teg").click(function () {
            var instr = $(this).prev().val();
            if(instr){
                $(this).prev().val(null);
                var str = "<span class='badge bg-secondary me-3' style='position: relative;'>" + instr
                str = str + "<span class='close badge bg-danger'>&#215;</span>"
                str = str + "<input type='hidden' value='"+" "+"'>"
                str = str +"</span>"
                $("#teg_group").append(str);
           }
        });
    });

    

    // function sendFile(file) {
    //     data = new FormData();
    //     data.append("file", file);

    //     $.ajax({
    //         data: data,
    //         type: "POST",
    //         url: "/admin/upload",
    //         cache: false,
    //         contentType: false,
    //         enctype: "multipart/form-data",
    //         processData: false,
    //         success: function (data) {
    //             $("#summernote").summernote("insertImage", data);

    //         }
    //     });
    // }
</script>

</html>