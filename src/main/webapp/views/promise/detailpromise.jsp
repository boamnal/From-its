<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let detailpromise = {
        init: function () {
        }
    };
    $(function () {
        detailpromise.init();
    });
</script>
<head>
    <style>
        .scroll {
            overflow: auto;
            white-space: nowrap;
        }
        .scroll::-webkit-scrollbar {
            display: none;
        }
    </style>

</head>

<div class="min-vh-100">
    <div class="fw-bold" style="color: #333333; font-size: 24px; padding-bottom: 16px" >약속명 신촌 약속</div>
    <div class="d-flex scroll" style="">
        <div class="d-flex align-items-center " style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">
            <img src="<c:url value="/img/1.png"/>" style="width: 40px; height: 40px; margin-right: 10px"  />
            <div style="color: #333333;">삼식이</div>
        </div>
        <div class="d-flex align-items-center" style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">
            <img src="<c:url value="/img/1.png"/>" style="width: 40px; height: 40px; margin-right: 10px"  />
            <div style="color: #333333;">삼식이</div>
        </div>
        <div class="d-flex align-items-center" style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">
            <img src="<c:url value="/img/1.png"/>" style="width: 40px; height: 40px; margin-right: 10px"  />
            <div style="color: #333333;">삼식이</div>
        </div>
        <div class="d-flex align-items-center" style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">
            <img src="<c:url value="/img/1.png"/>" style="width: 40px; height: 40px; margin-right: 10px"  />
            <div style="color: #333333;">삼식이</div>
        </div>
    </div>
    <button data-bs-toggle="modal" data-bs-target="#exampleModal" id="creategroup" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-medium mt-auto"  style="padding: 12px 0; background-color: #FF9494; color: white; font-size: 18px" >2024년 5월 3일</button>
    <div style="color: #333333; background-color: #FFFCFC; border: 2px solid #FEF4F2; padding: 20px; text-align: center; margin-bottom: 16px; min-height: 180px">
        삼식이 생일을 축하하며 맛있는거 먹자!!
    </div>
    <div class="d-flex justify-content-end gap-3">
        <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-20 btn btn-primary mb-4 rounded-3 fw-medium mt-auto"  style="padding: 10px 25px; background-color: #FEF4F2; color: #FF9494; font-size: 18px" >수정</button>
        <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-20 btn btn-primary mb-4 rounded-3 fw-medium mt-auto"  style="padding: 10px 25px; background-color: #FEF4F2; color: #FF9494; font-size: 18px" >삭제</button>
    </div>

</div>
