<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>winter</title>

<link href="https://fonts.googleapis.com/css?family=Cute Font" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Single Day" rel="stylesheet">
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

<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 			타이틀				 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->

<div class="w3-margin-top w3-center">
	<button class="w3-text-blue-gray hbtn" style="float:left" type="button">Home</button>
	<button class="bbtn" style="float:right" type="button">Back</button>
	<h2 class="w3-light-gray w3-padding title">겨울에 가면 좋은 여행지!</h2>
</div>	

<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 			사진 정보				 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->	
		
	
<div class="w3-margin-top w3-center">
	<c:set var="no" value="${0}" />		
	<c:forEach var="data" items="${STORE}" varStatus="status">
		<c:if test="${data.stno == 400}">
		<c:set var="no" value="${no + 1}" />		
			<!--  title  -->
			<div class="w3-third w3-center w3-padding">
				<div class="w3-title">
					<h2 class="w3-center aname" >
						 <strong>${data.aname}</strong>
					</h2>
					<form action="/www/main.jeju" method="GET" id="detailForm${no}">
			          <input type="hidden" name="ax" id="ax" value="${data.ax}">
			          <input type="hidden" name="ay" id="ay" value="${data.ay}">
			        </form>
					<img src="/area/${data.aponame}" class="season" id="showDetailBtn${no}"/>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<h5 class="w3-margin-top w3-right w3-padding info">사진을 클릭해주세요 :-)</h5>
</div>
</body>
</html>