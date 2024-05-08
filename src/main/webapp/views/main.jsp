
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        @media (max-width: 575px) {
            #myPageButton, #logOutButton {
                display: none;
            }
            #mypageLink, #logOutButton {
                pointer-events: none;
            }
            .navbar-nav {
                padding: 10px;
            }
        }

    </style>
</head>
<script>
    $(document).ready(function() {
        // 사용자 이름을 클릭할 때마다 마이페이지 버블을 토글합니다.
        $("#mypageLink").click(function(event) {
            event.stopPropagation(); // 부모 요소에 이벤트 전파를 방지합니다.

            $("#myPageButton").addClass("d-block");
            $("#myPageButton").removeClass("d-none");
        });

        // 문서를 클릭할 때마다 마이페이지 버블을 숨깁니다.
        $(document).click(() => {
            $("#myPageButton").removeClass("d-block");
            $("#myPageButton").addClass("d-none");
        });

        // 마이페이지 버블을 클릭해도 문서 전체에 대한 클릭 이벤트가 발생하지 않도록 방지합니다.
        $("#myPageButton").click(function(event) {
            event.stopPropagation();
        });
    });

</script>

<body>
<nav class="navbar navbar-expand-sm bg-white navbar-light">
    <div class="container-fluid w-100" >
        <a class="navbar-brand" href="<c:url value="/"/> "><img style="width: 50px" src="<c:url value="/img/Logo.PNG"/>"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/search"/> ">친구맺기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/map/groupmp"/>">내 지도</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/mygroup"/>">내 그룹</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/schedule"/>">약속 일정</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/initial"/>">약속 생성</a>
                </li>
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.user_id == null}">
                        </c:when>
                        <c:otherwise>
                            <div id="userInfo" style="position: relative;">
                                <button style="border: none; background: none" id="mypageLink" class="nav-link">
                                    <span class="fw-medium" style="color: #FF9494">${sessionScope.user.name}</span> 님
                                </button>
                                <ul id="myPageButton" class="text-center d-none position-absolute" style="background-color: #FEF4F2; padding: 10px; border-radius: 12px; z-index: 99; top: 100%; left: 0; list-style: none;">
                                    <li class="text-nowrap"><a class="text-decoration-none fw-medium" href="<c:url value='/mypage' />" style="color: #FF9494">마이페이지</a></li>
                                </ul>
                                <ul id="logOutButton" class="text-center d-none position-absolute" style="background-color: #FEF4F2; padding: 10px; border-radius: 12px; z-index: 99; top: 100%; left: 0; list-style: none;">
                                    <li class="text-nowrap"><a class="text-decoration-none fw-medium" href="<c:url value='/mypage' />" style="color: #FF9494">로그아웃</a></li>
                                </ul>
                            </div>
                            <a class="nav-link d-md-none d-sm-none" href="<c:url value="/mypage"/>">마이페이지</a>
                            <a class="nav-link d-md-none d-sm-none" href="<c:url value="/logoutimple"/>">로그아웃</a>

                        </c:otherwise>
                    </c:choose>
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