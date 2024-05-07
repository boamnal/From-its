<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let regist = false;

    function toggleModalContent() {
        if (regist) {
            $("#modalContent").text("생성되었습니다!");
            $("#confirmButton").text("확인");
            $("#cancelButton").hide();
        } else {
            $("#modalContent").text("약속을 생성하시겠습니까?");
            $("#confirmButton").text("확인");
            $("#cancelButton").show();
        }
    }

    // 모달이 닫히는 이벤트를 감지하고, 닫힌 후에 처리합니다.
    $('#exampleModal').on('hidden.bs.modal', function () {
        toggleModalContent();
    });

    $(function () {
        toggleModalContent();

        $("#confirmButton").click(() => {
            if (regist) {
                $('#exampleModal').modal('hide');
                regist = false;
            } else {
                regist = true;
                toggleModalContent();
                // 모달을 닫지 않고 사용자가 '등록되었습니다!' 메시지를 확인한 후 다시 확인을 누를 때 닫는다
            }
        });

        $("#cancelButton").click(() => {
            $('#exampleModal').modal('hide');
        });

        $("#resultModal").on('hidden.bs.modal', function () {
            $('#exampleModal').modal('show'); // 결과 모달이 닫히면 등록 모달을 다시 표시
        });
    });
    let createPromise = {
        init: function () {
            // date input 요소의 onchange 이벤트 처리

            $('input[type="date"]').on('change', function() {
                // 값이 변경되면 placeholder 색상을 변경
                if ($(this).val() !== '') {
                    $(this).css('color', '#333333');
                } else {
                    $(this).css('color', '#CCCCCC');
                }
            });

            // time input 요소의 onchange 이벤트 처리
            $('input[type="time"]').on('change', function() {
                // 값이 변경되면 placeholder 색상을 변경
                if ($(this).val() !== '') {
                    $(this).css('color', '#333333');
                } else {
                    $(this).css('color', '#CCCCCC');
                }
            });
        }
    };
    $(function () {
        createPromise.init();
    });
</script>
<style>
    input::placeholder {
        color: #CCCCCC;
    }
</style>


<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">약속 만들기</div>
    <div class="d-flex flex-column">
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속명</div>
            <input type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우행시 모임" />
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속장소(자동 로딩!)</div>
            <div class="w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >서울시 동교로 33안길 35</div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">그룹(자동 로딩?)</div>
            <div class="w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >우행시 모임</div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 날짜</div>
            <input type="date" class="w-100" style="color: #CCCCCC; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="MM/DD/YY" />
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 시간</div>
            <input type="time" class="w-100" style="color: #CCCCCC; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="우행시 모임" />
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 내용</div>
            <textarea rows="5" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우리들의 행복한 시간 ^^~" ></textarea>
        </div>
    </div>
    <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;" >생성하기</button>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin: 20px auto;">
        <div class="modal-dialog" style="max-width: 300px; margin: 20px auto">
            <div class="modal-content" style="max-width: 400px;">
                <div class="modal-header" style="border: none">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="modalContent" class="modal-body" style="text-align: center; padding: 30px 0; font-size: 16px; color: #333333;">
                    등록하시겠습니까?
                </div>
                <div class="d-flex gap-2 w-100" style="border: none; justify-content: center; padding: 20px">
                    <button id="confirmButton" type="button" class="w-100 btn btn-primary fw-bolder" style="background-color: #FF9494; color: white; padding: 8.5px 0">확인</button>
                    <button id="cancelButton" type="button" class="w-100 btn fw-bolder" data-bs-dismiss="modal" style="background-color: #FEF4F2; color: #FF9494; display: none">취소</button>
                </div>
            </div>
        </div>
    </div>

</div>

