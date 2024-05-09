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
    let regist = false;
    let action = '';

    function toggleModalContent(action) {
        if (action === 'edit') {
            $("#modalContent").text("수정하시겠습니까?");
            $("#confirmButton").text("수정");
        } else if (action === 'delete') {
            $("#modalContent").text("삭제하시겠습니까?");
            $("#confirmButton").text("삭제");
        }
        $("#cancelButton").show();
    }

    // 모달이 닫히는 이벤트를 감지하고, 닫힌 후에 처리합니다.
    $('#exampleModal').on('hidden.bs.modal', function () {
        toggleModalContent('');
    });

    $(function () {
        $("#detailModify").click(() => {
            action = 'edit';
            toggleModalContent(action);
        });

        $("#detailDelete").click(() => {
            action = 'delete';
            toggleModalContent(action);
        });

        $("#confirmButton").click(() => {
            if (regist) {
                $('#exampleModal').modal('hide');
                regist = false;
                $("#resultModal").modal('show');
            } else {
                regist = true;
                toggleModalContent(action);
            }
        });

        $("#cancelButton").click(() => {
            $('#exampleModal').modal('hide');
        });

        // 수정하기 버튼 클릭 시 수정 완료 메시지 표시
        $("#confirmButton").click(() => {
            if ($("#confirmButton").text() === "수정") {
                $("#modalContent").text("수정되었습니다!");
                $("#confirmButton").hide();
                $("#cancelButton").text("확인");
            }
            if ($("#confirmButton").text() === "삭제") {
                $("#modalContent").text("삭제되었습니다!");
                $("#confirmButton").hide();
                $("#cancelButton").text("확인");
            }
        });
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
    <div class="fw-bold" style="color: #333333; font-size: 22px; padding-bottom: 16px">🔊확정된 약속을 확인해주세요!
    </div>

    <div class="fw-bold" style="color: #333333; font-size: 20px; padding-bottom: 16px">약속명: ${promise.proName}
    </div>

    <div class="d-flex scroll" style="">
        <c:forEach items="${member}" var="m">

            <div class="d-flex align-items-center "
                 style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">

                <img src="<c:url value="/img/${m.profile}.png"/>"
                     style="width: 40px; height: 40px; margin-right: 10px"/>
                <div style="color: #333333;">${m.name}</div>

            </div>
        </c:forEach>
    </div>

    <button class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-medium mt-auto"
            style="padding: 12px 0; background-color: #FF9494; color: white; font-size: 16px">${promise.proDate}
    </button>

    <input class="w-100" type="text"
           style="color: #333333; background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; padding: 20px; text-align: center; margin-bottom: 16px; min-height: 180px"
           value="${promise.proDesc}">

    <div class="d-flex justify-content-end gap-3">
        <button id="detailModify" data-bs-toggle="modal" data-bs-target="#exampleModal"
                class="mt-auto w-20 btn btn-primary mb-4 rounded-3 fw-bold mt-auto"
                style="padding: 10px 25px; background-color: #FEF4F2; color: #FF9494; font-size: 16px">수정
        </button>
        <button id="detailDelete" data-bs-toggle="modal" data-bs-target="#exampleModal"
                class="mt-auto w-20 btn btn-primary mb-4 rounded-3 fw-bold mt-auto"
                style="padding: 10px 25px; background-color: #FEF4F2; color: #FF9494; font-size: 16px">삭제
        </button>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         style="margin: 20px auto;">
        <div class="modal-dialog" style="max-width: 300px; margin: 20px auto">
            <div class="modal-content" style="max-width: 400px;">
                <div class="modal-header" style="border: none">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="modalContent" class="modal-body"
                     style="text-align: center; padding: 30px 0; font-size: 16px; color: #333333;">
                    등록하시겠습니까?
                </div>
                <div class="d-flex gap-2 w-100" style="border: none; justify-content: center; padding: 20px">
                    <button id="confirmButton" type="button" class="w-100 btn btn-primary fw-bolder"
                            style="background-color: #FF9494; color: white; padding: 8.5px 0">확인
                    </button>
                    <button id="cancelButton" type="button" class="w-100 btn fw-bolder" data-bs-dismiss="modal"
                            style="background-color: #FEF4F2; color: #FF9494; display: none">취소
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 결과 모달 -->
<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="margin: 20px auto;">
    <div class="modal-dialog" style="max-width: 300px; margin: 20px auto">
        <div class="modal-content" style="max-width: 400px;">
            <div class="modal-header" style="border: none">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="text-align: center; padding: 30px 0; font-size: 16px; color: #333333;">
                등록되었습니다!
            </div>
            <div class="d-flex gap-2 w-100" style="border: none; justify-content: center; padding: 20px">
                <button id="okButton" type="button" class="w-100 btn btn-primary fw-bolder"
                        style="background-color: #FF9494; color: white; padding: 8.5px 0" data-bs-dismiss="modal">확인
                </button>
            </div>
        </div>
    </div>
</div>