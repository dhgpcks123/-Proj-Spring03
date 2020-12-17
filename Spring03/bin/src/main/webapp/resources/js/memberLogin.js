$(document).ready(function(){

// 	아이디<input>에서 엔터키 눌렀을 때 로그인 처리해주기
	$("#id").keyup(function(key) {
		if (key.keyCode == 13) {
			var sid = $('#id').val().trim();
			var spw = $('#pw').val().trim();
			
			if(!(sid && spw)){
				alert('아이디/비밀번호를 입력해주세요');
				return;
			};
			$('#loginFrm').submit();
		}
	});
	
// 	패스워드<input>에서 엔터키 눌렀을 때 로그인 처리해주기
	$("#pw").keyup(function(key) {
		if (key.keyCode == 13) {
			var sid = $('#id').val().trim();
			var spw = $('#pw').val().trim();
			
			if(!(sid && spw)){
				alert('아이디/비밀번호를 입력해주세요');
				return;
			};
			$('#loginFrm').submit();
		}
	});

//	로그인 버튼 클릭
	$('#loginbtn').click(function(){
	
		var sid = $('#id').val().trim();
		var spw = $('#pw').val().trim();
		if(!(sid && spw)){
			alert('아이디/비밀번호를 입력해주세요');
			return;
		};
		
		$('#loginFrm').submit();

	});
//	로그아웃 버튼 클릭
	$('#logoutbtn').click(function(){
		$(location).attr('href',"/www/logoutProc.jeju");
	});
});