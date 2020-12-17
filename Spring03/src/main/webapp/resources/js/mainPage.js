$(document).ready(function(){
		let byul =0
		
		$('#byul1').click(function(){
			byul = 1
		});
		$('#byul2').click(function(){
			byul = 2
		});
		$('#byul3').click(function(){
			byul = 3
		});
		$('#byul4').click(function(){
			byul = 4
		});
		$('#byul5').click(function(){
			byul = 5
		});
	// 리뷰 작성 버튼을 눌렀을 경우 리뷰 작성!
	$('#wsend').click(function(){
		var stitle = $('#reviewTitle').val();
		var sbody = $('#reviewBody').val(); 

		$('#reviewStar').val(byul);
		
		// 데이터가 입력되었는지 확인하고...
		if((stitle.trim() == '') || (sbody.trim() == '') || byul == 0 ){
			alert('모든 정보를 작성해주세요');
			return;
		};
		
		$('#wReviewfrm').submit();
	});

	// 찜하기 버튼 눌렀을때
	$('#favor').click(function(){
		var ano = $(this).attr('name');
		/*$(this).attr('method' , 'POST');
		$(this).attr('action' , '/www/rhitupdate.jeju');
		$(this).submit();*/
		$(this).append(
			'<form method="POST" action="/www/AddFavorite.jeju" id="ffrm"> <input type="hidden" id="ano" name="ano"> </form>')
		$('#ano').val(ano);
		$('#ffrm').submit();
	});
});