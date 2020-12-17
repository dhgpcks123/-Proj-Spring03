<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/cls.css">
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/w3.css">
<link rel="stylesheet" type="text/css"
	href="/Team03Proj/css/detailBoard/detailBoard.css">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>
<script src="https://kit.fontawesome.com/e6e9b86680.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/Team03Proj/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/Team03Proj/js/detailBoard.js"></script>

</head>

<body>
	<a href="javascript:void(0)"
		class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align"
		onclick="document.getElementById('id01').style.display='block'">New
		Message <i class="w3-padding fa fa-pencil"></i>
	</a>
	
	<a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)"
		class="w3-bar-item w3-button"> </a>
	<!-- Modal that pops up -->
	<div id="id01" class="w3-modal w3-border" style="z-index: 3; padding-top: 4%;">
			<!-- x아이콘 -->
		<div class="w3-panel" style="position: fixed; z-index: 999; top:1%; right:6%">
			<div class="w3-section w3-right">
			<a class="w3-button w3-red" id="xbutton"><i class="fa fa-remove"></i>
				</a>
			</div>
		</div>
		<!-- 모달창 내부 -->
		<div class="w3-modal-content w3-animate-zoom" id="cModal" style="width: 87%; height: 90%; overflow: auto;">


			<div>
				<!-- 가게이름 및 주소 -->
				<div>
					<div style="margin-left: 80px; margin-top: 18px;">
						<div
							style="font-size: 40pt; color: red; display: inline-block; margin-right: 10px;">
							<i class="fas fa-store-alt"></i>
						</div>
						<div style="font-size: 35pt; display: inline-block;">
							<Strong> 원조할배국밥 수원장안구청점 </Strong>
						</div>
					</div>
					<div style="margin-left: 80px;">
						<div style="color: red; display: inline-block;">
							<i class="fas fa-map-marker-alt"></i>
						</div>
						<div style="color: gray; display: inline-block;">제주특별자치도
							서귀포시 색달동 일주서로 968-10</div>
						<div style="color: gray; font-size:8pt; margin-left:15px;">전화번호 : <span>010-7648-5555</span></div>
					</div>
					<div>
						<div
							style="padding: 0px; margin: 30px; border-top: 1px solid #ECEAEB; border-bottom: 1px solid #ECEAEB;">
							<div style="display: flex; justify-content: space-evenly;">
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-map-marked-alt"></i> 경로 찾기
								</div>
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-pencil-alt"></i><a href="#wReviewfrm"> 리뷰 쓰기</a>
								</div>
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-bookmark"></i> 찜 하기
								</div>
							</div>
						</div>

						<div id="wrapper">
							<div class="w3-round-xxlarge" id="slider-wrap">
								<ul id="slider">
									<li>
										<div></div> <a href="/Team03Proj/img/detailBoard/store01.jpg">
											<img class="StoreIMG w3-padding-right"
											src="/Team03Proj/img/detailBoard/store01.jpg">
									</a>
									</li>
									<li>
										<div></div> <img class="StoreIMG w3-padding-right"
										src="/Team03Proj/img/detailBoard/store02.jpg">
									</li>

									<li>
										<div></div> <img class="StoreIMG"
										src="/Team03Proj/img/detailBoard/store03.jpg">
									</li>
									<li>
										<div></div> <img class="StoreIMG"
										src="/Team03Proj/img/detailBoard/store01.jpg">
									</li>
									<li>
										<div></div> <img class="StoreIMG"
										src="/Team03Proj/img/detailBoard/store04.jpg">
									</li>
									<li>
										<div></div> <img class="StoreIMG"
										src="/Team03Proj/img/detailBoard/store01.jpg">
									</li>
								</ul>

								<!--controls-->
								<div class="btns" id="next">
									<i class="fa fa-arrow-right"></i>
								</div>
								<div class="btns" id="previous">
									<i class="fa fa-arrow-left"></i>
								</div>
								<div id="counter"></div>

								<div id="pagination-wrap">
									<ul>
										<li></li>
									</ul>
								</div>
								<!--controls-->

							</div>
						</div>
						
						<!-- 하단페이지 구현 -->
						<section style="display: flex; flex-direction: column;  border-top: 1px solid #ECEAEB; margin-left: 60px; margin-right: 40px;">
							<!-- 1 -->
							<div style="background-color: #F6F6F6; margin-top: 10px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
								<h3 style="cursor: pointer; margin-top : 15px;">원조할배국밥 안양역점 &gt;</h3>
								<h3 style="color:yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">★★★☆☆</h3>

							</div>
							<div style="display: flex; border-bottom: 1px solid #ECEAEB; padding-right:20px;">
									<div style="padding-left: 5px; width:70%;">> 자려고 누웠는데 생각나는 맛입니다..</div>
									<div><strong>dhgpcks123</strong></div>
									<div style="margin-left: 45px;">작성일 : </div>
									<div>2020. 12. 13</div>
							</div>
							
							<div style="border-bottom: 1px solid #ECEAEB;">
								<div style="margin-top: 20px; padding-right: 33px; display:inline-block;">화덕피자로 유명한 곳인지도 모르고 갔는데 먹으면서 피자가 너무 맛있어서 검색을 해봤더니
								화덕피자로 유명하다 해서 역시 유명한 데에는 이유가 있구나라는 생각을 했어요.
								쫀득하고 간간한 도우위에 작지만 충분한 마르게리따 피자와 봉골레 파스타, 단호박 수프 모두
								입맛에 잘 맞아서 맛있게 먹고 왔어요. 참고로 분위기도 좋았지만 접시가 너무 예뻐서 다음 요리는
								어떤 접시에 나올까 생각해보면서 기다렸어요.
								</div>
								<div style="display:flex; flex-wrap:wrap; justify-content: flex-start; margin-bottom: 20px;">
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/리뷰사진1.jpg"></img>
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/리뷰사진2.jpg"></img>
								</div>
							</div>
							<!-- 2 -->
							<div style="background-color: #F6F6F6; margin-top: 30px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
								<h3 style="cursor: pointer; margin-top : 15px;">원조할배국밥 구로디지털단지역 &gt;</h3>
								<h3 style="color:yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">★★★☆☆</h3>

							</div>
							<div style="display: flex; border-bottom: 1px solid #ECEAEB; padding-right:20px;">
									<div style="padding-left: 5px; width:70%;">> 여기 졸맛탱</div>
									<div><strong>woooooooow</strong></div>
									<div style="margin-left: 45px;">작성일 : </div>
									<div>2020. 12. 10</div>
							</div>
							
							<div style="border-bottom: 1px solid #ECEAEB;">
								<div style="margin-top: 20px; padding-right: 33px; display:inline-block;">화덕피자로 유명한 곳인지도 모르고 갔는데 먹으면서 피자가 너무 맛있어서 검색을 해봤더니
								가보고 괜찮아서 주변에 추천했더니,
								일식 좋아하시는 분들이 현지 맛을 너무나 잘 살린
								마제소바라며 극찬함. 사실 나는 마제소바 자체가 여기가
								처음인지라 그정도인줄은 잘 모르겠으나, 아무튼 소바 좀
								먹는 사람들이 환장하는 곳인듯..
								</div>
								<div style="display:flex; flex-wrap:wrap; justify-content: flex-start; margin-bottom: 20px;">
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/store01.jpg"></img>
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/store02.jpg"></img>
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/store03.jpg"></img>
									<img class="reviewIMG" src="/Team03Proj/img/detailBoard/store04.jpg"></img>
								</div>
							</div>
							
						</section>


						<footer style="display: flex; flex-direction: column;  margin-top: 50px; margin-left: 60px; margin-right: 40px;">
							<form method="POST" encType="multipart" action="#" id="wReviewfrm" name="wReviewfrm">
							
								<!-- 별 -->
								<div class="starRev w3-right" style="display:inline-block; margin-left: 15px;">
								 	<p id="star_grade">
								        <a href="#">★</a>
								        <a href="#">★</a>
								        <a href="#">★</a>
								        <a href="#">★</a>
								        <a href="#">★</a>
									</p>
								</div>
									
								<!-- review body추가 -->
								<input type="text" placeholder="글 제목" style="margin-top:40px; border:none; padding: 5px; border-top: 1px solid gray;">
								<textarea style="width: 100%; height: 200px; margin-bottom: 5px; padding: 20px;" placeholder="이 곳에 리뷰를 작성하세요 :)"></textarea>
								
								<div class="w3-button w3-amber w3-right" id="wsend" style="margin-bottom: 30px; width: 150px;">리뷰 작성</div>
								
									<!-- file추가 -->
								<div>
								<input type="file" style="display: inline-block; width: 500px;" id="file1">
								<input type="file" style="display: none; width: 500px;" id="file2">
								<input type="file" style="display: none; width: 500px;" id="file3">
								<input type="file" style="display: none; width: 500px;" id="file4">
								</div>
							</form>
						</footer>


					</div>



				</div>
			</div>
		</div>
	</div>
</body>
</html>