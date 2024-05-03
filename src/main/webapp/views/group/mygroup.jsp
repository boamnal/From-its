<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/03
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let mygroup = {
        init: function () {
        }
    };
    $(function () {
        mygroup.init();
    });
</script>

<div>
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">내 그룹 목록</div>
    <div class="d-grid flex-column gap-3">
        <button class="w-100 btn btn-primary rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;">우행시</button>
        <button class="w-100 btn btn-primary rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;">고딩동창</button>
    </div>

</div>
