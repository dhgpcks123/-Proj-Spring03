$(document).ready(function(){
	$('#goToMain').click(function(){
		$(location).attr('href','/www/main.jeju');
	});
	
	$('#getSuggestBtn').click(function(){
		var selectedList = $('#selectedList option:selected').val();
		var Listform = {
	        atno : selectedList
    	};
		
		
		$.ajax({
			url: '/www/suggestLoc.jeju',
			type: 'POST',
			data: Listform,
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(obj){
				$('#luckyNo').text(obj.ano);
				$('.suggest__menu__loc').text(obj.aloc);
				$('.suggest__menu__name').text(obj.aname);
				$('#abody').text(obj.abody);
				$('#ax').val(obj.ax);
				$('#ay').val(obj.ay);
			},
			error: function(){
				alert('서버 통신에러');
			}
		});
	});
	
	
	//장소 자세히 보기 버튼 클릭
	$('#showDetailBtn').click(function(){
		if($('#ax').val() == 0){
			return;
		}
		$('#detailForm').submit();
	})
	
})