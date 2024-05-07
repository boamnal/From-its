<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- Bootstrap CSS -->
<!-- Bootstarp JS -->
<link href="/css/bootstrap.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>


<script>
    $(function () {
        $('#ok_btn').click(function (e) {
            e.preventDefault();

            let id = $('input[name="userId"]').val();
            let pwd = $('input[name="password"]').val();

            $.ajax({
                url: '<c:url value="/member/loginimpl"/>',
                type: 'POST',
                data: {id: id, pwd: pwd},
                success: function (response) {
                    if (response == "success") {
                        window.location.href = '/schedule';
                    } else {
                        alert(response); // 서버에서 반환한 오류 메시지를 표시합니다.
                    }
                },
                error: function () {
                    alert("통신 오류로 로그인 실패");
                }
            })
        })
    });

    let id_check = {
        init: function () {
            $('#userId').keyup(() => {
                let id = $('#userId').val();
                id_check.send(id);
            })
        },
        send: function (id) {
            $.ajax({
                url: '<c:url value="/member/checkid"/>',
                data: {'id': id},
                success: (result) => {
                    let msg = "";
                    let color = "blue";

                    if (result == '1') {
                        msg = "아이디가 존재하지 않습니다.";
                        color = "#E05938";
                    }
                    $('#check_msg').html(msg).css("color", color);
                }
            })
        }
    };
    $(function () {
        id_check.init();
    });
</script>

<style>
    .form-control::placeholder {
        color: #CCCCCC;
    }

</style>
<div style="margin: 0px 20px;">
    <div class="d-flex justify-content-center py-4" style="margin-top: 30px; margin-bottom: 20px;">
        <h1>로그인</h1>
    </div>

    <form id="reg_form">
        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="userId" class="flex-grow-1 mb-0 text-nowrap fw-medium">아이디</label>
                <input type="text" class="form-control me-2" id="userId" placeholder="ex) 삼식이" name="userId" required
                       style="margin:12px 24px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
            <span id="check_msg" style="color:#b5b6b7; margin-left: 69px;">* 회원가입 시 입력한 아이디를 입력해주세요</span>
        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="pwd" class="flex-grow-1 mb-0 text-nowrap fw-medium">비밀번호</label>
                <input type="password" class="form-control me-2" id="pwd" placeholder="ex) fromits123!" name="password"
                       required style="margin:12px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
        </div>

        <div class="px-4" style="margin-top: 35px">
            <input type="hidden" id="profile" name="profile">

            <button class="w-100 btn btn-primary rounded-3 fw-bolder" id="ok_btn"
                    style="padding: 12px 0;">로그인
            </button>
        </div>
    </form>
</div>


