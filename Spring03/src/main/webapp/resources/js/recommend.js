$(document).ready(function(){
	
	$('#hbtn').click(function(){
		$(location).attr('href', '/www/main.jeju');
	});
	$('#bbtn').click(function(){
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
	
	
});