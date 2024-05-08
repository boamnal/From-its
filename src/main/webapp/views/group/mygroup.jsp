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
            console.log(mygroup)
        }
    };
    $(function () {
        mygroup.init();
    });
</script>

<div>
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">내 그룹 목록</div>
    <div class="d-grid flex-column gap-3">
        <c:choose>
            <c:when test="${empty mygroup}">
                <div style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; display: flex; flex-direction: column; justify-content: center; align-items: center;">
                    <div className="text-center" style="font-size: 16px; color: #333333">약속 그룹이 존재하지 않아요!</div>
                    <button className="fw-bold align-items-center"
                            style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none"
                            onClick="window.location.href='/initial'">약속 만들러가기
                    </button>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="g" items="${mygroup}">
                    <button class="w-100 btn btn-primary rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;">${g.groupName}</button>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
