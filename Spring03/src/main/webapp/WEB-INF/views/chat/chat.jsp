<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 서비스</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/cls.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/component/topHeader.css">
<link rel="stylesheet" type="text/css" href="css/chat/chat.css">
<script defer type="text/javascript" src="js/chat/chat.js"></script>
<script type="text/javascript" src="js/component/topHeader.js"></script>
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
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 	채팅창			 	#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->

	<section class="chatBody">
		<div class="chat">
			<div class="chat__welcome">
				<span class="chat__welcome-font">제주 꿀맵 채팅방</span>
				<span>여행 정보를 공유하세요!</span>
			</div>
			<input type="hidden" id="id" value="${SID}">
			<div class="chat__body">
				<div class="chat__area" id="chatarea"></div>
				<input type="text" id="message" />
			</div>
			<div class="chat__btn">
				<div class="chat__exit w3-button " id="exit" >HOME</div>
				<div class="chat__send w3-button " id="send" >보내기</div>
			</div>
		</div>
	</section>
</body>

</html>