
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- KAKAO Map API   --%>


<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- KAKAO Map API   --%>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            height: 100vh; /* 뷰포트 높이에 맞게 설정 */
            overflow-y: auto; /* 수직 스크롤바 자동 표시 */
        }

        .navbar {
            background-color: #333; /* 배경색은 원하는 색상으로 설정하세요 */
            padding: 20px 20px 35px 20px;
            width: 100%;
            position: sticky; /* sticky 위치 지정 */
            top: 0; /* 화면 상단에 고정 */
            z-index: 1000; /* 다른 요소 위에 표시되도록 z-index 설정 */
            max-width: 1500px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-white navbar-light">
    <div class="container-fluid w-100" >
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
<div class="container-fluid" style="padding: 0;" >
    <div class="row" style="margin: 0 40px; padding: 0">
        <div class="col" style="padding: 0">
            <c:choose>
                <c:when test="${center == null}">
                    <jsp:include page="center.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${center}.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<%--<footer>--%>
<%--    --%>
<%--</footer>--%>
</body>