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
<script>
    function redirectToLoginPage() {
        window.location.href = "<c:url value='/member/login' />";
    }

    function redirectToJoinPage() {
        window.location.href = "<c:url value='/member/join' />";
    }
</script>


<div>
    <div class="d-flex justify-content-center" style="margin-top: 30px; margin-bottom: 60px">
        <img src="<c:url value="/img/Logo2.svg"/>" width="196px" height="40px">
    </div>
    <div>
        <button onclick="redirectToLoginPage()" type="button" class="w-100 btn btn-primary rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FF9494; color: white; margin-bottom: 20px">
            로그인
        </button>
        <button onclick="redirectToJoinPage()" type="button" class="w-100 btn btn-primary rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FEF4F2; color: #FF9494">
            회원가입
        </button>
    </div>

</div>


