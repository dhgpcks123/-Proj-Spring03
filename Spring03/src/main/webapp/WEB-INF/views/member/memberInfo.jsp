<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css">
<link rel="stylesheet" type="text/css" href="/www/css/cls.css">
<script type="text/javascript" src="/www/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/www/js/member/info.js"></script>
</head>
<body>
	<div class="w3-content w3-center mw700">
		<h1 class="w3-teal w3-card-4">[ ${DATA.mname} ] 님 회원 정보</h1>
		<div class="w3-col w3-border-bottom pdb10">
			<span class="w3-cell m2 w3-button w3-small w3-green w3-hover-lime w3-left mt0 btnBox" id="hbtn">Home</span>
			<span class="w3-cell m2 w3-button w3-small w3-orange w3-hover-deep-orange w3-right mt0 btnBox" id="iebtn">정보수정</span>
			<span class="w3-cell m2 w3-button w3-small w3-red w3-hover-pale-red w3-right mt0 btnBox" id="dbtn">탈 퇴</span>
		</div>
		<form method="POST" action="/www/member/memberDel.jeju" 
				id="dfrm" name="dfrm" style="display: none;"
				class="w3-col w3-card-4 w3-padding w3-margin-bottom">
			<input type="hidden" name="mno" id="mno" value="${DATA.mno}">
			<label for="pw" class="w3-col m3 w3-text-grey ft18px">비밀번호 : </label>
			<input type="password" id="pw" name="pw" 
					class="w3-col m7 w3-input w3-border">
			<div class="w3-col m2 pdh10">
				<div class="w3-col w3-button w3-medium w3-red w3-hover-orange w3-left mt0" id="del">탈퇴처리</div>
			</div>
		</form>
		<div class="w3-col w3-card-4 w3-margin-top w3-padding">
			<div class="w3-col">

				<div class="w3-rest pdr10">
					<div class="w3-col w3-display-container contBox">
						<div class="w3-col w3-display-middle">
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">회원번호 : </span><span class="w3-twothird w3-center" id="no">${DATA.mno}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">아 이 디 : </span><span class="w3-twothird w3-center">${DATA.id}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">회원이름 : </span><span class="w3-twothird w3-center">${DATA.mname}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">회원메일 : </span><span class="w3-twothird w3-center" id="cMail">${DATA.mail}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">전화번호 : </span><span class="w3-twothird w3-center" id="cTel">${DATA.tel}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">혈 액 형 : </span><span class="w3-twothird w3-center" id="cBl1">${DATA.blood1} 형</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">R	   H : </span><span class="w3-twothird w3-center" id="cBl2">${DATA.blood2}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">생년월일 : </span><span class="w3-twothird w3-center">${DATA.birth}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">긴급연락 : </span><span class="w3-twothird w3-center" id="cSos">${DATA.sos}</span></div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">회원성별 : </span>
								<span class="w3-twothird w3-center">
									<c:if test="${DATA.gen == 'M'}">남 자</c:if>
									<c:if test="${DATA.gen eq 'F'}">여 자</c:if>
								</span>
							</div>
							<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-third w3-right-align">가 입 일 : </span><span class="w3-twothird w3-center">${DATA.joindate}</span></div>
						</div>
					</div>
				</div>
			</div>
		
			<!-- 정보수정태그 -->
			<form class="w3-col" id="frm" name="frm" style="display: none;">
				<input type="hidden" name="id" value="${SID}">
				<div class="w3-col w3-border-top w3-margin-top w3-padding">
					<span class="w3-cell m2 w3-button w3-small w3-blue w3-hover-aqua w3-right mt0 btnBox" id="ebtn">수 정</span>
				</div>
				
				<div class="w3-col">
					<label for="mail" class="w3-col l3 m3 w3-right-align w3-padding clslbl">회원 이메일 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<input type="text" class="w3-input w3-border" id="mail" name="mail" value="${DATA.mail}">
					</div>
				</div>
				<div class="w3-col">
					<label for="mail" class="w3-col l3 m3 w3-right-align w3-padding clslbl">회원 전화번호 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<input type="text" class="w3-input w3-border" id="tel" name="tel" value="${DATA.tel}">
					</div>
				</div>
				<div class="w3-col">
					<label for="mail" class="w3-col l3 m3 w3-right-align w3-padding clslbl">긴급 연락 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<input type="text" class="w3-input w3-border" id="sos" name="sos" value="${DATA.sos}">
					</div>
				</div>


				<div class="w3-col w3-margin-bottom">
					<label class="w3-col l3 m3 w3-right-align w3-padding clslbl">혈액형 선택 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<div class="w3-col " id="bl1fr">
		<c:forEach var="data" items="${LIST1}">
				<div class="w3-quarter w3-center w3-padding">
					<input type="radio" class="w3-col w3-radio-medium blood1" name="blood1" value="${data.blood1}">
						<span class="w3-twothird w3-center chkbl1">${data.blood1}</span>
				</div>
		</c:forEach>	
						</div>
					</div>
				</div>


				<div class="w3-col w3-margin-bottom">
					<label class="w3-col l3 m3 w3-right-align w3-padding clslbl">RH 선택 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<div class="w3-col" id="bl2fr">
		<c:forEach var="data" items="${LIST2}">
				<div class="w3-half w3-center w3-padding">
					<input type="radio" class="w3-col w3-radio-medium blood2" name="blood2" value="${data.blood2}">
						<span class="w3-twothird w3-center chkbl2">${data.blood2}</span>
				</div>
		</c:forEach>	
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 메세지 확인 모달 -->
<c:if test="${not empty MSG}">
		<div id="id01" class="w3-modal" style="display: block;">
		  <div class="w3-modal-content">
	<c:if test="${MSG ne '수정실패'}">		  
			    <header class="w3-container w3-teal">
			      <span onclick="document.getElementById('id01').style.display='none'" 
			      class="w3-button w3-display-topright">&times;</span>
			      <h2>Modal Header</h2>
			    </header>
	</c:if>	
	<c:if test="${MSG eq '수정실패'}">		  
			    <header class="w3-container w3-red">
			      <span onclick="document.getElementById('id01').style.display='none'" 
			      class="w3-button w3-display-topright">&times;</span>
			      <h2>Modal Header</h2>
			    </header>
	</c:if>	
		    <div class="w3-container w3-margin-top w3-margin-bottom">
		      <h4 class="w3-center w3-text-grey w3-margin-top w3-margin-bottom">${MSG}</h4>
		    </div>
		  </div>
		</div>
</c:if>
	</div>
</body>
</html>