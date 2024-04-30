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
<link href="css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
</script>
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
