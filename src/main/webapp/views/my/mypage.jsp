<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/03
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--우편번호 찾기 자바스크립트 파일-->
<script src="/js/member/zipcode_popup.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    let mypage = {
        init: function () {
        }
    };
    $(function () {
        mypage.init();
    });
</script>

<script>
    $(function () {
        // 초기에는 모든 관리 내용을 숨김
        $(".friend-management-content").hide();

        // 친구 관리 버튼 클릭 시 토글 기능
        $(".friend-management").click(function () {
            // 클릭된 버튼의 다음 요소를 찾아서 토글
            $(this).next(".friend-management-content").toggle();
        });
    });

    // 친구 목록 조회
    function searchFriends() {

        $.ajax({
            url: '/getAllFriends',
            type: 'GET',

            success: function (response) {
                console.log(response)
                // 검색 결과를 표시할 요소의 내용을 초기화
                $(".optionList").empty();

                if (response && response.length > 0) {
                    // response 배열을 반복하면서 각 친구 정보를 화면에 추가
                    response.forEach(function (friend) {
                        // console.log(friend)
                        var friendElement = '<li class="optionItem" data-friend-id="' + friend.userId + '" data-friend-name="' + friend.name + '" data-friend-profile="' + friend.profile + '">' +
                            '<div class="content">' +
                            '<img src="/img/' + friend.profile + '.png" style="width: 40px; height: 40px; margin-right: 10px; border: 1px solid #CCCCCC; padding: 2px; border-radius: 99px" />' +
                            friend.userId + ' <span style="color: #FF9494">(' + friend.name + ')</span>' +
                            '</div>' +
                            '<button style="border: none; background: none">' +
                            '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" className = "bi bi-dash-circle-fill" style="color: #CCCCCC" viewBox = "0 0 16 16" >' +
                            '<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1z"/>' +
                            '</svg>' +
                            '</button>' +
                            '</li>';
                        $(".optionList").append(friendElement);
                    });
                } else {
                    // 검색 결과가 비어있는 경우
                    let noResult =
                        `
                        <div class="noResult-container">
                        <div class="noResult-message">친구가 존재하지 않아요!</div>
                        <button class="noResult-button" onclick="window.location.href='/search'">친구 만들러가기</button>
                        </div>
                        `;
                    $(".optionList").append(noResult);
                }
            }
        });
    }


    // 등록여부 flag 변수
    let regist = false;

    function toggleModalContent() {
        if (regist) {
            $("#modalContent").text("등록되었습니다!");
            $("#confirmButton").text("확인");
            $("#cancelButton").hide();
        } else {
            $("#modalContent").text("등록하시겠습니까?");
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
        searchFriends();

        $(".editButton").click(() => {
            if (regist) {
                $('#exampleModal').modal('hide');
                regist = false;
            } else {
                let adress = $('#sample6_address').val();
                let zipcode = $('#sample6_postcode').val();
                console.log({adress: adress, zipcode: zipcode})
                let custInfo = {
                    userId: "${custInfo.userId}",
                    email: "${custInfo.email}",
                    password: "${custInfo.password}",
                    address: adress,
                    zipcode: zipcode,
                    name: "${custInfo.name}",
                    profile: "${custInfo.profile}"
                };
                let data = JSON.stringify(custInfo);
                $.ajax({
                    url: '/updateAddress',
                    type: 'POST',
                    contentType: 'application/json',
                    data: data,
                    success: function () {
                        console.log("등록 성공");
                        // 등록 성공 시에는 모달을 숨기지 않고, "등록되었습니다!" 메시지를 보여줍니다.
                        regist = true;
                        toggleModalContent();
                    },
                    error: function (xhr, status, error) {
                        console.log(" 등록 실패")
                    }
                });
            }
        });

        // 친구 목록 클릭했을 때의 이벤트 리스너
        $('.optionList').on('click', '.optionItem', function () {
            let friendId = $(this).data('friendId');
            let friendName = $(this).data('friendName');
            let friendProfile = $(this).data('friendProfile');
            // 모달 내용 설정
            $('#modalContent').text(friendId + ' (' + friendName + ')' + '와 친구 끊을까요?');
            $('#exampleModal').modal('show'); // 모달 표시
            $('#confirmButton').off('click').on('click', function () { // 중복된 바인딩을 피하기 위해 이전 클릭 이벤트 해제
                $.ajax({
                    url: '/byeFriend',
                    type: 'GET',
                    contentType: 'application/json',
                    data: {friendId: friendId},
                    success: function (response) {
                        // 등록에 성공한 경우 모달을 닫습니다.
                        $('#exampleModal').modal('hide');
                        // 친구 목록을 다시 불러와서 업데이트합니다.
                        searchFriends();
                    },
                    error: function (xhr, status, error) {
                        // 필요한 경우 오류 처리
                    }
                });
            });
        });


        // 모달 확인 버튼 클릭 이벤트 리스너
        $('#confirmButton').click(function () {
            if (regist) {
                // 모달 닫기
                $('#exampleModal').modal('hide');
                // 등록 여부 flag 초기화
                regist = false;
            }
        });
        $("#cancelButton").click(() => {
            $('#exampleModal').modal('hide');
        });

        $("#resultModal").on('hidden.bs.modal', function () {
            $('#exampleModal').modal('show'); // 결과 모달이 닫히면 등록 모달을 다시 표시
        });
    });
</script>

<style>
    input::placeholder {
        color: #CCCCCC;
    }

    .scroll {
        overflow: auto;
        white-space: nowrap;
    }

    .scroll::-webkit-scrollbar {
        display: none;
    }

    /*noResult: 조회 결과가 없을 때의 CSS*/
    .friend-management-content {
        width: 100%; /* 부모 요소의 너비를 100%로 설정 */
    }

    .selectBox2 {
        position: relative;
        width: 100%; /* 부모 요소와 동일한 너비로 설정 */

    }

    .selectBox2 .optionList {
        /*position: absolute;*/
        /*top: 60px;*/
        left: 0;
        width: 100%; /* 부모 요소와 동일한 너비로 설정 */
        background: white;
        color: #333333;
        list-style-type: none;
        padding: 0;
        border-radius: 8px;
        overflow-y: auto;
        /*height: 200px;*/
        transition: .3s ease-in;
    }

    .selectBox2 .optionItem {
        border: 1px solid #EEEEEE;
        border-radius: 8px;
        padding: 13px 12px;
        transition: .1s;
        font-size: 16px;
    }

    .selectBox2 .optionItem:hover {
        background: #FEF4F2;
        color: #FF9494;
    }

    .selectBox2 .optionList::-webkit-scrollbar {
        width: 6px;
    }

    .selectBox2 .optionList::-webkit-scrollbar-track {
        background: transparent;
    }

    .selectBox2 .optionList::-webkit-scrollbar-thumb {
        background: #303030;
        border-radius: 45px;
    }

    .selectBox2 .optionList::-webkit-scrollbar-thumb:hover {
        background: #303030;
    }

    .optionItem {
        display: flex;
        justify-content: space-between;
        align-items: center; /* 세로 중앙 정렬을 위해 추가 */
    }

    .noResult-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
    }

    .noResult-message {
        font-size: 16px;
        color: #333333;
    }

    .noResult-button {
        font-weight: bold;
        padding: 12px 20px;
        border-radius: 8px;
        margin-top: 32px;
        background-color: #FEF4F2;
        color: #FF9494;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    .noResult-button:hover {
        background-color: #FF9494;
        color: white;
    }

</style>

<div>
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 16px">MYPAGE</div>
    <div class="d-flex flex-column">
        <div class="" style="border: 1px solid #EEEEEE; padding: 25px; border-radius: 12px">
            <div class="fw-bold text-center"
                 style="font-size: 16px; padding-top: 8px; padding-bottom: 24px; color: #333333">${custInfo.name} 님
            </div>
            <div class="w-100" style="background-color: #EEEEEE; height: 1px; margin-bottom: 24px"></div>
            <div class="text-center"
                 style="background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; padding: 20px; color: #333333">
                <div>From-its</div>
                <div>A better scheduling, From-its</div>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management"
             style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">
            친구 관리
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>

        </div>

        <div class="friend-management-content"
             style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: flex; flex-direction: column; justify-content: center; align-items: center;">

            <div class="selectBox2">
                <ul class="optionList">
                </ul>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center fw-bold friend-management"
             style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">
            약속 일정
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content"
             style="background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; margin-top: 16px; padding: 16px 20px; display: none; color: #333333; margin-bottom: 40px">
            <c:choose>
                <c:when test="${empty promise}">
                    <div class="d-flex flex-column justify-content-center text-center">
                    <div  style="font-size: 16px; color: #333333">약속이 아직 없어요!</div>
                    <button class="fw-bold"
                            style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none" onclick="window.location.href='/initial'">
                        약속 만들러가기
                    </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${promise}" var="p">
                        <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
<%--                            약속상세페이지로 이동 url--%>
                            <div class="fw-medium" style="font-size: 16px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;">
                                <div>${p.proName}</div>
                                <div>${p.proDate}</div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management"
             style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">
            주소록
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content"
             style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; color: #333333">
            <c:choose>
                <c:when test="${empty custInfo}">
                    <p>사용자 정보가 없어요</p>
                </c:when>
                <c:otherwise>

                    <!-- 조회 결과가 있다면 -->
                    <div class="fw-bold" style="margin-bottom: 5px; color: #333333">우편번호</div>
                    <div class="form-group d-flex align-items-center">

                        <input id="sample6_postcode" class="form-control me-2" type="text"
                               style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none; color: #333333"
                               placeholder="ex) 우행시 모임" value="${custInfo.zipcode}"/>
                        <button id="find_zipcode" type="button" class="btn btn-primary rounded-3 fw-bold text-nowrap"
                                style="background-color: #FEF4F2; color: #FF9494; padding: 12px; margin-top: 8px;"
                                onclick="sample6_execDaumPostcode()">검색
                        </button>
                    </div>

                    <div class="fw-bold" style="margin-bottom: 5px; margin-top: 12px; color: #333333">주소</div>
                    <input id="sample6_address" type="text" class="w-100"
                           style="padding: 13px 14px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none"
                           placeholder="ex) 우행시 모임" value="${custInfo.address}"/>

                    <button class="fw-bold d-flex row justify-content-end  btn btn-primary rounded-3 text-nowrap editButton"
                            style="margin-top: 20px; padding: 12px 20px; border-radius: 8px; background-color: #FEF4F2; color: #FF9494; margin-left: auto; margin-right:2px"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        주소 수정
                    </button>

                </c:otherwise>
            </c:choose>


        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management"
             style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">
            약속 그룹
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content"
             style="background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; margin-top: 16px; padding: 16px 20px; display: none; color: #333333; margin-bottom: 40px">
        <c:choose>
            <c:when test="${empty group}">
            <div class="d-flex flex-column justify-content-center text-center">
                <div style="font-size: 16px; color: #333333">약속 그룹이 아직 없어요!</div>
                    <button class="fw-bold"
                            style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none" onclick="window.location.href='/initial'">
                        내 약속 그룹 만들러가기
                    </button>
            </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${group}" var="g">
                    <div class="schedule" style="border-radius: 12px; border: 1px solid #EEEEEE; padding: 20px; margin-bottom: 20px">
                        <div class="fw-medium" style="font-size: 16px; border-radius: 12px; border: 3px solid #FEF4F2; background-color: #FFFCFC; padding: 20px; text-align: center;" onclick="window.location.href='/mygroup'">
                            <div>${g.groupName}</div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </div>
    </div>


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
