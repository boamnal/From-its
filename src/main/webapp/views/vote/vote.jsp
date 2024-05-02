<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let vote = {
        init: function () {
        }
    };
    $(function () {
        vote.init();
    });
</script>
<style>
    .candidate:hover {
        background-color: #FF9494;
    }
</style>

<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 24px; margin-bottom: 30px">약속 장소 투표</div>
    <div class="d-flex flex-column">
        <div class="candidate" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
            <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
                <div>판다딤섬</div>
                <div>서울 마포구 동교로 38안길 22</div>
            </div>
        </div>
        <div class="candidate" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
            <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
                <div>판다딤섬</div>
                <div>서울 마포구 동교로 38안길 22</div>
            </div>
        </div>
        <div class="candidate" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
            <div class="fw-medium" style="font-size: 18px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
                <div>판다딤섬</div>
                <div>서울 마포구 동교로 38안길 22</div>
            </div>
        </div>
    </div>
    <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0; font-size: 18px" >투표하기</button>

</div>
