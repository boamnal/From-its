<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        overflow-y: auto;
        height: 200px;
        transition: .3s ease-in;
    }

    .selectBox2.active .optionList {
        max-height: fit-content;
        /*block-size: fit-content;*/
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

<script>
    let regist = false;

    function toggleModalContent() {
        if (regist) {
            $("#modalContent").text("확정되었습니다!");
            $("#confirmButton").text("확인");
            $("#cancelButton").hide();
        } else {
            $("#modalContent").text("약속을 확정하시겠습니까?");
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

            let nowGroup = null


            // 선택된 시간을 클릭하면 옵션 목록 토글
            $('#selectedTime').click(function() {
                $('.optionList').toggle();
            });

            // 옵션 항목 클릭 이벤트
            $('.optionItem').click(function() {
                // 클릭된 옵션의 텍스트를 가져와 선택된 시간에 설정
                $('#selectedTime').text($(this).text());
                // 옵션 목록 숨기기
                $('.optionList').hide();
            });
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
            $('#selectedTime').on('change', function() {
                // 값이 변경되면 text color 색상을 변경
                if ($(this).val() !== '') {
                    $(this).css('color', '#333333');
                } else {
                    $(this).css('color', '#CCCCCC');
                }
            });

            $('#confirmButton').click(() => {
                let date = $('#promiseDate').val();
                let time = $('#selectedTime').text();
                let proId = $("#proId").val()
                let devoteId = $("#devoteId").val()

                let dateTime = date+'T'+time

                $.ajax({
                    url: '/confirmPromise',
                    type: 'get',
                    data: {proDate: dateTime, proId: proId, devoteId: devoteId},
                    success: function (res) {
                        if (res === 1) {
                            toggleModalContent();
                            $('#exampleModal').modal('hide');
                            window.location.href ="/schedule"

                        }
                    }
                });


            })
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
    <input id="proId" class="d-none" value="${proId}" />
    <input id="devoteId" class="d-none" value="${devoteId}" />
    <div class="d-flex flex-column">
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속명</div>
            <div class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none">${promiseInfo.proName}</div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속장소</div>
            <div class="w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >${promiseInfo.placeAddress}</div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">그룹명</div>
            <div class="w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >${promiseInfo.groupName}</div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 날짜</div>
            <input id="promiseDate" type="date" class="w-100" style="color: #CCCCCC; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="MM/DD/YY" />
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 시간</div>
            <div class="selectBox2 w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >
                <div id="selectedTime" style="cursor: pointer;">시간 선택</div>
                <ul class="optionList" style="display: none;">
                    <li class="optionItem">12:00</li>
                    <li class="optionItem">13:00</li>
                    <li class="optionItem">14:00</li>
                    <li class="optionItem">15:00</li>
                    <li class="optionItem">16:00</li>
                    <li class="optionItem">17:00</li>
                    <li class="optionItem">18:00</li>
                    <li class="optionItem">19:00</li>
                    <li class="optionItem">20:00</li>
                    <li class="optionItem">21:00</li>
                    <li class="optionItem">22:00</li>
                    <li class="optionItem">23:00</li>
                    <li class="optionItem">24:00</li>
                    <li class="optionItem">11:00</li>
                    <li class="optionItem">10:00</li>
                    <li class="optionItem">9:00</li>
                    <li class="optionItem">8:00</li>
                    <li class="optionItem">7:00</li>
                    <li class="optionItem">6:00</li>
                    <li class="optionItem">5:00</li>
                    <li class="optionItem">4:00</li>
                    <li class="optionItem">3:00</li>
                    <li class="optionItem">2:00</li>
                    <li class="optionItem">1:00</li>

                </ul>
            </div>
        </div>
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 내용</div>
            <textarea readonly rows="5" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우리들의 행복한 시간 ^^~" >${promiseInfo.proDesc}</textarea>
        </div>
    </div>
    <button id="confirmPromise" data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;" >약속 일정 확정하기</button>
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

