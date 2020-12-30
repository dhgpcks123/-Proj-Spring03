<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Board List</title>
<link rel="stylesheet" type="text/css" href="css/cls.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/component/topHeader.css">
<link rel="stylesheet" type="text/css" href="/www/css/favor/favor.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/favorView.js"></script>
<script type="text/javascript" src="/www/js/component/topHeader.js"></script>
<script type="text/javascript" src="/www/js/memberLogin.js"></script>
<script src="https://kit.fontawesome.com/e6e9b86680.js"></script>
</head>
<body>
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 	메인 상단 헤더 부분			 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<div class="topHeader" style="margin-bottom: 30px;">
	<div class="topHeader__column">
		<div class="topHeader__column-backwhite">
			<div class="topHeader__desc">
				<span>제주를 여행하는 가장 빠른 방법 </span>
				<i class="fas fa-plane-departure"></i>
			</div>
			<div class="topHeader__logo">
				<span>제주꿀맵</span>
				<div class="topHeader__eyesIcon">
					<div class="topHeader__eyes">
				    	<div class="topHeader__eye1 eye">
				       		<div class="topHeader__dot">
				       	</div>
				        </div>
				       	<div class="topHeader__eye2 eye">
				    	   	<div class="topHeader__dot">
				    	</div>
					    </div>
				    </div>
				</div>
			</div>
		</div>
	</div>	
	<!-- 비로그인 시 보이는 화면 -->
	<c:if test="${empty sessionScope.SID}">
	<div class="topHeader__column">
       	<!-- 로그인 창 -->
       	<form class="topHeader__loginform" method="POST" action="/www/loginProc.jeju" id="loginFrm" name="loginFrm">
       	    <input class="topHeader__input" type="text" placeholder="회원아이디" name="id" id="id">
       	    <input class="topHeader__input" type="password" placeholder="비밀번호" name="pw" id="pw">
       	 	<!-- 로그인 버튼 -->
       	 	<div class="topHeader__loginBtn topHeader__btn w3-button" id="loginbtn">로그인</div>
       	 	<!--  회원가입 버튼 -->
       		<div class="topHeader__joinBtn topHeader__btn w3-button" id="member">
       	 		<a href="/www/member/memberJoin.jeju">회원가입</a>
       		</div>
       	</form>   
    </div>
	</c:if>
	<!-- 로그인 시 보이는 화면 -->
	<c:if test="${not empty sessionScope.SID}">
    <div class="topHeader__column">
    	<div class="topHeader__logoutForm">
	       	<!-- 내 정보보기 -->
	       	<div class="logoutForm_LeftCol logoutForm__Col">
		       	<div class="topHeader__welcomeId">[  ${sessionScope.SID}  ] </div>
		       	<div class="topHeader__welcome">님 방문을 환영합니다</div>
	       	</div>	       	
	       	<div class="logoutForm_RightCol logoutForm__Col">
	      		<div class="topHeader__btn w3-button w3-card" id="recomBtn"> 계절별 장소 </div>
	       		<div class="topHeader__btn w3-button w3-card" id="chatBtn"> 채팅서비스 </div>
	      		<div class="topHeader__btn w3-button w3-card" id="suggestBtn"> 어디로 갈까?</div>
	      		<div class="topHeader__btn w3-button w3-card" id="favoritBtn"> 찜 모아보기</div>
		       	<div class="topHeader__btn w3-button w3-card" id="logoutbtn">로그아웃</div>
	      		<div class="topHeader__btn w3-button w3-card" id="infoBtn"> 내 정보보기 <i class="fas fa-user-cog"></i></div>
	       	</div>
    	</div>
    </div>
</c:if>
</div>
<form method="POST" action="/www/member/memberInfo.jeju" id="frm" name="frm">
	<input type="hidden" name="id" value="${SID}">
</form>
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 	본문 내용					 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->

	<div class="w3-content mw800">
		<!-- top -->
		<div class="w3-col w3-center w3-card-4">
			<!-- 타이틀 -->
			
		<div class="w3-center">
			<button class="hbtn" style="float:right" type="button">Home</button>
			<h2 class="w3-sand w3-padding title">${SID} 님의 찜 목록 </h2>
		</div>	
			
			<!-- 메뉴 -->
			<div class="w3-col">
	<c:if test="${not empty SID}">
				<div class="m1 w3-deep-orange w3-hover-pink w3-button sbtn"  
					id="sbtn1">관광모아보기</div>
				<div class="m1 w3-orange w3-hover-red w3-button sbtn"  
					id="sbtn2">숙박모아보기</div>
				<div class="m1 w3-yellow w3-hover-lime w3-button sbtn"  
					id="sbtn3">식당모아보기</div>
				<div class="m1 w3-green w3-hover-teal w3-button sbtn"  
					id="sbtn4">병원모아보기</div>
				<div class="m1 w3-blue w3-hover-aqua w3-button sbtn" 
					id="sbtn5">응급모아보기</div>
				<div class="m1 w3-gray w3-hover-black w3-button sbtn" 
					id="sbtn6">전체보기</div>

	</c:if>
				<!-- <div class="w3-rest" style="opacity: 0.7; height: 39px;"> </div> -->
			</div>
		</div>

		<!-- 게시글리스트 -->
		<div class="w3-col w3-margin-top w3-padding w3-card-4">
			<div class="w3-col w3-center w3-border w3-margin-top">
				<div class="w3-col m3 w3-light-grey w3-border-right">장소이름</div>
				<div class="w3-col m6 w3-light-grey w3-border-right">장소경로</div>
				<div class="w3-col m3 w3-light-grey w3-border-right">전화번호</div>
			</div>
			<div class="w3-col w3-border-left w3-border-bottom w3-margin-bottom">
				<c:forEach var="data" items="${LIST}">
					<div class="w3-col m3 w3-border-right txt">${data.aname}</div>
					<div class="w3-col m6 w3-border-right txt">${data.aloc}</div>
					<div class="w3-col m3 w3-border-right txt">${data.atel}</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html> 