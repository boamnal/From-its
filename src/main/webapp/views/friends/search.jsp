<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    input::placeholder {
        color: #CCCCCC;
    }

    .selectBox2 {
        position: relative;
        /*width: 100%;*/
        /*padding: 13px 12px;*/
        /*border-radius: 8px;*/
        /*background-color: #F8F8FA;*/
        /*margin-top: 8px;*/
        /*cursor: pointer;*/
    }

    /*.selectBox2:after {*/
    /*    content: '';*/
    /*    display: block;*/
    /*    width: 2px;*/
    /*    height: 100%;*/
    /*    position: absolute;*/
    /*    top: 0;*/
    /*    right: 35px;*/
    /*    background: #FF9494;*/
    /*}*/


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

    /*.selectBox2.active .optionList {*/
    /*    max-height: 500px;*/
    /*}*/

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

    /*.selectBox2 .optionItem:last-child {*/
    /*    border-bottom: 0 none;*/
    /*}*/

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
</style>

<script>
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

        $("#confirmButton").click(() => {
            if (regist) {
                $('#exampleModal').modal('hide');
                // Add friend here
                addFriend();

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
    // 검색
    $(function () {
        const boardSearch = document.querySelector("#boardSearch");
        const searchQuery = document.querySelector("#searchQuery");
        const params = new URL(location.href).searchParams;
        const query = params.get("query"); // 검색어


        // 검색어 입력 없이 제출된 경우
        boardSearch.addEventListener("submit", e => {


            if (searchQuery.value.trim().length == 0) { // 검색어 미입력 시
                e.preventDefault(); // form 기본 이벤트 제거
                location.href = location.pathname; // 해당 게시판 1페이지로 이동
                // location.pathname : 쿼리스트링을 제외한 실제 주소
            }

        });
    });

    // 클릭시 plus button 활성화
    $(function () {
        let i = 0;
        $('#plus_btn').on('click', function () {
            if (i == 0) {
                $(this).attr('src', "<c:url value="/img/plus-circle-fill.svg"/>");
                i++;
            } else if (i == 1) {
                $(this).attr('src', "<c:url value="/img/plus-circle.svg"/>");
                i--;
            }

        });
    });

    $(function () {
        $('.optionItem').on('click', function () {
            let userId = $(this).text().trim(); // 클릭한 친구의 userId 가져오기
            let imgSrc = $(this).find('img').attr('src'); // 이미지의 소스 가져오기

            if (imgSrc.includes('plus-circle-fill')) {
                // 이미지가 plus-circle-fill이면
                console.log('친구 추가: ' + userId);
                addFriend(userId); // 친구 추가 함수 호출

            } else {
                // 이미지가 plus-circle이면
                console.log('친구 추가 취소: ' + userId);

            }
        });
    });

    function addFriend(userId) {
        // AJAX를 이용하여 서버에 친구 추가 요청 보내기
        $.ajax({
            type: "POST",
            url: "/addFriend", // 친구 추가를 처리할 컨트롤러 URL
            data: {
                friendId: userId // 선택한 친구의 userId 전달
            },
            success: function(response) {
                // 친구 추가가 성공하면 추가된 친구의 목록을 갱신하거나 다른 작업을 수행할 수 있음
                console.log("친구 추가 성공!");
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 처리할 코드
                console.error("친구 추가 오류:", error);
            }
        });
    }



</script>

<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 20px; margin-bottom: 30px">친구맺기</div>
    <form class="" action="/searchById" method="get" id="boardSearch">

        <div style="position: relative;">
            <input type="text" class="w-100"
                   style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none; position: relative"
                   name="query" id="searchQuery" value="${param.query}" placeholder="친구 아이디를 검색하세요." autocomplete="off">


            <button style="position: absolute; right: 14px; bottom: 15px; border: none; background: none">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
                     viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                </svg>
            </button>
        </div>
    </form>

    <c:choose>
        <c:when test="${not empty message}">
            <%-- 조회된 친구 목록이 비어 있거나 null인 경우 --%>
            <div class="d-flex justify-content-center py-4" style="margin-top: 30px; margin-bottom: 20px;">
                <h1>${message}</h1>
            </div>
        </c:when>
        <c:otherwise>
            <div class="selectBox2">
                <ul class="optionList">
                    <!-- 게시글 목록 조회 결과가 있다면 -->
                    <c:forEach var="member" items="${list2}">
                        <li class="optionItem">${member.userId}
                            <img id="plus_btn" src="<c:url value="/img/plus-circle.svg"/>" width="20px" height="20px">
                        </li>
                        <%--<li class="optionItem">${member.email}</li>--%>

                    </c:forEach>
                </ul>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<button data-bs-toggle="modal" data-bs-target="#exampleModal" id="creategroup"
        class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"
        style="padding: 12px 0; background-color: #FF9494; color: white;">생성하기
</button>

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
