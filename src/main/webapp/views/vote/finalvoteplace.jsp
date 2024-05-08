<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/08
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let finalvoteplace = {
        init: function () {
        }
    };
    $(function () {
        finalvoteplace.init();
    });
</script>
<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">최종 결정된 약속 장소</div>
    <div class="d-flex flex-column">
        <div id="candidate" class="candidate" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px" >
            <div class="fw-medium" style="font-size: 16px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center; color: #333333">
                <div class="fw-bold">${finalPlace.placeName}</div>
                <div>${finalPlace.placeAddress}</div>
            </div>
        </div>
    </div>
    <button class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder"  style="padding: 12px 0; font-size: 16px" onclick="window.location.href='/finalpromise?devoteId='+${finalPlace.devoteId}" >약속 시간 정하기</button>
</div>
