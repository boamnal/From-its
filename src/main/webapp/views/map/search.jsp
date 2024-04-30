
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh; /* 뷰포트 높이에 맞게 설정 */
        overflow-y: auto; /* 수직 스크롤바 자동 표시 */
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
             height:80vh;
             border-radius: 10px;
             position: sticky; /* sticky 위치 지정 */
         }
     .col{
        text-align: center;
         align-content: center;
         border-radius: 10px;
         height:75px;
     }#list{

               overflow-y: auto; /* 수직 스크롤바 자동 표시 */
           }
</style>
<div>
    <div class="input-group mb-3">
        <input type="text" id="key" class="form-control" placeholder="Search">
        <button type="button" class="btn btn-primary" id="search-input">찾기</button>
    </div>
</div>
<div id="map" class="map"></div>
<div id="list">

</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18804eb288163725a4242773721f7eee&libraries=services"></script>
<script>
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
    const infowindow = new kakao.maps.InfoWindow({zIndex: 1});

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

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

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
        var newDiv = $("<div class = 'col'>");

        // 정보를 텍스트로 추가합니다.
        newDiv.append("<p><strong>장소 이름:</strong> " + place.place_name + "</p>");



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