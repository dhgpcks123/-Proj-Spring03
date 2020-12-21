<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css">
<link rel="stylesheet" type="text/css" href="/www/css/cls.css">
<link rel="stylesheet" type="text/css" href="/www/css/member/member.css">
<script type="text/javascript" src="/www/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/www/js/member/info.js"></script>
</head>
<style>
	html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body>
	<div id="subContentWrap" class="w3-center">
		
		<div class="subContArea ">
			<div class="headingTitleArea">
				<div class="w3-content w3-center">
					<h1 class="headingTitle w3-teal w3-card-4">[ ${DATA.mname} ] 님 회원 정보</h1>
				</div>
			</div>
			
			<div class="contentArea">
				<div>
					<div class="tableArea">
						<!-- 회원정보 -->
						<div class="tableTitleArea mt10">
							<div class="tableComment">"<span class="color01" title="필수입력값">＊</span>" 필수 사항 입니다.</div>
						</div>
						<table class="view">
							<colgroup>
								<col style="width:250px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row">성명 <span id="mberNmSpan" title="필수입력" class="color01">＊</span></th>
								<td>
									<div class="w3-col w3-text-grey ft18px mh3">
										<span class="w3-twothird w3-center">${DATA.mname}  (아이디 : ${DATA.id})</span>
										<input type="hidden" id="mberNm" name="mberNm" value="${DATA.mname}">
									</div>	
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호<span id="mberNmSpan" title="필수입력" class="color01">＊</span></th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center" id="cTel">${DATA.tel}</span>
										</div>
								<!-- 
										<select title="핸드폰 번호 앞자리 선택" name="cryalTelno1" id="cryalTelno1" class="selectBox">
											<option selected="selected" value="">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select> -
										<input type="text" title="핸드폰 가운데 번호" name="cryalTelno2" id="cryalTelno2" maxlength="4"> -
										<input type="text" title="핸드폰 마지막 번호" name="cryalTelno3" id="cryalTelno3" maxlength="4">
										<input type="hidden" id="cryalTelno" name="cryalTelno" value="010-5069-8600">
								 -->
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">혈액형</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center" id="cBl1">${DATA.blood1}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">PH형</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center" id="cBl2">${DATA.blood2}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center">${DATA.birth}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center">
												<c:if test="${DATA.gen == 'M'}">남 자</c:if>
												<c:if test="${DATA.gen eq 'F'}">여 자</c:if>
											</span>
										</div>
									</div>
								</td>
							</tr>
	
							<tr>
								<th scope="row">긴급연락처</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center" id="cSos">${DATA.sos}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">긴급연락처와의 관계</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center">${DATA.rel}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">참고사항</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3">
											<span class="w3-twothird w3-center">${DATA.addmsg}</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>
									<div class="input-3cols">
										<div class="w3-col w3-text-grey ft18px mh3"><span class="w3-twothird w3-center">${DATA.joindate}</span></div>
									</div>
								</td>
							</tr>					 
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 버튼 
			<div class="w3-col w3-border-bottom pdb10">
				<button type="button" id="modifyUserInfoBtn" class="btnType1 primary">변경하기</button>
			</div>
			 -->
			<div class="btnGroup pdb10">
				<button class="w3-button w3-cell m2 btnType1 w3-green w3-hover-lime" id="hbtn">Home</button>
				<button class="w3-button w3-cell m2 btnType1 w3-orange w3-hover-deep-orange" id="iebtn">정보수정</button>
				<button class="w3-button w3-cell m2 btnType1 w3-red w3-hover-pale-red" id="dbtn">탈 퇴</button>
			
			<!-- 탈퇴버튼 팝업 -->
				<form method="POST" action="/www/member/memberDel.jeju"  
						id="dfrm" name="dfrm" style="display: none;"
						class="w3-col w3-card-4 w3-padding w3-margin-bottom">
					<input type="hidden" name="mno" id="mno" value="${DATA.mno}">
					<label for="pw" class="w3-col m3 w3-text-grey ft18px">비밀번호 : </label>
					<input type="password" id="pw" name="pw" class="w3-col m7 w3-input w3-border">
					<div class="w3-col m2 pdh10">
						<div class="w3-col w3-button w3-medium w3-red w3-hover-orange w3-left mt0" id="del">탈퇴처리</div>
					</div>
				</form>
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
				<span class="w3-third w3-center chkbl2">${data.blood2}</span>
		</div>
</c:forEach>	
				</div>
			</div>
		</div>
	</form>
		
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
</body>
</html>