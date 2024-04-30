
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
    newDiv.append("<p><strong>주소:</strong> " + place.address_name + "</p>");
    newDiv.append("<p><strong>도로명 주소:</strong> " + place.road_address_name + "</p>");
    newDiv.append("<p><strong>카테고리:</strong> " + place.category_name + "</p>");
    newDiv.append("<iframe src='" + place.place_url + "'width='100%' height='200px'></iframe>");



    // 새로운 div를 페이지의 "list" div에 추가합니다.
    $("#list").append(newDiv);

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
    infowindow.open(map, marker);
});
}