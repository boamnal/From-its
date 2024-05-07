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

    .selectBox2 {
        position: relative;
    }

    .selectBox2 .optionList {
        position: absolute;
        /*top: 60px;*/
        left: 0;
        width: 100%;
        background: white;
        color: #333333;
        list-style-type: none;
        padding: 0;
        border-radius: 8px;
        overflow-y: auto; /* Enable vertical scrolling */
        max-height: 500px; /* Set a maximum height for the list */
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

</style>

<script>

    function searchFriends() {
        let searchText = $('#searchText').val()

        // 검색어가 비어있는 경우, 전체 조회 URL을 사용
        let apiUrl = searchText ? '/searchFriends' : '/getAllFriends';

        $.ajax({
            url: apiUrl,
            type: 'GET',
            data: {
                searchText: searchText
            },
            success: function(response) {
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
                            '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle-fill" style="color: #CCCCCC" viewBox="0 0 16 16">' +
                            '<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>' +
                            '</svg>' +
                            '</button>' +
                            '</li>';
                        $(".optionList").append(friendElement);

                    });
                } else {
                    // 검색 결과가 비어있는 경우
                    let noResult = `
                    <div className="friend-management-content"
                         style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; display: flex; flex-direction: column; justify-content: center; align-items: center;">
                        <div className="text-center" style="font-size: 16px; color: #333333">친구가 존재하지 않아요!</div>
                        <button className="fw-bold align-items-center"
                                style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none"
                                onClick="window.location.href='/search'">친구 만들러가기
                        </button>
                    </div>
                    `
                    $(".optionList").append(noResult);
                }
            }
        });
    }
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

        searchFriends()

        let selectedFriends = [];
        // 친구 버튼을 클릭했을 때의 이벤트 리스너
        $('.optionList').on('click', '.optionItem', function() {
            let friendId = $(this).data('friendId');
            let friendName = $(this).data('friendName');
            let friendProfile = $(this).data('friendProfile');
            selectedFriends.push(friendId);

            var selectedFriendHtml = '<div class="d-flex align-items-center" style="background-color: #FFFCFC; border-radius: 8px; border: 2px solid #FEF4F2; padding: 10px 10px; margin: 16px 0; margin-right: 20px;">' +
                '<img src="/img/' + friendProfile + '.png" style="width: 40px; height: 40px; margin-right: 10px"  />' +
                '<div style="color: #333333;">' + friendName + '</div>' +
                '</div>';

            $('#selectedFriends').append(selectedFriendHtml);

        });

        $("#confirmButton").click(() => {
            if (regist) {
                $('#exampleModal').modal('hide');
                regist = false;
            } else {
                regist = true;
                let groupName = $('#groupName').val()
                console.log({ groupName: groupName, friendIds: selectedFriends })
                $.ajax({
                    url: '/createNewGroup',
                    type: 'GET',
                    contentType: 'application/json',
                    data: { groupName: groupName, friendIds: selectedFriends },
                    success: function(res) {
                        console.log("그룹멤버 등록 됨")
                        if(res) {
                            window.location.href ="/newpromise"
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("그룹멤버 등록 실패")
                    }
                });
                // 모달을 닫지 않고 사용자가 '등록되었습니다!' 메시지를 확인한 후 다시 확인을 누를 때 닫는다
                toggleModalContent();
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
    .scroll {
        overflow: auto;
        white-space: nowrap;
    }
    .scroll::-webkit-scrollbar {
        display: none;
    }
</style>

<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">새 그룹 등록</div>
    <div style="margin-bottom: 40px">
        <div class="fw-medium" style="font-size: 16px">그룹 이름</div>
        <input id="groupName" type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="우행시 모임" />
    </div>
    <div>
        <div class="fw-medium" style="font-size: 16px">그룹 친구 등록</div>
        <div class="d-flex scroll">
            <div id="selectedFriends" class="d-flex"></div>

        </div>
        <div style="position: relative; margin-bottom: 10px;">
            <input oninput="searchFriends()" id="searchText" type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none; position: relative" placeholder="친구 아이디를 검색하세요." >
            <button style="position: absolute; right: 14px; bottom: 15px; border: none; background: none">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                </svg>
            </button>
        </div>
        <div class="selectBox2">
            <ul class="optionList">
            </ul>
        </div>

    </div>
    <button data-bs-toggle="modal" data-bs-target="#exampleModal" id="submitNewGroup" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0; background-color: #FF9494; color: white;" >생성하기</button>

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
