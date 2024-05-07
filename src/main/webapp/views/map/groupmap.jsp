
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

</script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh; /* 뷰포트 높이에 맞게 설정 */
        overflow-y: auto; /* 수직 스크롤바 자동 표시 */
    }
    li img {
        height: 15px; /* 이미지 높이 설정 */
        width: 15px; /* 이미지 너비를 자동으로 설정하여 비율 유지 */
        margin-right: 10px; /* 이미지와 다른 요소들 사이의 간격 */
    }
    .container {
        background-color: white;
        width: 100%;
        max-width: none;
        margin: 0 auto;
        padding: 0 20px; /* 기본 패딩 20px */
        box-sizing: border-box;
    }#map{
             width:100%;
             height:40vh;
             border-radius: 10px;
             position: sticky; /* sticky 위치 지정 */
            margin-bottom: 10px;
         }
    ul {
        list-style-type: none; /* 목록 앞에 불릿(점) 제거 */
        padding: 0; /* 패딩 제거 */
    }

    li.col {
        display: flex; /* Flexbox 사용 */
        justify-content: space-between; /* 요소들을 양 끝으로 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        margin-bottom: 10px; /* 각 항목 사이의 여백 */
        padding: 10px 20px; /* 내부 여백 설정 */
        height: 100px;
        background-color: #FFFCFC; /* 배경색 설정 */
        border-radius: 10px;
        border: 1px #FEF4F2 solid;
    }

    span {
        /* 텍스트에 관련된 추가 스타일 */
    }

    button {
        /* 버튼에 관련된 추가 스타일 */
    }.right-content {
         display: flex; /* Flexbox 사용 */
         align-items: center; /* 세로로 중앙 정렬 */
     }

</style>
<div>
    <div class="input-group mb-3">
        <select id = "optionsDropdown" class="form-select" aria-label="Default select example">
            <c:choose>
                <c:when test="${options == null or options == []}">
                    <option value="none">아직 약속이 없습니다. 약속을 만들어주세요</option>
                </c:when>
                <c:otherwise>
                    <option value="none">약속을 선택하세요</option>
                    <c:forEach var="option" items="${options}">
                        <option value="${option.proId}">${option.proName}</option>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
</div>
<div id="map" class="map"></div>

<div id="list"></div>

<button  type='button' style='width: 100%; margin-bottom: 20px; display: none' class = 'btn btn-primary' id = 'getBtn'> 후보 추가하기 </button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18804eb288163725a4242773721f7eee&libraries=services"></script>
<script>
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    const infowindow = new kakao.maps.InfoWindow({zIndex: 1});
    let map_data = [];

    const mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    const map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    const ps = new kakao.maps.services.Places();

    // 지도에 마커를 표시하는 함수입니다
    // 마커 클릭 시 관련 리스트 포커스 on
    function displayMarker(place) {
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.log, place.lat)
        });

        var newDiv = $("<li class = 'col' id = " + place.placeId +">");
        // 정보를 텍스트로 추가합니다.
        newDiv.append("<span><strong> " + place.placeName + "</strong></span>");
        newDiv.append("<input type='hidden' id = 'devoteId' value='"+ place.devoteId +"'>");


        // 새로운 div를 페이지의 "list" div에 추가합니다.
        $("#list").append(newDiv);

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.placeName + '</div>');
            infowindow.open(map, marker);
        });
    }
    $(document).ready(function() {
        $('#getBtn').click(function (){
            let devoteId = $('#devoteId').val(); // 선택된 옵션 값
            let url = '<c:url value="/map"/>'+ "?id="+ devoteId
            location.href =url
        });

        $('#optionsDropdown').change(function() {
            var selectedOption = $(this).val(); // 선택된 옵션 값
            if(selectedOption === 'none'){
                $('#getBtn').css('display', 'none');
                $("#list").empty();
            }else {
                $('#getBtn').css('display', 'block');
            }
            var bounds = new kakao.maps.LatLngBounds();
            console.log(selectedOption);
            if(selectedOption === 'none')
                return
            $.ajax({
                url: '<c:url value="/getpromise"/>', // 서버의 데이터를 가져올 URL
                type: 'GET', // 요청 방식
                data: { option: selectedOption }, // 서버로 전송할 데이터
                success: function(response) {
                    var bounds = new kakao.maps.LatLngBounds();
                    $("#list").empty();
                    for (let i=0; i<response.length; i++) {
                        displayMarker(response[i]);
                        bounds.extend(new kakao.maps.LatLng(response[i].log, response[i].lat));
                    }
                    map.setBounds(bounds);

                },
                error: function() {
                    alert('Error fetching data.'); // 에러 발생시 알림
                }
            });
        });
    });

</script>