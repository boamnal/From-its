<%--
  Created by IntelliJ IDEA.
  User: 하나로H017
  Date: 2024-04-29
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
</script>
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
    .navbar {
        background-color: #333; /* 배경색은 원하는 색상으로 설정하세요 */
        padding: 10px 20px; /* 위아래 10px, 좌우 20px의 패딩 */
        width: 100%; /* 너비 100% */
        position: sticky; /* sticky 위치 지정 */
        top: 0; /* 화면 상단에 고정 */
        z-index: 1000; /* 다른 요소 위에 표시되도록 z-index 설정 */
    }

    /* 화면이 360px 이상일 때 */
    @media screen and (min-width: 360px) {
        .container {
            max-width: 360px;
        }
    }

    /* 화면이 600px 이상일 때 */
    @media screen and (min-width: 600px) {
        .container {
            max-width: 600px;
        }
    }

    /* 화면이 900px 이상일 때 */
    @media screen and (min-width: 900px) {
        .container {
            max-width: 900px;
        }
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-white navbar-light container">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img style="width: 50px" src="img/Logo.PNG"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">친구맺기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">내 지도</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">내 그룹</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">약속 후보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">약속 일정</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">로그아웃</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <c:if test="${center == null}">
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
<%--<footer>--%>
<%--    --%>
<%--</footer>--%>
</body>
</html>
