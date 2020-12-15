$(document).ready(function(){
	
//		로그인 버튼 클릭
	$('#loginbtn').click(function(){
	
		var sid = $('#id').val().trim();
		var spw = $('#pw').val().trim();
		if(!(sid && spw)){
			alert('아이디/비밀번호를 입력해주세요');
			return;
		};
		
		$('#loginFrm').submit();

	});
//		로그아웃 버튼 클릭
	$('#logoutbtn').click(function(){
		$(location).attr('href',"/Team03Proj/memberLogoutProc.cls");
	});
});