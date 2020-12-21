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
	
/* ######################## */
/* ### 찜하기 관련 기능 ### */
/* ######################## */
	//로그인 안 되어 있는데 찜하기 버튼 눌렀을 때
	$('#nonLogfavor').click(function(){
		alert('로그인해야 사용할 수 있습니다');
	})
	$('#alreadyfavor').click(function(){
		alert('이미 찜하셨습니다');
		return;
	});
	
	// 찜하기 버튼 눌렀을때
	$('#favor').click(function(){
		var ano = $(this).attr('name');
		var favform = {
	        ANO : ano
    	};
		
		$.ajax({
			url: '/www/AddFavorite.jeju',
			type: 'POST',
			data: favform,
			dataType: 'html',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(obj){
				if(obj=='NO'){
					alert('이미 찜콩!')
				}else if(obj =='OK'){
					alert('찜하기에 성공했습니다');
				}
			},
			error: function(){
				alert('서버 통신에러');
			}
		});
	});
});
