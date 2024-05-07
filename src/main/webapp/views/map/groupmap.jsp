
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    $(document).ready(function() {
        $('#optionsDropdown').change(function() {
            var selectedOption = $(this).val(); // 선택된 옵션 값
            $.ajax({
                url: '/getpromise', // 서버의 데이터를 가져올 URL
                type: 'GET', // 요청 방식
                data: { option: selectedOption }, // 서버로 전송할 데이터
                success: function(response) {
                    placesSearchCB(response)
                },
                error: function() {
                    alert('Error fetching data.'); // 에러 발생시 알림
                }
            });
        });
    });
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
             height:75vh;
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
        <select class="form-select" aria-label="Default select example">
            <c:when test="${options == null}">
                <option value="">아직 약속이 없습니다. 약속을 만들어주세요</option>
            </c:when>
            <c:otherwise>
                <option value="">약속을 선택하세요</option>
                <c:forEach var="option" items="${options}">
                    <option value="${option}">${option}</option>
                </c:forEach>
            </c:otherwise>
        </select>
    </div>
</div>
<div id="map" class="map"></div>

<div id="list"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>
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

    $('#search-input').on('click', ()=>{
        $(".map").css({"height": "40vh"});
        ps.keywordSearch($('#key').val(), placesSearchCB);
    })
    // 키워드로 장소를 검색합니다


    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            map_data = data;
            console.log(map_data)
            // 검색된 장소 위치를 기준으로    지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            $("#list").empty();
            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
    }

    // 지도에 마커를 표시하는 함수입니다
    // 마커 클릭 시 관련 리스트 포커스 on
    function displayMarker(place) {

        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });

        var newDiv = $("<li class = 'col' id" + place.place_id +">");
        // 정보를 텍스트로 추가합니다.
        newDiv.append("<span><strong> " + place.place_name + "</strong></span>");
        newDiv.append("<input type='hidden' value='"+ place.id +"'>");
        newDiv.append("<div class='right-content'><button class='btn btn-primary'> " +"<img src='/img/heart-fill.png'/> "+"후보 추가" + "</button></div>");


        // 새로운 div를 페이지의 "list" div에 추가합니다.
        $("#list").append(newDiv);

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
        });
    }

</script>