<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recommend Location</title>

<link rel="stylesheet" type="text/css" href="/www/css/w3.css">
<link rel="stylesheet" type="text/css" href="/www/css/cls.css">
<link rel="stylesheet" type="text/css" href="/www/css/recommend/recom.css">
<link rel="stylesheet" type="text/css" href="/www/css/component/topHeader.css">
<script type="text/javascript" src="/www/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/www/js/component/topHeader.js"></script>
<script type="text/javascript" src="/www/js/recommend.js"></script>
<script src="https://kit.fontawesome.com/e6e9b86680.js"></script>
</head>
<body>
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 	메인 상단 헤더 부분			 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<div class="topHeader">
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
				       		<div class="topHeader__dot"></div>
				        </div>
				       	<div class="topHeader__eye2 eye">
				    	   	<div class="topHeader__dot"></div>
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

	<div class="w3-center">
		<button class="hbtn" style="float:right" type="button">Home</button>
		<h2 class="w3-light-gray w3-padding title">계절별 장소 추천 & 코로나 사진 여행 </h2>
	</div>	
	<div class="w3-center w3-margin-top">
		<div class="w3-third w3-center w3-padding">
			<button type="button" id="sbtn">
				<img src="/www/img/area/spring.jpg" class="imgbox" alt="봄"><strong>spring</strong>
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button" id="mbtn">
				<img src="/www/img/area/summer.jpg" class="imgbox" alt="여름"><strong>summer</strong>
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button"  id="fbtn">
				<img src="/www/img/area/fall.jpg" class="imgbox" alt="가을"><strong>fall</strong>
			</button>
		</div>
		<div class="w3-third w3-center w3-padding locfr">
			<button type="button" id="wtbtn">
				<img src="/www/img/area/winter.jpg" class="imgbox" alt="겨울"><strong>winter</strong>
			</button>
		</div>
		<div class="w3-third w3-center w3-padding">
			<button type="button" id="abtn">
				<img src="/www/img/area/always.jpg" class="imgbox" alt="사계절내내"><strong>always</strong>
			</button>
		</div>
	</div>
</body>
</html>