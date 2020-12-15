$(document).ready(function(){
/*##################### x버튼 이벤트 #########################*/

	$('#xbutton').click(function(){
		$('#id01').css('display', 'none');
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
		
		});//DOCUMENT READY
		
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
		
		 $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
     	   });

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
		
		/* 회원가입 */		
		$('#member').click(function(){
			$(this).attr('href', '/Tean03Proj/memberJoin.cls');
		});
});





