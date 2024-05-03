<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/03
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>


<style>
    input::placeholder {
        color: #CCCCCC;
    }
</style>

<div>
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 16px" >MYPAGE</div>
    <div class="d-flex flex-column">
        <div class="" style="border: 1px solid #EEEEEE; padding: 25px; border-radius: 12px">
            <div class="fw-bold text-center" style="font-size: 16px; padding-top: 8px; padding-bottom: 24px; color: #333333">삼식이 님</div>
            <div class="w-100" style="background-color: #EEEEEE; height: 1px; margin-bottom: 24px"></div>
            <div class="text-center" style="background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; padding: 20px; color: #333333">
                <div>From-its</div>
                <div>A better scheduling, From-its</div>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management" style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">친구 관리
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content" style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <div class="text-center" style="font-size: 16px; color: #333333">친구가 아직 없어요!</div>
            <button class="fw-bold align-items-center" style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none">친구 만들러가기</button>

        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management" style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">약속 일정
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content" style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <div class="text-center" style="font-size: 16px; color: #333333">약속이 아직 없어요!</div>
            <button class="fw-bold align-items-center" style="padding: 12px 20px; border-radius: 8px; margin-top: 32px; background-color: #FEF4F2; color: #FF9494; border: none">약속 만들러가기</button>

        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management" style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">주소록
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content" style="border: 1px solid #EEEEEE; border-radius: 12px; margin-top: 16px; padding: 20px; display: none; color: #333333">
            <div class="fw-bold" style="margin-bottom: 5px; color: #333333">우편번호 찾기</div>
            <input type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none; color: #333333" placeholder="ex) 우행시 모임" />
            <div class="fw-bold" style="margin-bottom: 5px; margin-top: 12px; color: #333333">주소</div>
            <input type="text" class="w-100" style="padding: 13px 14px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우행시 모임" />

            <button class="fw-bold d-flex row justify-content-end" style="margin-top: 20px; padding: 12px 20px; border-radius: 8px; background-color: #FEF4F2; color: #FF9494; border: none; margin-left: auto; margin-right:2px">주소 등록</button>
        </div>
        <div class="d-flex justify-content-between align-items-center fw-bold friend-management" style="background-color: #FF9494; color: white; border-radius: 8px; padding: 12px 20px; margin-top: 24px; cursor: pointer;">약속 그룹
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-down fw-bold" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1.553 6.776a.5.5 0 0 1 .67-.223L8 9.44l5.776-2.888a.5.5 0 1 1 .448.894l-6 3a.5.5 0 0 1-.448 0l-6-3a.5.5 0 0 1-.223-.67"/>
            </svg>
        </div>
        <div class="friend-management-content" style="background-color: #FFFCFC; border: 2px solid #FEF4F2; border-radius: 8px; margin-top: 16px; padding: 16px 20px; display: none; color: #333333; margin-bottom: 40px">우행시
        </div>
    </div>


    </div>
