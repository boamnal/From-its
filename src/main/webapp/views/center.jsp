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

<div class="container">
    <img src="<c:url value="/img/Logo2.svg"/>" width="320px" height="94px">
    <div>
        <button id="btn_go_login" type="button" class="btn btn-primary"><span><a href="<c:url value="/member/login"/>">로그인</a></span>
        </button>
        <button id="btn_go_join" type="button" class="btn btn-primary">
            <span><a href="<c:url value="/member/join"/>">회원가입</a></span>
        </button>
    </div>

</div>


