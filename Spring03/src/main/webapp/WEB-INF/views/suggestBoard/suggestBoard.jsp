<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디로 갈까?</title>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css">
<link rel="stylesheet" type="text/css" href="/www/css/suggestBoard/suggestBoard.css" />
<link rel="stylesheet" type="text/css" href="css/cls.css">
<link rel="stylesheet" type="text/css" href="css/main/mainPage.css">
<link rel="stylesheet" type="text/css" href="css/component/topHeader.css">
<script type="text/javascript" src="/www/js/jquery-3.5.1.min.js"></script> 
<script type="text/javascript" src="/www/js/suggestBoard/suggestBoard.js"></script>
<script type="text/javascript" src="/www/js/detailBoard.js"></script>
<script type="text/javascript" src="/www/js/component/topHeader.js"></script>
<script type="text/javascript" src="/www/js/memberLogin.js"></script>
<link rel="stylesheet" type="text/css" href="/www/css/main/mainPage.css">
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
<form method="POST" action="/www/member/memberInfo.jeju" id="frm" name="frm">
	<input type="hidden" name="id" value="${SID}">
</form>


   <nav>
      <div class="header-bar">
         <div class="header-bar__column btn header-bar__mainBtn w3-button" id="goToMain">
            메인으로
         </div>
         <div class="header-bar__column header-bar__listBtn">
            <select id="selectedList">
               <option value="30">식당</option>
               <option value="10">관광지</option>
               <option value="20">숙소</option>
               <option value="all" selected>장소랜덤</option>
            </select>
            <span>을 추천해주세요</span>
         </div>
      </div>
   </nav>
   
   <section>
      <div class="suggest w3-card-4">
         <div class="suggest__body">
            <div class="suggest__number suggest__text" style="height: 30%!important">
               <span>오늘의~ 행운 번호는&nbsp;&nbsp;</span>
               <span id=luckyNo></span>
            </div>
            <div class="suggest__menu suggest__text">
               <div class="suggest__menu__box">
                  <span class="suggest__menu__name">추천장소 뽑기를 누르세요!</span>
                  <div style="width:100%; height:0.3px; background-color: gray"></div>
                  <span class="suggest__menu__loc"></span>
                  <form action="/www/main.jeju" method="GET" id="detailForm">
	                  <input type="hidden" name="ax" id="ax" value="0">
	                  <input type="hidden" name="ay" id="ay" value="">
                  </form>
               </div>
               <span id="abody" style="font-size: 14px; margin-top:10px;"></span>
            </div>
         </div>
         <div class="ipad__button"></div>
      </div>
      <div class="lower-bar">
         <div class="lower-bar__ranBtn w3-button btn w3-card" id="getSuggestBtn">
            <span>추천장소 뽑기</span>
         </div>
         <div class="lower-bar__mapBtn w3-button btn w3-card" id="showDetailBtn">
            <span>장소 자세히보기</span>
         </div>
      </div>
      
   </section>
</body>
</html>