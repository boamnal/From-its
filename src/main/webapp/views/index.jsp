<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/04/30
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh; /* 뷰포트 높이에 맞게 설정 */
            overflow-y: auto; /* 수직 스크롤바 자동 표시 */
        }

        .container {
            background-color: white;
            width: 100%;
            max-width: none;
            margin: 0 auto;
            padding: 20px; /* 기본 패딩 20px */
            box-sizing: border-box;
        }
    </style>
</head>
<script>
    let groupSelect = {
        init: function () {
            $("#newgroup").click(() => {
                window.location.href="/newgroup"
            })
            $("#existgroup").click(() => {
                window.location.href="/existgroup"
            })
        }
    }
    $(function () {
        groupSelect.init()
    })
</script>
<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 14px">친구들과 약속을 잡아보세요!</div>
    <div class="fw-medium" style="font-size: 16px; margin-bottom: 30px;  color: #1a1d20;">먼저 약속의 참가자들을 그룹으로 만들게요.</div>
<div class="container d-flex flex-column">
    <div>
        <div class="fw-medium" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px; font-size: 16px; text-align: center">
            <div>그룹을 처음 만드시나요?</div>

            <button class="w-100 btn btn-primary rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FF9494; color: white;  margin-top: 32px" id="newgroup">${text1}</button>
        </div>
    </div>
    <div>
        <div class="fw-medium" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px; font-size: 16px; text-align: center">
            <div>이미 만들어진 그룹이 있다면</div>

            <button class="w-100 btn btn-primary rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494; margin-top: 32px" id="existgroup">${text2}</button>

        </div>
    </div>


</div>