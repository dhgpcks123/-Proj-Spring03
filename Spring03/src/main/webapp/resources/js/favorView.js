$(document).ready(function(){
	$('.hbtn').click(function(){
		$(location).attr('href', '/www/main.jeju');
	});
	$('#obtn').click(function(){
		$(location).attr('href', '/www/LogoutProc.jeju');		
	});
	
	/* 전 체 보 기 */
	$('#sbtn6').click(function(){
		$(location).attr('href', '/www/FavorView.jeju');		
	});
	
	$('.sbtn').click(function(){
		var id = $(this).attr('id');
		$(this).append(
			'<form method="POST" action="/www/SortFavorView.jeju" id="sortFrm"> <input type="hidden" id="ano" name="ano"> </form>'
		)
		switch(id){
		case 'sbtn1':
			$('#ano').val(10)
			$('#sortFrm').submit();
			break;
		case 'sbtn2':
			$('#ano').val(20)
			$('#sortFrm').submit();
			break;
		case 'sbtn3':
			$('#ano').val(30)
			$('#sortFrm').submit();
			break;
		case 'sbtn4':
			$('#ano').val(40)
			$('#sortFrm').submit();
			break;
		case 'sbtn5':
			$('#ano').val(50)
			$('#sortFrm').submit();
			break;			
		}
	});
}) 