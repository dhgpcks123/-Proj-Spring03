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
		<h2>봄에 가면 좋은 여행지!</h2>
		<button type="button" id="bbtn">Back</button>
		<!-- 타이틀 & 이미지 -->
<c:forEach var="data" items="${STORE}" varStatus="status">
	<c:if test="${data.stno == 100}">		
		<!--  title  -->
		<div class="w3-third w3-center w3-padding">
			<div class="w3-title">
				<h2 class="w3-center" >
					<strong> ${data.aname}</strong>
				</h2>
				<img src="/area/${data.aponame}" class="season"/>
			</div>
		</div>
	</c:if>
</c:forEach>
</body>
</html>

<%-- 	<div class="w3-half w3-center w3-padding">
			<img src="/img/area/${data.aponame}" class="imgbox" alt="봄">가파도(oname, aname 가져오기)
		</div> --%>
