<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>***** 정보입력  *****</title>
<link rel="stylesheet" type="text/css" href="../css/w3.css">
<link rel="stylesheet" type="text/css" href="../css/member/member.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/memberjoin.js"></script>

</head>
<body>
 	<form method="" action="" id="memberJoinEnd">
<!--  		<input type="hidden">
 	</form>
 	<form action="" id="memberJoinEnd"> -->
		<div class="w3-content w3-center w3-teal w3-container mw400700 radius1">
			<!-- STEP 1  -->
			<div class="w3-padding-64 w3-padding-large" id="step1">
				<h1>회원가입</h1>
				<p class="w3-opacity">STEP 1</p>
			
				<div class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" >
					<div class="w3-col mb10 pb20">
						<span class="input_chk">
							<span class="chk_all">회원은 필수 입력사항에 대해</span><br>
							<span class="chk_all">허위 기재 시 회원가입을 취소할 수 있습니다.</span>
						</span>
					</div>  	
			  
			    	<!-- 아이디  -->
				 	<div class="w3-col pb20">
						<input class="w3-col m8 w3-input w3-padding-16 w3-border" type="text" placeholder="아이디" required id="id" name="id">
						<div class="w3-col m3 w3-red w3-hover-orange w3-button w3-right w3-card w3-padding idck" id="idck">아이디<br>체크</div>
				 		<span class="w3-col w3-center" id="idmsg" style="display: none;"></span>
					</div>
					<!-- 비밀번호  -->
				 	<div class="w3-col  pb20">
						<input class="w3-input w3-padding-16 w3-border" type="password" placeholder="비밀번호" required id="pw" name="pw">
				 		<span class="w3-col w3-center" id="pwmsg" style="display: none;"></span>
					</div>
					<!-- 비밀번호 확인 -->
				 	<div class="w3-col  pb20">
						<input class="w3-input w3-padding-16 w3-border" type="password" placeholder="비밀번호 확인" required id="pw2" name="pw2">
				 		<span class="w3-col w3-center" id="pw2msg" style="display: none;"></span>
					</div>
					<!-- 메일주소 -->
				 	<div class="w3-col  mb10 pb20">
						<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="메일" required id="mail" name="mail">
				 		<span class="w3-col w3-center" id="mailmsg" style="display: none;"></span>
				   	</div>
			
				     <div class="w3-button w3-red w3-left" id="reset1">reset</div>
				     <div class="w3-button w3-yellow w3-right" id="next1">다음</div>
		  		</div>
			</div>
		
			<!-- STEP 2  -->
			<div class="w3-padding-64 w3-padding-large w3-hide" id="step2">
				<h1>회원가입</h1>
				<p class="w3-opacity">STEP 2</p>
				<div class="w3-container w3-card w3-padding-32 w3-white w3-animate-left">
					<div class="w3-col mb10 pb20">
							
						<span class="input_chk">
							<span class="chk_all">회원은 가입시 실명으로 가입해야 합니다.</span><br>
							<span class="chk_all">필수 입력사항에 대해</span><br>
							<span class="chk_all">허위 기재 시 회원가입을 취소할 수 있습니다.</span>
						</span>
					</div>  	
					   
					<!-- 이름  -->
					<div class="w3-col  pb20">
						<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="이름" name="mname" required id="mname">
						<span class="w3-col w3-center" id="namemsg" style="display: none;"></span>
					</div>
					<!-- 생년월일  -->
					<div class="w3-col brith pb20">
						<input class="w3-third  w3-input w3-padding-16  w3-border" type="number" name="year" id="year" value="1988" min="1900", max="2020">
						<input class="w3-third  w3-input w3-padding-16  w3-border" type="number" name="mouth" id="mouth" value="6" min="1", max="12">
						<input class="w3-third  w3-input w3-padding-16  w3-border" type="number" name="day" id="day" value="15" min="1", max="31">
					</div>
					<!-- 전화번호 -->
					<div class="w3-col pb20">
						<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="숫자만 입력하세요." required id="tel" name="tel">
						<span class="w3-col w3-center" id="telmsg" style="display: none;"></span>
					</div>
					<!-- 본인성별 -->
					<div class="w3-col w3-center pb20">
						<div class="w3-col l12 m12 w3-padding">
							<div class="w3-half">
								<input type="radio" class="w3-radio-medium gen" id="genM" name="gen" value="M"><span>&nbsp;남 자</span>
							</div>
							<div class="w3-half">
								<input type="radio" class="w3-radio-medium gen" id="genF" name="gen" value="F"><span>&nbsp; 여 자</span>
							</div>
						</div>
					</div>
					
					<div class="w3-button w3-yellow w3-left "id="pre2">이전</div>
				    <div class="w3-button w3-red w3-left" id="reset2">reset</div>
					<div class="w3-button w3-yellow w3-right" id="next2">다음</div>
				</div>
			</div>
			
			<!-- STEP 3  -->
			<div class="w3-padding-64 w3-padding-large w3-hide" id="step3">
				<h1>회원가입</h1>
				<p class="w3-opacity">STEP 3</p>
				<div class="w3-container w3-card w3-padding-32 w3-white w3-animate-left">
					<div class="w3-col mb10 pb20">
						<span class="input_chk">
							<span class="chk_all">응급알리미 서비스를 위한 항목입니다.</span><br>
							<span class="chk_all">입력사항에 대해 모르는 경우에는</span><br>
							<span class="chk_all">빈칸으로 놔두시기 바랍니다.</span>
						</span>
					</div>  	
						   
					<!-- 혈액형  -->
					<div class="w3-col  pb20">
						<span class="w3-col m12 w3-border" id="blood"  >혈액형</span>
						<div class="w3-col m5 mt5  w3-border w3-left">
							<input type="radio" class="w3-radio-medium ph" id="phP" name="ph" value="plus"><span>&nbsp;RH+</span><br>
							<input type="radio" class="w3-radio-medium ph" id="phM" name="ph" value="minus"><span>&nbsp;RH-</span>
						</div>
						<div class="w3-col m5 mt5 w3-border w3-right">
							<input type="radio" class="w3-radio-medium abo" id="aboA" name="abo" value="A"><span>&nbsp;A</span>
							<input type="radio" class="w3-radio-medium abo" id="aboB" name="abo" value="B"><span>&nbsp;B</span><br>
							<input type="radio" class="w3-radio-medium abo" id="aboAB" name="abo" value="AB"><span>&nbsp;AB</span>
							<input type="radio" class="w3-radio-medium abo" id="aboO" name="abo" value="O"><span>&nbsp;O</span>
						</div>
					</div>
					<!-- 긴급연락처 -->
					<div class="w3-col  pb20">
						<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="긴급연락처"  name="stel" id="stel">
					</div>
					<!-- 긴급연락처와의 관계  -->
					<div class="w3-col  pb20">
						<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="긴급연락처와의 관계"  name="stel_name" id="stel_name">
					</div>
					<!-- 추가설명 -->
					<div class="w3-col pb20">
						<textarea class="w3-input w3-padding-16 w3-border"  placeholder="참고사항을 입력하세요." name="text" id="text" >
						</textarea>
					</div>
							
					<div class="w3-button w3-yellow w3-left " id="pre3">이전</div>
				    <div class="w3-button w3-red w3-left" id="reset3">reset</div>
					<div class="w3-button w3-yellow w3-right" id="next3">가입완료</div>
				</div>
			</div>
		</div>
 	</form>
</body>
</html>