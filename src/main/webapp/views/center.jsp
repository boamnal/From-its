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
    function redirectToLoginPage() {
        window.location.href = "<c:url value='/member/login' />";
    }

    function redirectToJoinPage() {
        window.location.href = "<c:url value='/member/join' />";
    }
</script>


<div class="container d-flex flex-column">
    <div class="align-self-center">
        <img src="<c:url value="/img/Logo2.svg"/>"
             style="width: 200px; height: 40px; margin-top: 50px; margin-bottom: 45px"/>
    </div>
    <div class="d-flex flex-column">
        <button onclick="redirectToLoginPage()" class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder"
                style="padding: 12px 0; background-color: #FF9494; color: white" id="newgroup">${text1}</button>
        <button onclick="redirectToJoinPage()" class="w-100 btn btn-primary rounded-3 fw-bolder"
                style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494" id="existgroup">${text2}</button>
    </div>

</div>


