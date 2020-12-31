$(document).ready(function(){
	
	$('.hbtn').click(function(){
		$(location).attr('href', '/www/main.jeju');
	});
	
	$('.bbtn').click(function(){
		$(location).attr('href', '/www/recommend/recommend.jeju');
	});
	
	$('#sbtn').click(function(){
		$(location).attr('href', '/www/recommend/spring.jeju');
	});
	$('#mbtn').click(function(){
		$(location).attr('href', '/www/recommend/summer.jeju');
	});
	
	$('#fbtn').click(function(){
		$(location).attr('href', '/www/recommend/fall.jeju');
	});
	
	$('#wtbtn').click(function(){
		$(location).attr('href', '/www/recommend/winter.jeju');
	});
	
	$('#abtn').click(function(){
		$(location).attr('href', '/www/recommend/always.jeju');
	});
	
	
	//장소 자세히 보기 버튼 클릭
	$('#showDetailBtn1').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm1').submit();
	});
	
	$('#showDetailBtn2').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm2').submit();
	});
	
	$('#showDetailBtn3').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm3').submit();
	});
	
	$('#showDetailBtn4').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm4').submit();
	});
	
	$('#showDetailBtn5').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm5').submit();
	});
	
	$('#showDetailBtn6').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm6').submit();
	});
	
	
	
});