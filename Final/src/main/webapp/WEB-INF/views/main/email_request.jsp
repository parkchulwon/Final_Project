<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
    <div class="container">
        <div class="row">
            <h2 class="mt-3">이메일 문의</h2>
            <hr>
            <form class="mt-4 mb-3 text-center" id="form1" action="email_send" method="post"> 
                <div class="d-inline-block me-3 text-start">
                    경기도 안양시 만안구 만안로 232
                    <br>
                    (안양동) 안양역사 7층
                    <br>
                    <small>steak.house20220202@gmail.com</small>
                    <br>
                    Tel: 1111-2222
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
                    <textarea style="width: 750px; height: 150px;" class="form-control" id="message"  placeholder="Message" name="message" ></textarea>
                </div>
                <br>
                <button type="button" class="btn btn-primary" onclick="checkNull()">전송</button>
            </form>
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
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