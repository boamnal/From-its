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
    <div class="fw-bold" style="font-size: 24px" >000님 어서오세요</div>
    <button class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder"  style="padding: 12px 0; margin: 16px 0; background-color: #FEF4F2; color: #FF9494; font-size: 18px" >생성하기</button>
    <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
        <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
            <div>판다딤섬</div>
            <div>2024.04.29</div>
            <div style="color: #999999;">서울 마포구 동교로 38안길 22</div>
        </div>
    </div>
    <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
        <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
            <div>판다딤섬</div>
            <div>2024.04.29</div>
            <div style="color: #999999;">서울 마포구 동교로 38안길 22</div>
        </div>
    </div>
    <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
        <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
            <div>판다딤섬</div>
            <div>2024.04.29</div>
            <div style="color: #999999;">서울 마포구 동교로 38안길 22</div>
        </div>
    </div>
</div>
