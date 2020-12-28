<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recommend Location</title>
<style>
body {
	text-align: center;
}

</style>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css">
<link rel="stylesheet" type="text/css" href="/www/css/cls.css">
<link rel="stylesheet" type="text/css" href="/www/css/recommend/recom.css">
<script type="text/javascript" src="/www/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/www/js/recommend.js"></script>
</head>
<body>
	<div class="w3-center">
		<button class="w3-button" style="float:right" type="button" id="hbtn">Home</button>
		<h2 class="w3-pink w3-padding">계절별 장소 추천 & 코로나 사진 여행 </h2>
	</div>	
	<div class="w3-center w3-margin-top">
		<div class="w3-third w3-center w3-padding">
			<button type="button" id="sbtn">
				<img src="/www/img/area/spring.jpg" class="imgbox" alt="봄">spring
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button" id="mbtn">
				<img src="/www/img/area/summer.jpg" class="imgbox" alt="여름">summer
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button"  id="fbtn">
				<img src="/www/img/area/fall.jpg" class="imgbox" alt="가을">fall
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button" id="wtbtn">
				<img src="/www/img/area/winter.jpg" class="imgbox" alt="겨울">winter
			</button>
		</div>
		<div class="w3-third w3-center w3-padding">
			<button type="button" id="abtn">
				<img src="/www/img/area/always.jpg" class="imgbox" alt="사계절내내">always
			</button>
		</div>
	</div>
</body>
</html>