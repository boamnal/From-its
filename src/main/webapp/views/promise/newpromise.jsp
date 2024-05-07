<%--
  Created by IntelliJ IDEA.
  User: yangchaeyeon
  Date: 2024/05/02
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18804eb288163725a4242773721f7eee&libraries=services"></script>

<script>
    let regist = false;
    let memberCoordinates = []

    function findMidpoint(locations) {
        let sumX = 0, sumY = 0, sumZ = 0;
        console.log("locationsssss", locations)

        for (let i = 0; i < locations.length; i++) {
            console.log("ㄸㅇ2",locations[i].La)

        }

        locations.forEach(location => {
            // 라디안 단위로 변환
            const latRad = location.Ma * Math.PI / 180;
            const lonRad = location.La * Math.PI / 180;

            // 3D 벡터로 변환
            sumX += Math.cos(latRad) * Math.cos(lonRad);
            sumY += Math.cos(latRad) * Math.sin(lonRad);
            sumZ += Math.sin(latRad);
        });

        const avgX = sumX / locations.length;
        const avgY = sumY / locations.length;
        const avgZ = sumZ / locations.length;

        // 중간 지점의 경도와 위도(라디안) 계산
        const lon = Math.atan2(avgY, avgX);
        const hyp = Math.sqrt(avgX * avgX + avgY * avgY);
        const lat = Math.atan2(avgZ, hyp);



        // 라디안을 도로 변환
        const finalLat = lat * 180 / Math.PI;
        const finalLon = lon * 180 / Math.PI;

        return {La: finalLon, Ma: finalLat};
    }



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


    // 모달이 닫히는 이벤트를 감지하고, 닫힌 후에 처리
    $('#exampleModal').on('hidden.bs.modal', function () {
        toggleModalContent();
    });

    function addressToCoordinate(address) {
        return new Promise((resolve, reject) => {
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    resolve(coords); // 좌표 변환 성공
                } else {
                    reject(new Error("주소 변환 실패")); // 좌표 변환 실패
                }
            });
        });
    }



    let createPromise = {
        init: function () {
            console.log(memberCoordinates)
            toggleModalContent();

            $("#confirmButton").click(() => {
                if (!regist) {
                    regist = true;
                    let promiseName = $("#promiseName").val();
                    let promiseContent = $("#promiseContent").val();

                    let queryString = window.location.search;
                    let params = new URLSearchParams(queryString);
                    let groupId = params.get('groupId');

                    $.ajax({
                        url: '/getFriendsAddress',
                        type: 'GET',
                        contentType: 'application/json',
                        data: {groupId: groupId},
                        success: async (res) => {
                            try {
                                let coordinatePromises = res.map(user => addressToCoordinate(user.address));
                                let coordinates = await Promise.all(coordinatePromises); // 모든 좌표 변환 작업이 완료될 때까지 기다립니다.
                                memberCoordinates = coordinates; // memberCoordinates 배열을 업데이트
                                console.log(memberCoordinates);
                                const midpoint = findMidpoint(memberCoordinates); // 비동기 함수가 아니므로 await 제거
                                console.log(midpoint);

                                // 여기에서 createPromise API 호출
                                $.ajax({
                                    url: '/createpromise',
                                    type: 'GET',
                                    contentType: 'application/json',
                                    data: {
                                        promiseName: promiseName,
                                        promiseContent: promiseContent,
                                        groupId: groupId,
                                        midpointLat: midpoint.Ma, // 중간지점 위도
                                        midpointLon: midpoint.La // 중간지점 경도
                                    },
                                    success: function (res) {
                                        toggleModalContent();
                                        setTimeout(() => {
                                            window.location.href ="/map?groupId="+groupId
                                        }, 1500);

                                    }
                                });
                            } catch (error) {
                                console.error("좌표 변환 실패:", error);
                            }
                        }
                    });


                } else {
                    $('#exampleModal').modal('hide');
                    regist = false;
                }

                $("#cancelButton").click(() => {
                    $('#exampleModal').modal('hide');
                });

                $("#resultModal").on('hidden.bs.modal', function () {
                    $('#exampleModal').modal('show'); // 결과 모달이 닫히면 등록 모달을 다시 표시
                });
            });
        }
    };
    $(function () {
        createPromise.init();
    });

</script>
<style>
    input::placeholder, textarea::placeholder {
        color: #CCCCCC;
    }
</style>

<div class="min-vh-100 d-flex flex-column">
    <div class="fw-bold" style="font-size: 22px; margin-bottom: 30px">약속 만들기</div>
    <div class="d-flex flex-column">
        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속명</div>
            <input id="promiseName" type="text" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우행시 모임" />
        </div>

        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">그룹명</div>
            <div class="w-100" style="color: #333333; padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" >${groupName}</div>
        </div>

        <div style="margin-bottom: 40px">
            <div class="fw-medium" style="font-size: 16px">약속 내용</div>
            <textarea id="promiseContent" rows="5" class="w-100" style="padding: 13px 12px; margin-top: 8px; border-radius: 8px; background-color: #F8F8FA; border: none" placeholder="ex) 우리들의 행복한 시간 ^^~" ></textarea>
        </div>
    </div>
    <button id="makePromise" data-bs-toggle="modal" data-bs-target="#exampleModal" class="mt-auto w-100 btn btn-primary mb-4 rounded-3 fw-bolder mt-auto"  style="padding: 12px 0;" >생성하기</button>
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

