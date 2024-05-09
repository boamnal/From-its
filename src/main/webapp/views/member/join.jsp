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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">

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
                    let color = "#E05938";

                    if (result == '1') {
                        msg = "아이디 사용 가능해요.";
                        color = "#0819B8";
                    }
                    $('#check_id_msg').html(msg).css({
                        "color": color,
                    });
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
                // 수정된 비밀번호 정규식
                const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$/;

                let msg = "비밀번호 사용 가능해요!";
                let color = "#0819B8";

                if (password.length > 12 || !passwordRegex.test(password)) {
                    msg = "영문/숫자로 8~12자리여야 해요.";
                    color = "#E05938";
                }
                $('#check_msg').html(msg).css({
                    "color": color,
                });
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

            $('#join_ok_btn').click(function (event) { // 회원가입 버튼
                console.log("회원가입 버튼 클릭");

                // 모든 필드 유효성 검사
                event.preventDefault(); // 기본 폼 제출 동작 방지

                // 모든 입력 필드 가져오기
                let inputs = $('#reg_form input');

                // 모든 필드가 채워져 있는지 여부를 추적하는 플래그
                let allFieldsFilled = true;

                // 각 입력 필드를 반복
                inputs.each(function () {
                    // 입력 필드가 필수이고 비어 있는지 확인
                    if ($(this).prop('required') && $(this).val().trim() === '') {
                        // 필수 필드 중 하나라도 비어 있으면 플래그를 false로 설정
                        allFieldsFilled = false;

                    } else {
                        // 이전에 발생한 유효하지 않은 상태 제거 (선택 사항)
                        $(this).removeClass('is-invalid');
                    }
                });

                // 회원가입 시 랜덤 캐릭터 프사 배정
                const profiles = [1, 2, 3];

                let randomIndex = Math.floor(Math.random() * profiles.length);
                let selectedProfile = profiles[randomIndex];

                document.getElementById('profile').value = selectedProfile;
                console.log("랜덤 캐릭터 프사 배정 완!");

                // 모든 필수 필드가 채워져 있으면 API 호출 진행
                if (allFieldsFilled) {
                    join.send();
                } else {
                    // 모든 필드가 필수임을 나타내는 메시지 표시 (선택 사항)
                    alert('모든 정보를 입력해주세요');
                }
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
        // 각 입력 필드에서 Enter 키 눌렀을 때 폼 전송 방지
        $('#reg_form input').keypress(function (e) {
            if (e.which === 13) {
                e.preventDefault(); // Enter 키의 기본 동작을 막습니다.
                return false;
            }
        });
        join.init('<c:url value="/member/addimpl"/>');
    });
</script>
<style>
    .form-control::placeholder {
        color: #CCCCCC;
    }
    html, body {
        width: 100%;
        height: 100%;
    }

    body {
        overflow-y: scroll;
    }


</style>
<body>
<div style="margin: 0px 20px;    ">
    <div class="d-flex justify-content-center py-4" style="margin-top: 30px; margin-bottom: 20px;">
        <h1>회원가입</h1>
    </div>

    <form id="reg_form">
        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="name" class="flex-grow-1 mb-0 text-nowrap fw-medium">이름</label>
                <input type="text" class="form-control me-2" id="name" placeholder="ex) 김약속"
                       name="name"
                       required style="margin:12px 40px; padding: 12px; background-color: #F8F8FA; border-style: none">
            </div>
            <span id="" style="color:#b5b6b7; margin-left: 69px;">* 친구에게 보여질 닉네임이에요</span>

        </div>

        <div class="join_form px-4" style="margin: 20px 0px">
            <div class="form-group d-flex align-items-center">
                <label for="id" class="flex-grow-1 mb-0 text-nowrap fw-medium">아이디</label>
                <input type="text" class="form-control me-2" id="id" placeholder="ex) fromits12" name="userId" required
                       style="margin:12px 24px; padding: 12px; background-color: #F8F8FA; border-style: none">

                <button id="btn_check" type="button" class="btn btn-primary rounded-3 fw-bolder text-nowrap"
                        style="padding: 12px; ">확인
                </button>
            </div>
            <span id="check_id_msg" style="color:#b5b6b7; margin-left: 69px;"></span>

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
                        style="padding: 12px;"
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
                    style="padding: 12px 0;">회원가입
            </button>

        </div>

    </form>

</div>
</body>



