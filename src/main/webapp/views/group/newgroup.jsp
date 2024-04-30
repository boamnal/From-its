<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/04/30
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    input::placeholder {
        color: #CCCCCC;
    }
</style>
<script>
    let newgroup = {
        init: function () {
            console.log("뭐임?")
        }
    };
    $(function () {
        newgroup.init();
    });
</script>

<div class="container">
    <div class="fw-bold" style="font-size: 20px; margin-bottom: 30px">새 그룹 등록</div>
    <div style="margin-bottom: 40px">
        <div>그룹 이름</div>
        <input type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우행시 모임" />
    </div>
    <div style="margin-bottom: 40px">
        <div>그룹 친구 등록</div>
        <div style="position: relative;">
            <input type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none; position: relative" placeholder="친구 아이디를 검색하세요." >
            <button  style="position: absolute; right: 14px; bottom: 15px; border: none; background: none">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                </svg>
            </button>
        </div>
        <button class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder" style="padding: 12px 0; background-color: #FF9494; color: white; margin-top: 40px" id="newgroup">생성하기</button>
    </div>
</div>
