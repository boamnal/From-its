<%--
  Created by IntelliJ IDEA.
  User: dy
  Date: 4/30/24
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- Bootstrap CSS -->
<!-- Bootstarp JS -->
<link href="/css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<!--우편번호 찾기 자바스크립트 파일-->
<script src="/js/member/zipcode_popup.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    let id_check = {
        init: function () {
            $('#btn_check').click(() => {
                let id = $('#id').val();
                id_check.send(id);
            })
        },
        send: function (id) {
            $.ajax({
                url: '<c:url value="/member/checkid"/>',
                data: {'id': id},
                success: (result) => {
                    let msg = "아이디가 존재합니다!";
                    let color = "blue";

                    if (result == '1') {
                        msg = "아이디가 존재하지 않습니다.";
                        color = "red";
                    }
                    $('#check_id_msg').html(msg).css("color", color);
                }
            })
        }
    };
    $(function () {
        id_check.init();
    });


    let pwd_check = {
        init: function () {
            let passwordInput = document.getElementById('pwd');
            let check_msg = document.getElementById('check_msg');

            passwordInput.addEventListener('input', function () {
                let password = passwordInput.value;
                const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+=])[a-zA-Z][a-zA-Z0-9!@#$%^&*()-_+=]{7,15}$/;

                let msg = "비밀번호 사용 가능해요!";
                let color = "blue";

                if (!passwordRegex.test(password)) {
                    msg = "영문/숫자/특수문자조합으로 8~16자리, 첫글자는 영문자만 가능해요.";
                    color = "red";
                }
                $('#check_msg').html(msg).css("color", color);

            });
        }
    }
    $(function () {
        pwd_check.init();
    });

</script>
<div class="container">
    <form id="reg_form">
        <div class="form-group" action="">
            <label for="id">아이디</label>
            <%-- name: 서버 전송시 날라가는 데이터/ required: 입력값 유효성 검사--%>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" required>
            <span id="id_span"></span>
            <button id="btn_check" type="button" class="btn btn-primary">확인</button>
            <span style="color: red;" id="check_id_msg"></span>

        </div>

        <div class="form-group" action="">
            <label for="id">이메일</label>
            <input type="text" class="form-control" id="email" placeholder="Enter id" name="email">
            <span id="email_span"></span>
        </div>

        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
            <span style="color: red;" id="check_msg"></span>
        </div>

        <%--    우편번호--%>
        <div class="form-group">
            <label for="sample6_postcode">우편번호</label>
            <input type="text" class="form-control" id="sample6_postcode" placeholder="Enter zipcode" name="zipcode">
            <button id="find_zipcode" type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()">우편번호
                찾기
            </button>

        </div>
        <div class="form-group">
            <label for="sample6_address">주소</label>
            <input type="text" class="form-control" id="sample6_address" placeholder="Enter address" name="address">
        </div>

        <button id="btn_register" type="button" class="btn btn-primary">회원가입</button>

    </form>
</div>
