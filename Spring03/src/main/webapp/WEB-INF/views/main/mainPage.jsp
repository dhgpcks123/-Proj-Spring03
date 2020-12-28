<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/cls.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/main/mapStyle.css">
<link rel="stylesheet" type="text/css" href="css/detailBoard/detailBoard.css">
<link rel="stylesheet" type="text/css" href="css/main/mainPage.css">
<link rel="stylesheet" type="text/css" href="css/component/topHeader.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0997e0901ce72cd4e333dc4602ad8e94&libraries=services"></script>
<script type="text/javascript" src="/www/js/detailBoard.js"></script>
<script type="text/javascript" src="/www/js/component/topHeader.js"></script>
<script type="text/javascript" src="/www/js/memberLogin.js"></script>
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

<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#				  사이드패널 					#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<nav class="w3-sidebar w3-collapse w3-animate-left" style="z-index: 3; width: 400px;" id="mySidebar">
	<!-- 헤더 : 자세히보기 -->
	<header style="text-align: right;">
		<a href="javascript:void(0)" class="w3-bar-item w3-button w3-button" style="font-size: 10pt;" onclick="document.getElementById('id01').style.display='block'">
			<span>
				<Strong>> 자세히 보기 </Strong><i class="fas fa-info-circle"></i>
			</span>
		</a>
	</header>
	<!-- 본문 : 기본정보 -->
	<section style="margin-left: 4px;">
		<!-- 타이틀 & 이미지 -->
		<div>
			<!--  title  -->
			<div class="Panel__title">
				<h2 class="w3-center" style="margin-top: 15px; margin-bottom: 30px;">
					<i class="fas fa-store-alt"></i><strong> ${STORE.get(0).aname}</strong>
				</h2>
			</div>
			<!--  slide img -->
			<ul class="slides">
			<c:forEach var="data" items="${STORE}" varStatus="status">
				<input type="radio" name="radio-btn" id="img-${5-status.count}" checked />
				<li class="slide-container">
					<div class="slide">				
						<img src="img/area/${data.aponame}" />
					</div>
					<div class="nav">
						<label for="img-${5-status.count-1}" class="prev">&#x2039;</label>
						<label for="img-${5-status.count+1 }" class="next">&#x203a;</label>
					</div>
				</li>
			</c:forEach>
			</ul>
           </div> 
           
        <!-- 사이드패널 가게정보 -->
		<div class="tbFont" style="font-size: 9pt;  padding-left: 15px; margin-top: 15px;">
			<!-- location bar -->
            <b>현재 위치</b> 
            <div id="text" style="font-size: 9pt;">지도를 클릭하세요</div>
            <div style="font-size: 9pt; margin-top: 15px;">
              		<b>장소 주소</b><br/> ${STORE.get(0).aloc}
           	</div><br/> 
			<!-- 전화 번호 -->
			<div style="font-size: 9pt; ">
				<i class="fas fa-phone-volume"></i> ${STORE.get(0).atel}
			
			<!-- SOS -->
			<c:if test="${STORE.get(0).atno==40 || STORE.get(0).atno==50}">
				<span class="sos">
					<a href='tel:${STORE.get(0).atel}'>
						<img src="/www/img/member/sos.png" alt="sos 전화 걸기">
					</a>
				</span>	
			</c:if>	
			</div>
			
			
			<!-- 가게 소개 -->
			<div class="tbFont" style="border-top: 1px dashed gray; border-bottom: 1px dashed gray; padding: 15px 30px; margin: 30px 5px 15px 5px;">
				<div>
					<i class="fas fa-info-circle"></i> ${STORE.get(0).abody}
				</div>
			</div>
		</div>
		
		<!-- 사이드패널 최근리뷰 -->
		<div class="tbFont" style="padding: 15px; margin-top: 30px;">
			<div style="text-align: center; margin-bottom: 9px; background-color: #ffcd36;">이 가게의 가장 최근리뷰</div>
			<div style="padding: 5px; margin-bottom: 10px; border: 0.1px dashed #008080; border-radius: 5px; background-color: rgba(255, 205, 54, 0.05);">
				<!-- 리뷰 타이틀 및 본문 -->
				<div style="display: block; font-size:14pt">${REVIEW.get(0).rtitle}</div>
				<div style="display: block; font-size: 7pt;">${REVIEW.get(0).rdate}</div>
				<!-- 리뷰 별점 -->
				<div style="margin-bottom: 5px; display:block; text-align:right; text-shadow:1px 1px 0 #444; color:yellow; font-size:16pt;">
					<c:if test="${REVIEW.get(0).rgrade==5}">★★★★★</c:if>
					<c:if test="${REVIEW.get(0).rgrade==4}">★★★★☆</c:if>
					<c:if test="${REVIEW.get(0).rgrade==3}">★★★☆☆</c:if>
					<c:if test="${REVIEW.get(0).rgrade==2}">★★☆☆☆</c:if>
					<c:if test="${REVIEW.get(0).rgrade==1}">★☆☆☆☆</c:if>
					<span style="color:black;">[${REVIEW.get(0).rgrade}/5]</span>
				</div>
				<!-- 리뷰 사진 -->
				<div class="w3-col" style="margin-bottom: 30px;">
					<div>
					<c:forEach var="data" items="${REVIEW.get(0).rphotovoList}">
					<c:if test="${REVIEW.get(0).rno == data.rno}">
						<img class="w3-col m6 l6 s6 reviewIMG" src="img/review/${data.rponame}"></img>
					</c:if>
					</c:forEach>
					</div>
				</div>
				<!-- 리뷰 본문 -->
				<div class="tbFont" style="padding: 3px; margin-top: 5px;">${REVIEW.get(0).rbody}</div>
			</div>
		</div>
	</section>
	
	<!-- 푸더 : 후기 더 보기 -->
	<footer>
		<div class="w3-right tbFont" style=" margin-bottom: 130px;  margin-top :15px">
			<a href="javascript:void(0)" class="w3-bar-item" style="font-size: 10pt;" onclick="document.getElementById('id01').style.display='block'">
				<Strong>> 후기 더보기.. </Strong>
			</a>
		</div>
	</footer>
</nav>


<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 		모달 창 		 			#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!-- 모달 창 연결 버튼 -->
<a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)" class="w3-bar-item w3-button"></a>
<!-- 모달 창 틀 -->
<div id="id01" class="w3-modal w3-border" style="z-index: 4; padding-top: 4%;">
	<!-- x 아이콘 -->
	<div class="w3-panel"
		style="position: fixed; z-index: 999; top: 1%; right: 6%">
		<div class="w3-section w3-right">
			<a class="w3-button w3-red" id="xbutton"><i class="fa fa-remove"></i></a>
		</div>
	</div>
	<!-- 모달창 내부 -->
	<div class="w3-modal-content w3-animate-zoom" id="cModal" style="width: 87%; height: 90%; overflow: auto;">
		<div>
			<div>
				<!-- 가게 이름 -->
				<div style="margin-left: 80px; margin-top: 18px;">
					<div style="font-size: 40pt; color: red; display: inline-block; margin-right: 10px;">
						<i class="fas fa-store-alt"></i>
					</div>
					<div style="font-size: 35pt; display: inline-block;">
						<Strong> ${STORE.get(0).aname} </Strong>
					</div>
				</div>
				<!-- 가게 기본 정보 -->
				<div style="margin-left: 80px;">
					<div style="color: red; display: inline-block;">
						<i class="fas fa-map-marker-alt"></i>
					</div>
					<div style="color: gray; display: inline-block;">${STORE.get(0).aloc}</div>
					<div style="color: gray; font-size: 8pt; margin-left: 15px;">
						전화번호 : <span>${STORE.get(0).atel}</span>
					</div>
				</div>
			
				<div>
					<!-- 상단 아이콘버튼 -->
					<nav style="padding: 0px; margin: 30px; border-top: 1px solid #ECEAEB; border-bottom: 1px solid #ECEAEB;">
						<div style="display: flex; justify-content: space-evenly;">
							<div class="w3-button" style="font-size: 15pt;">
								<i class="fas fa-map-marked-alt"></i> 경로 찾기
							</div>
							<div class="w3-button" style="font-size: 15pt;">
								<i class="fas fa-pencil-alt"></i><a href="#wReviewfrm"> 리뷰 쓰기</a>
							</div>
					<c:if test="${empty sessionScope.SID}">
							<div class="w3-button" style="font-size: 15pt;" id="nonLogfavor" name="${STORE.get(0).ano}">
								<i class="far fa-bookmark"></i> 찜 하기
							</div>
					</c:if>
					<c:if test="${not empty sessionScope.SID}">
							<div class="w3-button" style="font-size: 15pt;" id="favor" name="${STORE.get(0).ano}">
								<i class="far fa-bookmark"></i> 찜 하기
							</div>
					</c:if>
						</div>
					</nav>
					<!-- 슬라이드 이미지 -->
					<div id="wrapper">
						<!-- 가게 이미지 -->
						<div class="w3-round-xxlarge" id="slider-wrap">
							<ul id="slider">
							<c:forEach var="data" items="${STORE}">
								<li>
									<a href="img/review/${data.aponame}">
										<img class="StoreIMG w3-padding-right" src="img/review/${data.aponame}" >
									</a>
								</li>
							</c:forEach>	
							</ul>

							<!-- 슬라이드 controls-->
							<div class="btns" id="next">
								<i class="fa fa-arrow-right"></i>
							</div>
							<div class="btns" id="previous">
								<i class="fa fa-arrow-left"></i>
							</div>
							<div id="counter"></div>
							<!-- 슬라이드 point -->
							<div id="pagination-wrap">
								<ul>
									<li></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 사용자 리뷰 데이터 -->
					<section style="display: flex; flex-direction: column; border-top: 1px solid #ECEAEB; margin: 50px 40px 0px 60px;" id="wReviewSuccess">
					<c:forEach var="data" items="${REVIEW}">
					<div style="border-bottom:1px solid #ECEAEB; padding-bottom: 20px;" id="Review${data.rno}">
						<!-- 리뷰 타이틀 & 평점-->
						<div style="background-color: #F6F6F6; margin-top: 10px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
							<h3 style="cursor: pointer; margin-top: 15px;">${data.rtitle}</h3>
							<h3	style="color: yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">
								<c:if test="${data.rgrade==5}">★★★★★</c:if>
								<c:if test="${data.rgrade==4}">★★★★☆</c:if>
								<c:if test="${data.rgrade==3}">★★★☆☆</c:if>
								<c:if test="${data.rgrade==2}">★★☆☆☆</c:if>
								<c:if test="${data.rgrade==1}">★☆☆☆☆</c:if>
							</h3>
						</div>
						<!-- 리뷰 작성자 아이디 및 작성일 -->
						<div class="tbFont" style="display: flex; border-bottom: 1px solid  #ECEAEB; padding-right: 20px;">
							<div style="margin-left: 45px;">작성자 :</div>
							<div>${data.id}</div>
							<div style="margin-left: 45px;">작성일 :</div>
							<div>${data.rdate }</div>
							<div style="margin-left: 45px;">조회수 :</div>
							<div>${data.rhit}</div>
						</div>
						<!-- 리뷰 본문글 및 사진 -->
						<div class="tbFont" style="margin-bottom: 10px;">
							<!-- 본문 글 -->
							<div style="margin-top: 20px; padding-right: 33px; display: inline-block;">
								${data.rbody}
							</div>
							<!-- 리뷰 사진 -->
							<div style="display: flex; flex-wrap: wrap; justify-content: flex-start; margin-bottom: 20px;" id="img${data.rno}">
							
							<c:forEach var="data1" items="${REVIEW.get(0).rphotovoList}">
							<c:if test="${data.rno == data1.rno}">
								<div style="position: relative;">
									<img class="reviewIMG reviewIMG${data.rno}" id="${data1.pno}" src="img/review/${data1.rponame}"></img>
									<div class="w3-button w3-amber delImg delImg${data.rno} " id="delImg${data.rno}"style="display: none; position: absolute; top:110px; right: 5px;">사진삭제</div>
								</div>								
							</c:if>
							</c:forEach>
							</div>
							
							<!-- 리뷰 삭제 버튼 -->
							<c:if test="${data.id==sessionScope.SID}">
							<div style="display: flex; justify-content:flex-end;">
								<div class="reviewDelbtn" style="padding-right: 13px; cursor: pointer; display: inline-block;" id="del${data.rno}">삭제 <i class="far fa-trash-alt"></i></div>
							</div>
							</c:if>
							<!-- 리뷰 수정 버튼 -->
							<c:if test="${data.id==sessionScope.SID}">
							<div style="display: block">
								<div class="w3-right reviewRebtn" style=" padding-right: 10px; cursor: pointer; display: inline-block;" id="${data.rno}"> 수정 <i class="far fa-edit"></i></div>
							</div>
								
								<form style="display: none;" class="RewriteForm tbFont" method="POST" encType="multipart/form-data" id="fr${data.rno}">
									<!-- 별점주기 -->
									<div class="starRev w3-right" style="display: inline-block; margin-left: 15px;">
										<p class="star_Regrade" id="star_Regrade">
											<a href="#" class="Rebyul1" id="Rebyul1${data.rno}">★</a> <a href="#"  class="Rebyul2" id="Rebyul2${data.rno}">★</a> <a href="#"  class="Rebyul3" id="Rebyul3${data.rno}">★</a>
											<a href="#" class="Rebyul4" id="Rebyul4${data.rno}">★</a> <a href="#"  class="Rebyul5" id="Rebyul5${data.rno}">★</a>
										</p>
									</div>
									<!-- 글쓰기 데이터 넘기기 input 태그 -->
									<input type="hidden" id="RewriteRid" name="id" value="${SID}">
									<input type="hidden" class="RewriteRgrade${data.rno}" id="RewriteRgrade" name="rgrade">
									<input type="hidden" id="RewriteRx" name="ax" value="${REVIEW.get(0).rx}">
									<input type="hidden" id="RewriteRy" name="ay" value="${REVIEW.get(0).ry}">
									<input type="hidden" id="RewriteRtno" name="rtno" value="${STORE.get(0).atno}">
									<input type="hidden" id="RewriteRno${data.rno}" name="rno" value="">
									<!-- 글쓰기 제목 -->
									<input type="text" placeholder="글 제목" style="margin-top: 40px; border: none; padding: 5px; border-top: 1px solid gray;" name="rtitle" id="rewriteRtitle${data.rno}" value="${data.rtitle}">
									<!-- 글쓰기 본문 -->
									<textarea style="width: 100%; height: 200px; margin-bottom: 5px; padding: 20px;" id="rewriteRbody${data.rno}" name="rbody">${data.rbody}</textarea>
									<!-- 글쓰기 버튼 '리뷰 작성' -->
									<div class="w3-button w3-amber w3-right rewriteBtn" id="rewriteBtn${data.rno}"style="margin-bottom: 30px; width: 150px;">작성</div>
									<div class="w3-button w3-amber w3-right rewriteCancelBtn" id="rewriteCancelBtn${data.rno}" style="margin-bottom: 30px; width: 150px;">취소</div>
									<div class="w3-button w3-amber w3-right rewriteResetBtn" id="Reset${data.rno}" style="margin-bottom: 30px; width: 150px;">내용 지우기</div>
									<!-- 글쓰기 file 추가 -->
									<div>
										<input type="file" style="display: inline-block; width: 500px;" class="reFile1" name="file">
										<input type="file" style="display: none; width: 500px;" class="reFile2" name="file">
										<input type="file" style="display: none; width: 500px;" class="reFile3" name="file">
										<input type="file" style="display: none; width: 500px;"	class="reFile4" name="file">
									</div>
							</form>
							</c:if>
						</div>
					</div>	
					</c:forEach>
					</section>
					<!--  사용자 리뷰 글쓰기 -->
					<footer style="display: flex; flex-direction: column; margin-top: 50px; margin-left: 60px; margin-right: 40px;">
						<form class="tbFont" method="POST" encType="multipart/form-data" action="/www/wReviewProc.jeju" id="wReviewfrm" name="wReviewfrm">
						<!-- 비 로그인 시 -->
						<c:if test="${empty sessionScope.SID}">
							<div style="margin: 30px;">*로그인 하셔야 리뷰를 작성할 수 있습니다</div>
						</c:if>
						<c:if test="${not empty sessionScope.SID}">
						<!-- 로그인 시 -->
							<div class="starRev w3-right" style="display: inline-block; margin-left: 15px;">
								<!-- 별점주기 -->
								<p id="star_grade">
									<a href="#" id="byul1">★</a> <a href="#" id="byul2">★</a> <a href="#" id="byul3">★</a>
									<a href="#" id="byul4">★</a> <a href="#" id="byul5">★</a>
								</p>
							</div>
							<!-- 글쓰기 데이터 넘기기 input 태그 -->
							<input type="hidden" id="reviewId" name="id" value="${SID}">
							<input type="hidden" id="reviewStar" name="rgrade">
							<input type="hidden" id="reviewX" name="ax" value="${REVIEW.get(0).rx}">
							<input type="hidden" id="reviewY" name="ay" value="${REVIEW.get(0).ry}">
							<input type="hidden" name="rx" value="${REVIEW.get(0).rx}">
							<input type="hidden" name="ry" value="${REVIEW.get(0).ry}">
							<input type="hidden" id="reviewRtno" name="rtno" value="${STORE.get(0).atno}">
							
							<!-- 글쓰기 제목 -->
							<input type="text" placeholder="글 제목" style="margin-top: 40px; border: none; padding: 5px; border-top: 1px solid gray;" name="rtitle" id="reviewTitle">
							<!-- 글쓰기 본문 -->
							<textarea style="width: 100%; height: 200px; margin-bottom: 5px; padding: 20px;" id="reviewBody" name="rbody"></textarea>
							<!-- 글쓰기 버튼 '리뷰 작성' -->
							<div class="w3-button w3-amber w3-right" id="wsend" style="margin-bottom: 30px; width: 150px;">리뷰 작성</div>
							<!-- 글쓰기 file 추가 -->
							<div>
								<input type="file" style="display: inline-block; width: 500px;" id="file1" name="file">
								<input type="file" style="display: none; width: 500px;" id="file2" name="file">
								<input type="file" style="display: none; width: 500px;" id="file3" name="file">
								<input type="file" style="display: none; width: 500px;"	id="file4" name="file">
							</div>
						</c:if>
						</form>
					</footer>
				</div>
			</div>
		</div>
	</div>
</div>


<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#			 		메인 본문화면 	 			#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!-- Page content -->
<div class="w3-main" style="margin-left: 420px;">
    <!-- 주소 정보 -->
	<div class="map_wrap2">
		<div class="hAddr">   
	        <span class="title" style="color:black!important;">주소 정보</span>
	        <span id="centerAddr" style="color:black!important;"></span>
    	</div>
    	
    </div>
    <!-- 카카오 맵 API -->
    <div class="map_wrap">
		<!-- 지도를 표시할 div 입니다 -->
        <div id="map" style="width:97%; height:610px; position:relative; overflow:hidden"></div>
	    <div style="margin-right: 33px; display:flex; justify-content:flex-end;">
			<input id="btnStart" type="button" value="실시간 위치 추적" />
	        <input id="btnStop" type="button" value="지속적인 추적 종료" />
		</div>
	    <!-- 검색창 -->
        <div id="menu_wrap" class="bg_white" style="margin-left: 15px; margin-top: 15px;">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;"> 키워드 :
						<input type="text" value="" id="keyword" size="15"/> 
						<button type="submit">검색하기</button> 
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
			
		</div>

	</div>
	<!-- x, y값 넘기기 폼 태그 -->
	<!-- 해당 폼은 지도마커 클릭 시 패널을 불러오기 위해 제작 된 폼 태그 -->
	<form method="GET" action="/www/main.jeju" id="mfrm" name="mfrm">
		<input type="hidden" name="ax" id="ax" value="${MAPx}">
		<input type="hidden" name="ay" id="ay" value="${MAPy}">
	</form>   
</div>


<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<!--	#				카카오 맵 관련 Script			#	-->
<!--	▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼	-->
<script>
/* ############################## 1. 지도 마크 표시 ############################## */
	var startx = document.getElementById('ax').value;
	var starty = document.getElementById('ay').value;
	
	// 좌표 요청 없을 시 기본 값 셋팅
	if(!(startx || starty)){
		startx = 33.42437961506556;
		starty = 126.93110026765497;
	};
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(startx, starty), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와 지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	$.ajax({
		url: '/www/markerlist.jeju',
		type: 'POST',
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(positions){
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			for (let i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new kakao.maps.LatLng(positions[i].x, positions[i].y), // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지
		    });
			// 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].title // 인포윈도우에 표시할 내용
		    });
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				let ax = JSON.stringify(positions[i].x);
				let ay = JSON.stringify(positions[i].y);
				var x = ax.substring(1, ax.length-1).trim();
				var y = ay.substring(1, ay.length-1).trim();
				$('#ax').val(x);
				$('#ay').val(y);
				$('#mfrm').submit();
			});
			}
		},
		error: function(){
			alert('### marklist 통신 에러 ###');
		}
	});
	
	// 변경
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
		// 지도 중심좌표에 마커를 생성합니다 
		position: map.getCenter() 
	}),infowindow = new kakao.maps.InfoWindow({zindex:1}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    var resultDiv = document.getElementById('clickLatlng'); 	    
	});
		
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	
/* ############################## 2. 클릭시 주소 보기 ############################## */
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '도로명주소 : ' + result[0].road_address.address_name + '<br />' : '';
	            detailAddr += '지번 주소 : ' + result[0].address.address_name;
	            
	            document.getElementById("text").innerHTML = detailAddr;
	           
	           
	            var content = '<div class="bAddr">' +
	                            '<span class="title"> 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
	                        
	                                      
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
 
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}
	
	
/* ############################## 3. 지도 검색 기능 ############################## */
	//마커를 담을 배열입니다
	var markers = [];
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	    var keyword = document.getElementById('keyword').value;
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        return false;
	    }
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	    } else if (status === kakao.maps.services.Status.ERROR) {
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	        fragment.appendChild(itemEl);
	    }
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	    el.innerHTML = itemStr;
	    el.className = 'item';
	    return el;
	}
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	/* ############################## 4. 내 위치 ############################## */
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) {
	 
	    // 실시간 위치 추적 버튼 클릭시에만 동작합니다
	     $('#btnStart').click(function() {
	    
	    	// GeoLocation을 이용해서 지속적으로 접속 위치를 얻어옵니다
		    var id = navigator.geolocation.watchPosition(function(position) {
			    	
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			         // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			         // 인포윈도우에 표시될 내용입니다
			        var locPosition = new kakao.maps.LatLng(lat, lon), 
			            message = '<div style="padding:5px;">현재 내 위치에요 :-)</div>'; 
			        
			        // 마커와 인포윈도우를 표시합니다
			        displayMarker(locPosition, message);
			        
		      });
		 	 // 버튼 클릭시 지속적인 위치 추적을 중지합니다. (새로운 위치를 검색하지 않는다.)
	         $('#btnStop').click(function() {
	              navigator.geolocation.clearWatch(id);
	         });
	     });  
	} else { 
		// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요.'
	        
	    displayMarker(locPosition, message);
	}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
	</script>
</body>
</html>