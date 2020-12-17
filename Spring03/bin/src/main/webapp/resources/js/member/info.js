$(document).ready(function(){
	$('#hbtn').click(function(){
		$(location).attr('href', '/www/main.jeju');
	});
	$('#iebtn').click(function(){
		$('#frm').stop().slideToggle(300);
	});
	
	$('#ebtn').click(function(){
		// 할일
		// 데이터 읽어오고
		// 회원번호
		var sno = $('#no').text();
		// 원데이터
		var omail = $('#cMail').text();

		// 수정데이터
		var tmail = $('#mail').val();
		
		$('#frm').attr('method','POST');
		$('#frm').attr('action','/www/member/memberEditProc.jeju');
		$('#frm').submit();
		
	});
	
	// 회원 탈퇴 처리
	$('#dbtn').click(function(){
		// 비밀번호 입력창 보이게 하고
		$('#dfrm').stop().slideDown(300);
	});
	
	$('#del').click(function(){
		var spw = $('#pw').val();
		
		if(!spw){
			$('#pw').focus();
			return;
		}
		// 동기 방식 처리
		var sno = $('#mno').val();
		$('#dfrm').submit(); 
		
	
	});
});
