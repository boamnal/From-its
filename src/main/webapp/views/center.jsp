<%--기본 페이지--%>
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
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh; /* 뷰포트 높이에 맞게 설정 */
            background-color: #FFE3E1; /* 배경 색상 설정 */
            overflow: hidden; /* 스크롤을 숨김 */
        }

        .container {
            background-color: #FFE3E1;
            width: 100%;
            max-width: none;
            margin: 0 auto;
            padding: 20px; /* 기본 패딩 20px */
            box-sizing: border-box;
            height: 100vh; /* 뷰포트 높이에 맞게 설정 */
            overflow: hidden; /* 스크롤을 숨김 */
        }


        /* 이미지 애니메이션 관련 스타일 */
        .bubble-image {
            position: relative;
            opacity: 0; /* 처음에 투명도를 0으로 설정하여 나타나도록 함 */
            margin: 10px; /* 이미지 간격 설정 */
        }

        /* 애니메이션 키프레임 정의 */
        @keyframes bubbleAnimation {
            from {
                opacity: 0; /* 시작 시 투명도를 0으로 설정 */
                transform: translateY(60px); /* 시작 시 이미지를 아래로 이동 */
            }
            to {
                opacity: 1; /* 끝날 때 투명도를 1로 설정 */
                transform: translateY(0); /* 끝날 때 이미지가 제자리로 이동 */
            }
        }

        /* 이미지 애니메이션 적용 */
        .animate-bubble {
            animation: bubbleAnimation 2s ease-out infinite alternate none running;
        }

    </style>
</head>
<script>
    function redirectToLoginPage() {
        window.location.href = "<c:url value='/member/login' />";
    }

    function redirectToJoinPage() {
        window.location.href = "<c:url value='/member/join' />";
    }

    // 이미지가 나타나는 애니메이션 함수
    function animateImages() {
        let images = document.querySelectorAll('.bubble-image');

        images.forEach((image, index) => {
            setTimeout(() => {
                image.classList.add('animate-bubble');
            }, index * 500); // 이미지마다 0.5초씩 딜레이를 줍니다.
        });
    }


    $(function () {
        // 페이지 로드 시 애니메이션을 시작합니다.
        animateImages();
    })
</script>


<body>
<div class="container d-flex flex-column">
    <div class="align-self-center">
        <!-- 이미지를 나타낼 때 사용할 클래스 bubble-image 추가 -->
        <img src="<c:url value="/img/d.png"/>" class="bubble-image" style="width: 70px; margin: 10px;"/>
        <img src="<c:url value="/img/e.png"/>" class="bubble-image" style="width: 80px; margin: 10px;"/>
        <!-- 필요한 만큼 이미지를 추가할 수 있습니다. -->
    </div>

    <div class="align-self-center d-flex flex-column">
        <img src="<c:url value="/img/mb.png"/>"
             style="width: 240px; margin: 10px;"/>
        <img src="<c:url value="/img/say.png"/>" style="margin-top: 10px; margin-bottom: 45px"/>

    </div>

    <div class="d-flex flex-column">
        <button onclick="redirectToLoginPage()" class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder"
                style="padding: 12px 0; background-color: #FF9494; color: white" id="newgroup">${text1}</button>
        <button onclick="redirectToJoinPage()" class="w-100 btn btn-primary rounded-3 fw-bolder"
                style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494" id="existgroup">${text2}</button>
    </div>

</div>


</body>
