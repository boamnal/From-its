<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let promiseschedule = {
        init: function () {
            $('#makeProm').on('click', function() {
                location.href = '<c:url value="/initial"/>'
            })
            $('#makeProm2').on('click', function() {
                location.href = '<c:url value="/initial"/>'
            })
        }
    };
    $(function () {
        promiseschedule.init();
    });
</script>
<style>
    .schedule:hover, .schedule:focus {
        background-color: #FF9494;
        cursor: pointer;
    }
</style>

<div>
    <div class="fw-bold" style="font-size: 22px" >${sessionScope.user.name}님 어서오세요</div>
    <button id = "makeProm2" class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder"  style="padding: 12px 0; margin: 16px 0; background-color: #FEF4F2; color: #FF9494; font-size: 16px" >약속 만들기</button>
    <c:choose>
        <c:when test="${empty promise}">
            <div class="fw-medium" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px; font-size: 16px; text-align: center">
                <div>약속이 아직 없어요!</div>
                <div id = "makeProm" class="btn btn-primary fw-bold" style="padding: 12px 20px; margin-top: 32px">약속 만들러가기</div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${promise}" var="p">
                <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
                    <div class="fw-medium" style="font-size: 16px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center; color:#333333">
                        <div>${p.proName}<span style="color: #FF9494">(${p.groupName})</span></div>
                        <div>${p.proDate}</div>
                        <div style="color: #999999; margin-top: 10px"><span style="color: #FF9494">${p.placeName} </span>${p.placeAddress}</div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
