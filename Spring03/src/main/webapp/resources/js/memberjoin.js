$(document).ready(function(){
	
 //----------------------------------------------------------
// 약관(memberJoin)
//----------------------------------------------------------
   // 약관동의 진입시 체크해제  
	$("#chk_all").prop("checked",false);
		setTerms();

    // 약관동의 체크 모두동의 
    $("#chk_all").click(function(){
        setTerms();
    });	
 	
    // 약관동의 모두 체크(true), 체크해제(false) 기능
	function setTerms() {
        if ($("#chk_all").is(":checked")) {
            $("#termsService").prop("checked",true);
            $("#termsPrivacy").prop("checked",true);
            $("#termsLocation").prop("checked",true);
        } else {
            $("#termsService").prop("checked",false);
            $("#termsPrivacy").prop("checked",false);
            $("#termsLocation").prop("checked",false);
        }
        return true;
    }

    // 약관동의 필수 체크(true) 확인 기능
    function checkTerms() {
        var res = true;
		
        if ($("#termsService").is(":checked") == false
			 || $("#termsPrivacy").is(":checked") == false) {
            $("#agreeMsg").show();
            res = false;
        } else {
            $("#agreeMsg").hide();
        }

        return res;
    }

    // 약관동의 필수 체크(true) 전송 기능
    function submitAgree() {
        if (checkTerms() != true) {
            return false;
        }
        $("#memberJoinInfo").submit();
        return true;
    }

    // 약관동의 버튼(Send) 기능
    $("#btnAgree").click(function() {
		checkTerms();
        submitAgree();
        return false;
    });


//----------------------------------------------------------
// 개인정보입력(memberJoinInfo)	
//----------------------------------------------------------
	var idCheck = true;
	var pwCheck = true;
	var mailCheck = true;
	var telCheck = true;
		
	// id 입력확인  
	$('#id').focusout(function(){
		if($('#id').val() == ""){
			$('#idmsg').html('필수정보입니다.');
			$('#idmsg').addClass('w3-text-red');
			$('#idmsg').stop().show(500);
			return;
		}
	});
	
	// id 정규식검사 
	$('#id').keyup(function(){
		var sid = $(this).val();
		var pattern = /^[a-z0-9]{6,12}$/; //소문자,숫자,6-12자리 
		var result = pattern.test(sid);
		
			
		if(result == true){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
			idCheck = false;
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
			idCheck = false;
		}
		// 아이디 연속문자 체크
		if(true == /(\w)\1\1\1/.test(sid)){
			alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
			return;
			}
	});	
	
	
	// 아이디체크버튼 처리
	$('#idck').click(function(){
		var tid = $('#id').val();
		if(!tid ){
			alert('아이디는 입력하고 버튼을 눌러주세요.');
			return;
		} else if(tid.length < 6){
			alert('아이디는 6-12자리로 입력해주세요.');
			return;
		}
		
		// 데이터를 서버에 보내서 응답을 받는다. 비동기통신으로
		$.ajax({
			url: '/www/member/memberIdCheck.jeju',
			type: 'POST',
			dataType: 'json',
			data: {
				id: tid
			},
			success: function(data){
				if(data.result == 'OK'){
					// 사용가능한 아이디인 경우
					$('#idmsg').html('*** 사용가능한 아이디 입니다! ***');
					$('#idmsg').removeClass('w3-text-red');
					$('#idmsg').addClass('w3-text-blue');
					$('#idmsg').stop().slideDown(500);
					idCheck = true;
				} else {
					// 사용 불가능한 아이디인 경우
					$('#idmsg').html('### 중복 된 아이디 입니다! ###');
					$('#idmsg').removeClass('w3-text-blue');
					$('#idmsg').addClass('w3-text-red');
					$('#idmsg').stop().slideDown(500);
					idCheck = false;
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
//----------------------------------------------------------
	// 비밀번호 미입력 알림
	$('#pw').focusout(function(){
		if($('#pw').val() == ""){
			$('#pwmsg').html('필수정보입니다.');
			$('#pwmsg').addClass('w3-text-red');
			$('#pwmsg').stop().show(500);
			return;
		}
	});
	
	// 비밀번호에 아이디 사용 체크 
	$('#pw').focusout(function(){
		var tid = $('#id').val();
		if(this.search(tid) == true) {
			alert("비밀번호에 아이디가 포함되어있습니다.");
			return;
		}
	});
		
	$('#pw2').focusout(function(){
		if($('#pw2').val() == ""){
			$('#pw2msg').html('필수정보입니다.');
			$('#pw2msg').addClass('w3-text-red');
			$('#pw2msg').stop().show(500);
			return;
		}
	});
	
	// 비밀번호, 비밀번호 확인 동일여부 확인 
	$('#pw2').keyup(function(){
		var spw = $('#pw').val();
		var spw2 = $(this).val();

		if(spw == spw2){
			$('#pwmsg').css('color', 'green');
			$('#pwmsg').html('*** 비밀번호가 일치합니다! ***');
			$('#pwmsg').stop().show();
			setTimeout(hidePwTag, 1500);
		} else {
			$('#pwmsg').css('color', 'red');
			$('#pwmsg').html('### 비밀번호가 다릅니다! ###');
			$('#pwmsg').stop().show();
		}
	});
	
	// 비밀번호 포커스 리셋
	$('#pw').focus(function(){
		$(this).val("");
		$('#pw2').val("");
		$('#pwmsg').hide();
		$('#pw2').stop().slideDown(300);
	});
	
	// 비밀번호 정규식 검사
	$('#pw').keyup(function(){
		var spw = $(this).val();
		var pattern = /^[a-z0-9]{8,12}$/; // 소문자,숫자,8-12자리
		var result = pattern.test(spw);
		
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
			pwCheck = true;
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
			pwCheck = false;
		}
	});
	/*
	$('#pw2').keyup(function(){
		var spw = $(this).val();
		var pattern = /^[a-z0-9]{8,12}$/; // 소문자,숫자,8-12자리
		var result = pattern.test(spw);
		
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
			pwCheck = true;
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
			pwCheck = false;
		}
	});
	 */
	function hidePwTag(){
		$('#pw2').stop().slideUp(300);
	}
//----------------------------------------------------------
	// mail 입력확인 
	$('#mail').focusout(function(){
		if($('#mail').val() == ""){
			$('#mailmsg').html('필수정보입니다.');
			$('#mailmsg').addClass('w3-text-red');
			$('#mailmsg').stop().show(500);
			return;
		}
	});
	// mail 정규식
	$('#mail').change(function(){
		var smail = $(this).val();
						// 숫자,대소문자,허용특문"-_."
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(smail);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
			mailCheck = true;
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
			mailCheck = false;
		}
	});
//----------------------------------------------------------
	// name 입력확인  
	$('#mname').focusout(function(){
			
		if($('#mname').val() == ""){
			$('#namemsg').html('필수정보입니다.');
			$('#namemsg').addClass('w3-text-red');
			$('#namemsg').stop().show(500);
			return;
		}
	});
	// name 정규식 검사
	$('#mname').change(function(){
		var sname = $(this).val();
		var pattern = /^[가-힣]{2,10}$/; // 한글 2-10글자
		var result = pattern.test(sname);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
		}
	});
//----------------------------------------------------------
	// tel 입력확인 
	$('#tel').focusout(function(){
		if($('#tel').val() == ""){
			$('#telmsg').html('필수정보입니다.');
			$('#telmsg').addClass('w3-text-red');
			$('#telmsg').stop().show(500);
			return;
		}
	});
	// tel 정규식검사 
	$('#tel').keyup(function(){
		var stel = $(this).val();
		var pattern = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var result = pattern.test(stel);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
			telCheck = true;
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
			telCheck = false;
		}
	});	
//----------------------------------------------------------
	// 회원가입 step1 버튼 
	$('#reset1').click(function(){
		$('#id').val('');
		$('#id').removeClass('w3-teal');
		$('#id').removeClass('w3-pale-red');
		$('#idmsg').hide();
		$('#pw').val('');
		$('#pw').removeClass('w3-teal');
		$('#pw').removeClass('w3-pale-red');
		$('#pw2').val("");
		$('#pwmsg').hide();
		$('#pw2').stop().slideDown(300);
		$('#pw2').val('');
		$('#pw2').show();
		$('#pw2msg').hide();
		$('#mail').val('');
		$('#mail').removeClass('w3-teal');
		$('#mail').removeClass('w3-pale-red');
		$('#mailmsg').hide();
	});
	
	$('#next1').click(function(){
		var sid = $('#id').val();
		var spw = $('#pw').val();
		var spw2 = $('#pw2').val();
		var smail = $('#mail').val();
		
		if(!sid || !spw || !spw2 || !smail){
			alert('빈칸을 채워주세요');
			$('#next1').stop();
		} else if(sid.length<6){
			alert('아이디가 너무 짧습니다.');
		} else if(idCheck == false){
			alert('아이디 중복을 체크해주세요.');
		} else if(pwCheck == false){
			alert('비밀번호가 너무 쉽습니다. \n규칙 : \"소문자,숫자,8-12자리\"에 맞게 만들어주세요.');
		} else if(mailCheck == false){
			alert('메일을 정확하게 입력해주세요.');
		} else {
			$('#step1').attr('disabled', 'false');
			$('#step2').removeClass('w3-hide');
			$('#step1').addClass('w3-hide');	
		}
	});
	
	// 회원가입 step2버튼 
	$('#pre2').click(function(){
		$('#step1').removeClass('w3-hide');
		$('#step1').attr('disabled', 'true');
		$('#step2').addClass('w3-hide');
	});
	
	$('#reset2').click(function(){
		$('#mname').val('');
		$('#mname').removeClass('w3-teal');
		$('#mname').removeClass('w3-pale-red');
		$('#year').val('1988');
		$('#mouth').val('6');
		$('#day').val('15');
		$('#tel').val('');
		$('#tel').removeClass('w3-teal');
		$('#tel').removeClass('w3-pale-red');
		$('#gen').val("성별");
	});
	
	$('#next2').click(function(){
		var sname = $('#mname').val();
		var stel = $('#tel').val();
		var sgen = $('.gen:checked').val();
		
		
		if(!sname){
			alert('이름을 채워주세요');
			return;
		} else if(telCheck == false){
			alert('전화번호를 정확하게 입력해주세요.');
		} else if(!sgen){
			alert('성별을 선택해주세요');
		} else {
			$('#step1').addClass('w3-hide');
			$('#step3').removeClass('w3-hide');
			$('#step2').addClass('w3-hide');
			$('#step2').attr('disabled', 'false');
		}

	});
	// 회원가입 step3 버튼 
	$('#pre3').click(function(){
		$('#step2').removeClass('w3-hide');
		$('#step2').attr('disabled', 'true');
		$('#step3').addClass('w3-hide');
	});
	
	$('#reset3').click(function(){
		$('#ph').val('');
		$('#abo').val('');
		$('#stel').val('');
		$('#stel_name').val('');
		$('#text').val('');
	});
	
	$('#next3').click(function(){		
		joinCheck();
		joinAgree();
	});


	 // 개인정보 확인 후 가입내용 전송 
    function joinCheck() {
		var res = true;
		
		var sid = $('#id').val();
		var spw = $('#pw').val();
		var smail = $('#mail').val();
		var sname = $('#mname').val();
		var syear = $('#year').val();
		var smouth = $('#mouth').val();
		var sday = $('#day').val();
		var stel = $('#tel').val();
		var sgen = $('.gen:checked').val();
		var sph = $('.ph:checked').val();
		var sabo = $('.abo:checked').val();
		var sstel = $('#stel').val();
		var sstel_name = $('#stel_name').val();
		var stext = $('#text').val();
		
	/*	alert(sid + '|' + spw + '|' + smail + '|' + 
			sname + '|' + syear + '|' + smouth + '|' + sday + '|' + stel + '|' + sgen + '|' + 
			sph + '|' + sabo + '|' + sstel + '|' + sstel_name + '|' + stext);*/
		if(!(sid && spw && smail && 
			sname && syear && smouth && sday && stel && sgen)){
			res = false;
		} else {
			alert('입력에 이상이 없는지 확인해주세요.');
		}
			
		$('#memberJoinEnd').attr('method', 'POST'); 
		$('#memberJoinEnd').attr('action', '/www/member/joinProc.jeju'); 
//		$('#memberJoinEnd').attr('action', '/www/member/memberJoinEnd.jeju'); 
		
		return res;
    }

    function joinAgree() {
        if (joinCheck() != true) {
            return false;
        }
		
        $("#memberJoinEnd").submit();
        return true;
    }

});