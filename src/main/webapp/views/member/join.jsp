<%--
  Created by IntelliJ IDEA.
  User: dy
  Date: 4/30/24
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let join = {
        init: function () {
        }
    };
    let pwd_check = {
        init: function () {
            let passwordInput = document.getElementById('password');
            let passwordError = document.getElementById('passwordError');

            passwordInput.addEventListener('input', function () {
                let password = passwordInput.value;
                const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+=])[a-zA-Z][a-zA-Z0-9!@#$%^&*()-_+=]{7,15}$/;

                if (!passwordRegex.test(password)) {
                    passwordError.textContent = "영문/숫자/특수문자조합으로 8~16자리, 첫글자는 영문자만 가능해요.";
                } else {
                    passwordError.textContent = '';
                }
            });
        }
    }
    $(function () {
        join.init();
    });

</script>
<form id="reg_form">
    <div class="form-group" action="">
        <label for="id">아이디</label>
        <%-- name: 서버 전송시 날라가는 데이터/ required: 입력값 유효성 검사--%>
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" required>
        <span id="id_span"></span>
        <button id="btn_check" type="button" class="btn btn-primary">확인</button>
        <span id="check_msg"></span>
    </div>

    <div class="form-group" action="">
        <label for="id">이메일</label>
        <input type="text" class="form-control" id="email" placeholder="Enter id" name="email">
        <span id="email_span"></span>
    </div>

    <%--    <form id="passwordForm" onsubmit="validatePassword()">--%>
    <%--        <label for="password">Password:</label>--%>
    <%--        <input type="password" id="password" name="password" required>--%>
    <%--        <button type="submit">Submit</button>--%>
    <%--        <p id="passwordError" style="color: red;"></p>--%>
    <%--    </form>--%>

    <div class="form-group" action="pwd_check">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
        <p id="passwordError" style="color: red;"></p>
    </div>

    <%--    우편번호--%>
    <div class="form-group">
        <label for="zipcode">우편번호</label>
        <input type="text" class="form-control" id="zipcode" placeholder="Enter zipcode" name="zipcode">
        <button id="find_zipcode" type="button" class="btn btn-primary" onclick="findZipCode()">우편번호 찾기</button>
        <label for="address">주소</label>
        <input type="text" class="form-control" id="address" placeholder="Enter address" name="address">
    </div>


    <button id="btn_register" type="button" class="btn btn-primary">회원가입</button>

</form>