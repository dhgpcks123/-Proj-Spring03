<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Board List</title>
<link rel="stylesheet" type="text/css" href="css/cls.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/favorView.js"></script>

<script type="text/javascript">
</script>
</head>
<body>
	<div class="w3-content mw800">
		<!-- top -->
		<div class="w3-col w3-center w3-card-4">
			<!-- 타이틀 -->
			<div class="w3-col w3-pink w3-padding txt24">${SID} 님의 찜 목록</div>
			
			<!-- 메뉴 -->
			<div class="w3-col">
				<div class="w3-col m1 w3-deep-orange w3-hover-lime w3-button w3-tiny w3-left" 
					id="hbtn">home</div>
	<c:if test="${not empty SID}">
				<div class="w3-col m1 w3-red w3-hover-deep-orange w3-button w3-tiny w3-right" 
					id="obtn">logout</div>
				<div class="w3-col m1 w3-gray w3-hover-green w3-button w3-tiny w3-right sbtn"
					id="sbtn5">응급 모아보기</div>
				<div class="w3-col m1 w3-yellow w3-hover-lime w3-button w3-tiny w3-right sbtn"
					id="sbtn4">식당 모아보기</div>
				<div class="w3-col m1 w3-green w3-hover-teal w3-button w3-tiny w3-right sbtn"
					id="sbtn3">병원 모아보기</div>
				<div class="w3-col m1 w3-blue w3-hover-aqua w3-button w3-tiny w3-right sbtn" 
					id="sbtn2">숙박 모아보기</div>
				<div class="w3-col m1 w3-orange w3-hover-deep-orange w3-button w3-tiny w3-right sbtn"
					id="sbtn1">관광 모아보기</div>
				
	</c:if>
				<div class="w3-rest w3-purple" style="opacity: 0.7; height: 31px;"> </div>
			</div>
		</div>
		
		<!-- 게시글리스트 -->
		<div class="w3-col w3-margin-top w3-padding w3-card-4">
			<div class="w3-col w3-center w3-border w3-margin-top">
				<div class="w3-col m3 w3-light-grey w3-border-right">장소이름</div>
				<div class="w3-col m6 w3-light-grey w3-border-right">장소경로</div>
				<div class="w3-col m3 w3-light-grey w3-border-right">전화번호</div>
			</div>
			<div class="w3-col w3-border-left w3-border-right w3-margin-bottom">
				<c:forEach var="data" items="${LIST}">
					<div class="w3-col m3 w3-border-right">${data.aname}</div>
					<div class="w3-col m6 w3-border-right">${data.aloc}</div>
					<div class="w3-col m3 w3-border-right">${data.atel}</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>