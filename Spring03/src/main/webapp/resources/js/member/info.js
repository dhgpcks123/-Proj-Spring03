$(document).ready(function(){
	$('#hbtn').click(function(){
		$(location).attr('href', '/www/main.jeju');
	});
	$('#iebtn').click(function(){
		$('#frm').stop().slideToggle(300);
	});
	
	/*
	$('#ebtn').click(function(){
		// 할일
		// 데이터 읽어오고
		// 회원번호
		var sno = $('#no').text();
		// 원데이터
		var omail = $('#cMail').text();
		var otel = $('#cTel').text();
		var osos = $('#cSos').text();
		var obl1 = $('#cBl1').text();
		var obl2 = $('#cBl2').text();
		// 수정데이터
		var tmail = $('#mail').val();
		var ttel = $('#tel').val();
		var tsos = $('#sos').val();
		var tbl1 = $('.bl1:checked').val();
		var tbl2 = $('.bl2:checked').val();

		if(!tbl1){
			tbl1 = obl1;
		} else if(!tbl2){
			tbl2 = obl2;
		}
		
		$('#frm').attr('method','POST');
		$('#frm').attr('action','/www/member/memberEditProc.jeju');
		$('#frm').submit();
		
	});
	*/

	// 휴대폰번호 수정
	$('button[name=edit1]').click(function(){
	    $(this).hide();
	    $('#telfrm').stop().slideDown(300);
		$('button[name=save1]').show();
    });
	  
	$('button[name=save1]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var otel = $('#cTel').text();
		// 수정데이터
		var ttel = $('#tel').val();
		
		if(!otel){
			otel = ttel;
		}
		
		$('#telfrm').attr('method','POST');
		$('#telfrm').attr('action','/www/member/memberEditProc.jeju');
		$('#telfrm').submit();
    });
	
	/*
	// 휴대폰번호 수정 비동기처리 
	$('button[name=edit1]').click(function(){
		$(this).hide();
		$('#telfrm').stop().slideDown(300);
		$('button[name=save1]').show();
	});
	  
	$('button[name=save1]').click(function(){	
		var sno = $('#no').text();
		// 원데이터
		var otel = $('#cTel').text();
		// 수정데이터
		var ttel = $('#tel').val();		
		
		// 데이터를 서버에 보내서 응답을 받는다. 비동기통신으로
		$.ajax({
			url: '/www/member/memberEditProc.jeju',
			type: 'POST',
			dataType: 'text',
			data: {
				otel: otel,
				ttel: ttel
			},
			success: function(data){
				if(data.result == '수정성공!'){
					
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
*/
	// 혈액형1 수정
	$('button[name=edit2]').click(function(){
	    $(this).hide();
	    $('#bl1frm').stop().slideDown(300);
		$('button[name=save2]').show();
    });
	  
	$('button[name=save2]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var obl1 = $('#cBl1').text();
		// 수정데이터
		var tbl1 = $('.bl1:checked').val();
		
		if(!tbl1){
			tbl1 = obl1;
		}
		
		$('#bl1frm').attr('method','POST');
		$('#bl1frm').attr('action','/www/member/memberEditProc.jeju');
		$('#bl1frm').submit();
    });
	
	// 혈액형2 수정
	$('button[name=edit3]').click(function(){
	    $(this).hide();
	    $('#bl2frm').stop().slideDown(300);
		$('button[name=save3]').show();
    });
	  
	$('button[name=save3]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var obl2 = $('#cBl2').text();
		// 수정데이터
		var tbl2 = $('.bl2:checked').val();
		
		if(!tbl2){
			tbl2 = obl2;
		}
		
		$('#bl2frm').attr('method','POST');
		$('#bl2frm').attr('action','/www/member/memberEditProc.jeju');
		$('#bl2frm').submit();
    });

	// sos 수정
	$('button[name=edit4]').click(function(){
	    $(this).hide();
	    $('#sosfrm').stop().slideDown(300);
		$('button[name=save4]').show();
    });
	  
	$('button[name=save4]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var osos = $('#cSos').text();
		// 수정데이터
		var tsos = $('#sos').val();
		
		if(!tsos){
			tsos = osos;
		}
		
		$('#sosfrm').attr('method','POST');
		$('#sosfrm').attr('action','/www/member/memberEditProc.jeju');
		$('#sosfrm').submit();
    });

	// rel 수정
	$('button[name=edit5]').click(function(){
	    $(this).hide();
	    $('#relfrm').stop().slideDown(300);
		$('button[name=save5]').show();
    });
	  
	$('button[name=save5]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var orel = $('#cRel').text();
		// 수정데이터
		var trel = $('#rel').val();
		
		if(!trel){
			trel = orel;
		}
		
		$('#relfrm').attr('method','POST');
		$('#relfrm').attr('action','/www/member/memberEditProc.jeju');
		$('#relfrm').submit();
    });

	// addmsg 수정
	$('button[name=edit6]').click(function(){
	    $(this).hide();
	    $('#addmsgfrm').stop().slideDown(300);
		$('button[name=save6]').show();
    });
	  
	$('button[name=save6]').click(function(){
		var sno = $('#no').text();
		// 원데이터
		var oaddmsg = $('#cAddmsg').text();
		// 수정데이터
		var taddmsg = $('#addmsg').val();
		
		if(!oaddmsg){
			taddmsg = oaddmsg;
		}
		
		$('#addmsgfrm').attr('method','POST');
		$('#addmsgfrm').attr('action','/www/member/memberEditProc.jeju');
		$('#addmsgfrm').submit();
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