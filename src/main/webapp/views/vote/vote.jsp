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
            let devoteId = $("#devoteId").val();
            let candidateId = $("#candidateId").val();

            let data = {
                "candidateId": candidateId,
                "userId": '',
                "devoteId": devoteId
            }

            $('.candidate').on('click', function() {
                $.ajax({
                    url: '/checkVote',
                    type: 'POST',
                    data: data,
                    success: function (res) {
                        // 성공적으로 요청을 처리한 후 실행할 코드를 작성합니다.
                        if (res) {
                            $.ajax({
                                url: '/candidateVote',
                                type: 'POST',
                                data: data,
                                success: function (response) {
                                    // 성공적으로 요청을 처리한 후 실행할 코드를 작성합니다.
                                    console.log(response,"ㅋㅋ야호");

                                },
                            })
                        }
                    },

                    error: function (xhr, status, error) {
                        // 요청이 실패한 경우 실행할 코드를 작성합니다.
                        console.error(error);
                    }
                });
            })

            $('#vote').click(() => {
                $.ajax({
                    url: '/voteConfirm',
                    type: 'POST',
                    data: data,
                    success: function (res) {
                        console.log(res,"<-1이면 투표상태 바뀐것임")
                    },
                })
            })
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
                    <input type="hidden" id = "devoteId" value="${item.devoteId}">
                    <input type="hidden" id = "candidateId" value="${item.candidateId}">
                </div>
            </div>
        </c:forEach>
    </div>
    <button id="vote" data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0; font-size: 16px" >투표하기</button>

</div>
