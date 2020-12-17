$(document).ready(function(){
/*##################### x버튼 이벤트 #########################*/

	$('#xbutton').click(function(){
		$('#id01').css('display', 'none');
		$('.reviewRebtn').css('display','inline-block');
		$('.reviewRebtn').parent().next().css('display','none');
		//@@@@@@@@@
		//@@@@@사진도 안보이게 추가
		//@@@@@
	});

	
/*############################# Slider 관련 js #########################*/
		//current position
		var pos = 0;
		//number of slides
		var leng = $('#slider-wrap ul li').length
	
		if(leng%2 == 0){
			var totalSlides = leng/2;
		}else if(leng%2 != 0){
			var totalSlides =  leng/2-0.5;
		}
		
		//get the slide width
		var sliderWidth = $('#slider-wrap').width();
	
		$(document).ready(function(){
		
		/*****************
		 BUILD THE SLIDER
		*****************/
		//set width to be 'x' times the number of slides
		$('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
		
		//next slide 
		$('#next').click(function(){
		slideRight();
		});
		
		//previous slide
		$('#previous').click(function(){
		slideLeft();
		});
		
		/*************************
		 //*> OPTIONAL SETTINGS
		************************/
		//automatic slider
		var autoSlider = setInterval(slideRight, 4000);
		
		//for each slide 
		
		$.each($('#slider-wrap ul li')/2, function() { 
			   //create a pagination
			   var li = document.createElement('li');
			   $('#pagination-wrap ul').append(li);   
		});
		
		//counter
		countSlides();
		
		//pagination
		pagination();
		
		//hide/show controls/btns when hover
		//pause automatic slide when hover
		$('#slider-wrap').hover(
		  function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
		  function(){ $(this).removeClass('active');
			autoSlider = setInterval(slideRight, 3000); }
		);
		
		});

		/***********
		 SLIDE LEFT
		************/
		function slideLeft(){
		pos--;
		if(pos==-1){ pos = totalSlides-1; }
		$('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
		//*> optional
		countSlides();
		pagination();
		}
		
		/************
		 SLIDE RIGHT
		*************/
		function slideRight(){
		pos++;
		if(pos==totalSlides){ pos = 0; }
		$('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
		
		//*> optional 
		countSlides();
		pagination();
		}

		/************************
		 //*> OPTIONAL SETTINGS
//		************************/
		function countSlides(){
		$('#counter').html(pos+1 + ' / ' + totalSlides);
		}
		
		function pagination(){
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq('+pos+')').addClass('active');
		}
		
		
/*############################# 리뷰 별점 관련 js #########################*/		
		// 리뷰 작성 별점주기 관련 js
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
		
		$('#star_grade a').click(function(){
           $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
           $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
           return false;
     	});
		
/*############################# 리뷰 파일 js #########################*/
		/* 파일이 추가되면 파일선택 버튼이 늘어나도록 설정 */		
		$('#file1').change(function(){
			$('#file2').css('display', 'inline-block');
		});
		$('#file2').change(function(){
			$('#file3').css('display', 'inline-block');
		});
		$('#file3').change(function(){
			$('#file4').css('display', 'inline-block');
		});
		
		
/*############################# 회원가입 관련 js #########################*/	
		$('#member').click(function(){
			$(this).attr('href', '/Tean03Proj/memberJoin.cls');
		});
		
/*############################# 리뷰 수정 작업 관련 js #########################*/	
// 리뷰 수정 별점주기 관련 js
		let Rebyul =0
		$('#Rebyul1').click(function(){
			Rebyul = 1
		});
		$('#Rebyul2').click(function(){
			Rebyul = 2
		});
		$('#Rebyul3').click(function(){
			Rebyul = 3
		});
		$('#Rebyul4').click(function(){
			Rebyul = 4
		});
		$('#Rebyul5').click(function(){
			Rebyul = 5
		}); 

		$('#star_Regrade a').click(function(){
           $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
           $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
           return false;
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
//------------------------------리뷰작성-------------------	
	

	// 리뷰 수정 버튼 클릭했을 때, 수정 정보 보여주고 삭제버튼 띄워주기
	$('.reviewRebtn').click(function(){
		var rno = $(this).attr('id');
		$(this).parent().next().slideDown();
		$(this).css('display', 'none');
		
		$('#RewriteRno').val(rno);
		var imgrno = $('#img'+rno + ' .delImg');
		$(imgrno).css('display','inline-block');
	});
	
	// *파일이 추가되면 파일선택 버튼이 늘어나도록 설정
	$('.reFile1').change(function(){
		$(this).next().css('display', 'inline-block');
	});
	$('.reFile2').change(function(){
		$(this).next().css('display', 'inline-block');
	});
	$('.refile3').change(function(){
		$(this).next().css('display', 'inline-block');
	});	
	// *리뷰 다시쓰기 리셋 버튼
	$('.rewriteResetBtn').click(function(){
		var ResetRno = $(this).attr('id');
		var resetrno = ResetRno.substring(5);
		$('#rewriteRbody'+resetrno).val('');
		$('#rewriteRtitle'+resetrno).val('');
		$('#rewriteRtitle'+resetrno).text('');
	});
	// *리뷰 다시쓰기 취소 버튼
	$('.rewriteCancelBtn').click(function(){
		var rbody = $(this).parent().parent().children().eq(0).text().trim();
		var rtitle = $(this).parent().parent().prev().prev().children().eq(0).text().trim();
		$(this).parent().stop().slideUp();
		var tmp = $(this).parent().prev().children().eq(0);
		var RewriteRno = $(this).attr('id');
		var rewriterno = RewriteRno.substring(16);
		setTimeout(function() {
			tmp.css('display','inline-block');
			$('#rewriteRtitle'+rewriterno).val(rtitle);
			$('#rewriteRbody'+rewriterno).text(rbody);
		}, 450);
		$('#img'+rewriterno+' .delImg').css('display','none');
		$('#img'+rewriterno+' .reviewImg').css('display','inline-block');
		//수정요망
		$('.delInput').remove();
	});
	// 리뷰 다시쓰기 작성 버튼
	$('.rewriteBtn').click(function(){
		var RewriteBtn = $(this).attr('id');
		var rewritebtn = RewriteBtn.substring(10);
		
		$('#fr'+rewritebtn).attr('action','/www/reWriteProc.jeju');
		
		
		var rtitle = $('#rewriteRtitle'+rewritebtn).val();
		var rbody = $('#rewriteRbody'+rewritebtn).val(); 

		$('#RewriteRgrade').val(Rebyul);
		
		// 데이터가 입력되었는지 확인하고...
		if((rtitle.trim() == '') || (rbody.trim() == '') || Rebyul == 0 ){
			alert('모든 정보를 작성해주세요');
			return;
		};
		$('#fr'+rewritebtn).submit();
	})
	
	// 사진 삭제시 input태그 만들고, 사진 보이지 않도록 하기
	$('.delImg').click(function(){
		var pno = $(this).prev().attr('id');
		$(this).prev().css('display','none');
		$(this).css('display','none');
		$('#RewriteForm').append('<input type="hidden" class="delfile" name="delfile" value="'+pno+'">')
	})
});





