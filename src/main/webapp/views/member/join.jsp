<%--
  Created by IntelliJ IDEA.
  User: dy
  Date: 4/30/24
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let join = {
        init: function () {
        }
    };
    $(function () {
        join.init();
    });

</script>
<form id="reg_form">
    <div class="form-group" action="">
        <label for="id">ID:</label>
        <%-- name: 서버 전송시 날라가는 데이터--%>
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
        <span id="id_span"></span>
        <button id="btn_check" type="button" class="btn btn-primary">아이디 중복 체크</button>
        <span id="check_msg"></span>

    </div>
    <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    </div>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <button id="btn_register" type="button" class="btn btn-primary">회원가입!</button>

</form>