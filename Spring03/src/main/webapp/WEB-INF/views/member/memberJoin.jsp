<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>***** 약관동의 *****</title>
<link rel="stylesheet" type="text/css" href="../css/cls.css">
<link rel="stylesheet" type="text/css" href="../css/w3.css">
<link rel="stylesheet" type="text/css" href="../css/member/member.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/memberjoin.js"></script>
</head>
<body>
	<div class="w3-container">
		<!-- 약관동의 시작 -->
		<div class="w3-content w3-center w3-teal w3-container mw400700 radius1">
			<div class="w3-padding-64 w3-padding-large">
				<h1>약관동의</h1>
				<p class="w3-opacity">GET IN TOUCH</p>
	 	 	
	 	 		<!-- 333 약관 동의 -->
				<form class="w3-container w3-card w3-padding-32 w3-white " action="/www/member/memberJoinProc.jeju" id="memberJoinInfo">
					<input type="hidden" id="join_check" name="join_check">
				  	<!-- 전체 약관 동의 -->
					<div class="w3-col mb10 ">
						<span class="input_chk">
							<input type="checkbox" id="chk_all" name="chk_all">
							<label for="chk_all">
								<span class="chk_all_txt">
									 이용약관, 개인정보 수집 및 이용, <br>위치정보 이용약관(선택)에 모두 동의합니다.
								</span>
							</label>
						</span>
					</div>  	
			   
			    	<!-- 333 이용약관 동의 안내 -->
					<div class="w3-col mb10 ">
						<span class="input_chk">
							<input type="checkbox" id="termsService" name="termsService"  class="chk ">
							<label for="termsPrivacy" class="collect_personal"> 이용 약관 동의<span class="terms_choice">(필수)</span></label>
						</span>
						<div class="terms_box" tabindex="0" id="divService">
							<div class="policy_summary">
							    <p class="policy_summary__text">너의 췌장을 먹고싶어 너의 췌장을 먹고싶어 너의 췌장을 먹고싶어 너의 췌장을 먹고싶어 너의 췌장을 먹고싶어 너의 췌장을 먹고싶어</p>
							</div>
						</div>
					</div>
				
			     	<!-- 개인정보 수집 및 이용에 대한 안내 -->
					<div class="w3-col mb10">
						<span class="input_chk">
							<input type="checkbox" id="termsPrivacy" name="termsPrivacy" class="chk">
							<label for="termsPrivacy" class="collect_personal">개인정보 수집 및 이용 동의<span class="terms_choice">(필수)</span></label>
						</span>
						<div class="terms_box" tabindex="0" id="divPrivacy">
							<div class="policy_summary">
							    <p class="policy_summary__text">개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
							</div>
						</div>
					</div>
				
					<!-- 위치정보 이용약관 동의 -->
					<div class="w3-col mb10">
						<span class="input_chk">
							<input type="checkbox" id="termsLocation" name="termsLocation" value="Y" class="chk">
							<label for="termsLocation">위치정보 이용약관 동의<span class="terms_choice terms_no">(선택)</span></label>
						</span>
					       <div class="terms_box" id="divLocation">
							<div class="policy_summary">
								<p class="policy_summary__text">위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.</p><br>
							</div>
						</div>
					</div>
					<p class="error" id="agreeMsg" style="display: none;">33 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</p>
				     <button type="reset" class="w3-button w3-red w3-left ">cancel</button>
				     <button type="submit" class="w3-button w3-teal w3-right" id="btnAgree">Send</button>
			   	</form>
			 </div>
		</div>	  	
	</div>
</body>
</html>