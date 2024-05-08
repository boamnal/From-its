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
    let regist = false;


    // 모달이 닫히는 이벤트를 감지하고, 닫힌 후에 처리합니다.
    $('#exampleModal').on('hidden.bs.modal', function () {
        toggleModalContent();
    });

    let vote = {
        init: function () {
            let devoteId = $("#devoteId").val();
            let candidateId = $("#candidateId").val();
            let data = {
                "candidateId": candidateId,
                "userId": '',
                "devoteId": devoteId
            }

            console.log("dsfsdfsdxfsd", devoteId)

            $("#confirmButton").off("click");

            if (regist) {
                $("#modalContent").text("최종 약속 장소가 결정되었습니다.");
                $("#confirmButton").text("확인").click(function() {
                    // 약속 확정하기 페이지로 리다이렉트
                    window.location.href = "/finalplace?devoteId="+devoteId; // 이 부분은 실제 페이지 URL로 변경해야 합니다.
                });
                $("#cancelButton").hide();
            } else {
                $("#modalContent").text("그룹 멤버가 투표를 완료하지 않았습니다!");
                $("#confirmButton").text("확인").click(function() {
                    // 모달 닫기
                    $('#exampleModal').modal('hide');
                });
            }

            $('.candidate').on('click', function() {
                $.ajax({
                    url: '/checkVote',
                    type: 'POST',
                    data: data,
                    success: function (res) {
                        if (res === 1) {
                            // 투표 가능한 상태
                            $.ajax({
                                url: '/candidateVote',
                                type: 'POST',
                                data: data,
                                success: function (response) {
                                    console.log(response, "ㅋㅋ야호");
                                    $("#modalContent").text("투표되었습니다.");
                                    $('#exampleModal').modal('show');
                                },
                            });
                        } else {
                            // 이미 투표한 상태
                            $("#modalContent").text("이미 투표한 장소가 있습니다.");
                            $('#exampleModal').modal('show');
                        }
                    }
                });
            })


            $('#vote').click(() => {
                $.ajax({
                    url: '/voteConfirm',
                    type: 'POST',
                    data: data,
                    success: function (res) {
                        if (res === 1) {
                            regist = true; // 서버의 응답에 따라 regist 상태를 설정
                            toggleModalContent(); // 상태에 따라 모달의 내용을 변경
                            $('#exampleModal').modal('show'); // 모달을 보여줌
                            // 최종 약속 장소가 결정되었습니다. 모달에서 확인 누르면 ?
                            // 약속 확정하기 페이지로 이동합니다로 결과모달
                        } else {
                            regist = false;
                            toggleModalContent();
                            $('#exampleModal').modal('show');
                            // 그룹 멤버가 아직 투표를 하지 않았습니다!
                        }
                        console.log(res,"<-1이면 투표상태 바뀐것임")
                    },
                })
            })
        },
        toggleModalContent: function (){

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
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">약속 장소 투표</div>
    <div class="d-flex flex-column">
        <input id="devoteId" class="d-none" value="${list[0].devoteId}" />
        <input id="candidateId" class="d-none" value="${list[0].candidateId}" />
        <c:forEach items="${list}" var = "item">
            <div id="candidate" class="candidate" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px" data-devote-id="${item.devoteId}" data-candidate-id="${item.candidateId}">
                <div class="fw-medium" style="font-size: 16px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
                    <div>${item.placeName}</div>
                    <div>${item.placeAddress}</div>
                </div>
            </div>
        </c:forEach>
    </div>
    <button id="vote" data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0; font-size: 16px" >투표하기</button>
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