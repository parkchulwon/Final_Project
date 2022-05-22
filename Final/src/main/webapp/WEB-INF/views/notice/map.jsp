<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<title>오시는길</title>




</head>
<body>
	<div class="mt-3" id="" style="margin : 0 auto;">
		<div id="map" style="width: 500px; height: 400px; margin : 0 auto;" class="map"></div>
		
		<div class="text-center mt-3">
			<button type="button" class="btn btn-primary" onclick="location.href='https://map.kakao.com/link/map/37.4027,126.9220'">길찾기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='https://map.kakao.com/link/search/안양역'">지도보기</button>
		</div>
	</div>
	
</body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15c7d35ce431c99df038d9f953890889"></script>
<script type="text/javascript">
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.4027, 126.9220),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.4027, 126.9220), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});

	// 지도에 마커를 표시합니다
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;

		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);

		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';

		var resultDiv = document.getElementById('clickLatlng');
		resultDiv.innerHTML = message;

	});
</script>
<p align="center">주소 : 경기 안양시 만안구 만안로 244 엔터식스 7층</p>
<p align="center">문의전화 : 031-1234-5678</p>
<p align="center">운영시간 : 월~일 11:00~15:00 // 18:00~22:00 (16:00 ~ 18:00 BreakTime) </p>
<p align="center">오시는 길 : [버스] 5-1, 1650, 3330 이용 // [지하철] 수도권 1호선 안양역 </p>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
