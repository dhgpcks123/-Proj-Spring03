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
	<div> 
		<h2>사계절 내내 가면 좋은 여행지!</h2>
		<div>
			<div class="w3-button" id="bbtn">Back</div>
		</div>
<c:forEach var="data" items="${STORE}" varStatus="status">
	<c:if test="${data.stno == 500}">		
			<!--  title  -->
		<div class="w3-third w3-center w3-padding">
			<div class="w3-title">
				<h2 class="w3-center" >
					<strong> ${data.aname}</strong>
				</h2>
				<img src="/www/img/area/${data.aponame}" class="season"/>
			</div>
		</div>
	</c:if>
</c:forEach>
		
	</div>
	
</body>
</html>