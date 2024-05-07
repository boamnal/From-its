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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
                    let color = "red";

                    if (result == '1') {
                        msg = "아이디 사용 가능해요.";
                        color = "blue";
                    }
                    $('#check_id_msg').html(msg).css("color", color);
                }
            })
        }
    };
    $(function () {
        id_check.init();
    });

    // 비밀번호 유효성 검사
    let pwd_check = {
        init: function () {
            let passwordInput = document.getElementById('pwd');
            let check_msg = document.getElementById('check_msg');

            passwordInput.addEventListener('input', function () {
                let password = passwordInput.value;
                const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+=])[a-zA-Z0-9!@#$%^&*()-_+=]{8,16}$/;

                let msg = "비밀번호 사용 가능해요!";
                let color = "blue";

                if (!passwordRegex.test(password)) {
                    msg = "영문/숫자/특수문자 조합으로 8~12자리만 가능해요.";
                    color = "red";
                }
                $('#check_msg').html(msg).css("color", color);

            });
        }
    }
    $(function () {
        pwd_check.init();
    });
    // 회원가입 폼 전송
    let join = {
        init: function (url) {
            // jsp에서 만든 c태그를 url로 던져준다
            this.url = url;

            $('#join_ok_btn').click(function () { // 로그인 버튼
                console.log("확인 버튼  함수");

                const profiles = [0, 1, 2];
                let randomIndex = Math.floor(Math.random() * profiles.length);
                let selectedProfile = profiles[randomIndex];

                document.getElementById('profile').value = selectedProfile;
                console.log("selectedProfile");

                join.send();
            });
        },
        send: function () {
            // html에서의 attribute -> 태그의 여러 속성 의미
            // 여러개 보낼때는 object 형식으로
            $('#reg_form').attr({
                'method': 'post',
                'action': this.url
            });
            $('#reg_form').submit();
        }
    };


    $(function () {
        join.init('<c:url value="/member/addimpl"/>');
    });
</script>
<div style="margin: 0px 20px;">
    <div class="d-flex justify-content-center py-4" style="margin-top: 30px; margin-bottom: 20px;">
        <h1>회원가입</h1>
    </div>

    <form id="reg_form">
        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="name" class="flex-grow-1 mb-0 text-nowrap fw-medium">이름</label>
                <input type="text" class="form-control me-2" id="name" placeholder="ex) 홍길동"
                       name="name"
                       required style="margin:12px 40px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
        </div>
        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="id" class="flex-grow-1 mb-0 text-nowrap fw-medium">아이디</label>
                <input type="text" class="form-control me-2" id="id" placeholder="ex) 삼식이" name="userId" required
                       style="margin:12px 24px; padding: 12px; background-color: #F8F8FA; border-style: none">

                <button id="btn_check" type="button" class="btn btn-primary rounded-3 fw-bolder text-nowrap"
                        style="background-color: #FEF4F2; color: #FF9494; padding: 12px; ">확인
                </button>
            </div>
            <span id="check_id_msg" style="color:#b5b6b7; margin-left: 69px;">* 친구에게 보여질 닉네임이에요</span>
        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="email" class="flex-grow-1 mb-0 text-nowrap fw-medium">이메일</label>
                <input type="text" class="form-control me-2" id="email" placeholder="ex) fromits@naver.com" name="email"
                       required
                       style="margin:12px 24px; padding: 12px; background-color: #F8F8FA; border-style: none">
                <span id="email_span"></span>
            </div>
        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="pwd" class="flex-grow-1 mb-0 text-nowrap fw-medium">비밀번호</label>
                <input type="password" class="form-control me-2" id="pwd" placeholder="ex) fromits123!" name="password"
                       required style="margin:12px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
            <span id="check_msg" style="color: red; margin-left: 69px; margin-top: 20px"></span>

        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="sample6_postcode" class="flex-grow-1 mb-0 text-nowrap fw-medium">우편번호</label>
                <input type="text" class="form-control me-2" id="sample6_postcode" placeholder="ex) 04778"
                       name="zipcode" required
                       style="margin:12px 12px; padding: 12px; background-color: #F8F8FA; border-style: none">
                <button id="find_zipcode" type="button" class="btn btn-primary rounded-3 fw-bolder text-nowrap"
                        style="background-color: #FEF4F2; color: #FF9494; padding: 12px;"
                        onclick="sample6_execDaumPostcode()">우편번호
                    찾기
                </button>
            </div>
        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="sample6_address" class="flex-grow-1 mb-0 text-nowrap fw-medium">주소</label>
                <input type="text" class="form-control me-2" id="sample6_address" placeholder="ex) 서울 성동구 아차산로 18"
                       name="address"
                       required style="margin:12px 40px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
        </div>

        <div class="px-4" style="margin-top: 35px">
            <input type="hidden" id="profile" name="profile">

            <button class="w-100 btn btn-primary rounded-3 fw-bolder" id="join_ok_btn"
                    style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494">회원가입
            </button>

        </div>

    </form>

</div>


