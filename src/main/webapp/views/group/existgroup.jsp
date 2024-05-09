<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/04/30
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(document).ready(function() {
        const $label = $('.label');
        const $options = $('.optionItem');
        const handleSelect = function(item) {
            $label.text($(item).text());
            $label.parent().removeClass('active');
        };
        $options.each(function() {
            $(this).on('click', function() {
                handleSelect(this);
            });
        });
        $label.on('click', function() {
            const $parent = $label.parent();
            if ($parent.hasClass('active')) {
                $parent.removeClass('active');
            } else {
                $parent.addClass('active');
            }
        });
    });
</script>
<style>
    .selectBox2 {
        position: relative;
        width: 100%;
        padding: 13px 12px;
        border-radius: 8px;
        background-color: #F8F8FA;
        margin-top: 8px;
        cursor: pointer;
    }
    .selectBox2:after {
        content: '';
        display: block;
        width: 2px;
        height: 100%;
        position: absolute;
        top: 0;
        right: 35px;
        /*background: #FF9494;*/
    }
    .selectBox2 .label {
        display: flex;
        align-items: center;
        width: inherit;
        height: inherit;
        border: 0 none;
        outline: 0 none;
        background: transparent;
        cursor: pointer;
        font-size: 16px;
    }
    .selectBox2 .optionList {
        position: absolute;
        top: 60px;
        left: 0;
        width: 100%;
        background: white;
        color: #333333;
        list-style-type: none;
        padding: 0;
        border-radius: 8px;
        overflow: hidden;
        max-height: 0;
        transition: .3s ease-in;
    }
    .selectBox2.active .optionList {
        max-height: fit-content;
    }
    .selectBox2 .optionItem {
        border: 1px solid #EEEEEE;
        border-radius: 8px;
        padding: 13px 12px;
        transition: .1s;
        margin-bottom: 5px;
        font-size: 16px;
    }
    .selectBox2 .optionItem:hover {
        background: #FEF4F2;
        color: #FF9494;
    }

    .selectBox2 .optionList::-webkit-scrollbar {width: 6px;}
    .selectBox2 .optionList::-webkit-scrollbar-track {background: transparent; }
    .selectBox2 .optionList::-webkit-scrollbar-thumb {background: #303030; border-radius: 45px;}
    .selectBox2 .optionList::-webkit-scrollbar-thumb:hover {background: #303030;}
</style>
<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">기존 그룹 선택</div>
    <div class="d-flex flex-column">
        <div class="fw-medium" style="font-size: 16px">그룹 이름</div>
        <div class="selectBox2 w-100">
            <button class="label">${group[0].groupName}</button>
            <ul class="optionList">
                <c:forEach var="g" items="${group}">
                    <li class="optionItem" id="${g.groupId}">${g.groupName}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <button data-bs-toggle="modal" data-bs-target="#exampleModal" id="creategroup" class="w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0; background-color: #FF9494; color: white;" >확인</button>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin: 20px auto;">
        <div class="modal-dialog" style="max-width: 300px; margin: 20px auto">
            <div class="modal-content" style="max-width: 400px;">
                <div class="modal-header" style="border: none">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="modalContent" class="modal-body" style="text-align: center; padding: 30px 0; font-size: 16px; color: #333333;">
                    약속을 생성합니다.
                </div>
                <div class="d-flex gap-2 w-100" style="border: none; justify-content: center; padding: 20px">
                    <button id="confirmButton" type="button" class="w-100 btn btn-primary fw-bolder" style="background-color: #FF9494; color: white; padding: 8.5px 0">확인</button>
                </div>
            </div>
        </div>
    </div>

</div>
