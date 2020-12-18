$(document).ready(function(){
	$('#infoBtn').click(function(){
		$('#frm').submit();
				return;
	});
	var 눈알 = function (selector) {
	         var 눈 = document.querySelector(selector),
	            눈동자 = 눈.querySelector('.topHeader__dot'),
	            눈영역 = 눈.getBoundingClientRect();
	   
	         var 눈알굴리기 = function (mouseX, mouseY) {
	            var 라디안 = Math.atan2( mouseY - (눈영역.y + 눈영역.height * 0.5), mouseX - (눈영역.x + 눈영역.width * 0.5) );
	            눈동자.style.transform = 'rotate(' + (180 * 라디안 / Math.PI - 90) + 'deg)';
	         };
	   
	         return {
	            눈알굴리기: 눈알굴리기
	         };
	   };
	   
	   var 왼눈 = 눈알('.topHeader__eye1');
	   var 오른눈 = 눈알('.topHeader__eye2');
	   
	window.addEventListener('mousemove', function (e) {
	         왼눈.눈알굴리기(e.pageX, e.pageY);
	         오른눈.눈알굴리기(e.pageX, e.pageY);
	});
	
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
