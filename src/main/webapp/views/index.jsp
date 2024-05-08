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
<div class="container d-flex flex-column">
        <div class="align-self-center">
            <img src="<c:url value="/img/Logo2.svg"/>" style="width: 200px; height: 40px; margin-top: 50px; margin-bottom: 45px" />
        </div>

        <div class="d-flex flex-column">
            <button class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FF9494; color: white" id="newgroup">${text1}</button>
            <button class="w-100 btn btn-primary rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494" id="existgroup">${text2}</button>
        </div>
</div>