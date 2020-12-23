$(document).ready(function(){
	/* ######################## */
/* ### 로고 눈동자 작업 ### */
/* ######################## */
	$('#infoBtn').click(function(){
		$('#frm').submit();
				return;
	});
	let eyes = function (selector) {
	         let eye = document.querySelector(selector),
	            dot = eye.querySelector('.topHeader__dot'),
	            eyeArea = eye.getBoundingClientRect();
	   
	         let action = function (mouseX, mouseY) {
	            let rad = Math.atan2( mouseY - (eyeArea.y + eyeArea.height * 0.5), mouseX - (eyeArea.x + eyeArea.width * 0.5) );
	            dot.style.transform = 'rotate(' + (180 * rad / Math.PI - 90) + 'deg)';
	         };
	   
	         return {
	            action: action
	         };
	   };
	   
	   let lefteye = eyes('.topHeader__eye1');
	   let righteye = eyes('.topHeader__eye2');
	   
	window.addEventListener('mousemove', function (e) {
	         lefteye.action(e.pageX, e.pageY);
	         righteye.action(e.pageX, e.pageY);
	});
	
/* ############################### */
/* ### 어디로갈까? 버튼 이벤트 ### */
/* ############################### */
	$('#suggestBtn').click(function(){
		$(location).attr('href','/www/suggest.jeju');
	});
/* ############################### */
/* ### 찜 모아보기 버튼 이벤트 ### */
/* ############################### */
	$('#favoritBtn').click(function(){
		$(location).attr('href','/www/FavorView.jeju');
	});
/* ############################### */
/* ### 찜 모아보기 버튼 이벤트 ### */
/* ############################### */
	$('#chatBtn').click(function(){
		$(location).attr('href','/www/chat.jeju');
	});
	
});