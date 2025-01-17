<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>***** 가입완료 *****</title>
<link rel="stylesheet" type="text/css" href="../css/w3.css">
<link rel="stylesheet" type="text/css" href="../css/member/member.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/memberjoin.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" data-search-pseudo-elements></script>
</head>
<body>
  <div class="w3-content w3-center w3-teal w3-container mw400700 radius1">
	    <!-- 가입완료  -->
	   <div class="w3-padding-64 w3-padding-large" id="step1">
	     <h1>회원가입 완료</h1>
	     <p class="w3-opacity">CONGRATULATIONS!</p> 
	      <form class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" action="/www/main.cls" id="main">
		<div class="w3-col mb10 pb20">
			<h1 class="mtb50">환영합니다!</h1>
			<i class="far fa-check-circle" style="width: 70px; height: 70px; "></i>
			<span class="input_chk mtb50">
				<span class="chk_all"><strong>${DATA.mname}</strong>님의 아이디는 <strong class="w3-text-red">${DATA.id}</strong>입니다.</span><br>
				<span class="chk_all">지금 바로 시작해보세요.</span>
			</span>
	    </div>  	
				
	       <div class="w3-button w3-blue w3-hover-aqua startbtn startbtnh">
	       		<a href="/www/main.jeju">시작하기</a>
	       	</div>
	     </form>
		</div>
   </div>
</body>
</html>