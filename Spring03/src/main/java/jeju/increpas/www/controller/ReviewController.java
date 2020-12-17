package jeju.increpas.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.service.*;
import jeju.increpas.www.vo.*;

@Controller
public class ReviewController {

	@Autowired
	ReviewDao rDao;
	
	@Autowired
	ReviewService rService;
	
	// < 리뷰 게시판 - 리뷰쓰기 proc 요청 >
	@RequestMapping("/wReviewProc.jeju")
	public ModelAndView wReviewProc(ModelAndView mv, ReviewVO rVO, MapVO mVO) {
		rService.wReviewProc(mv, rVO, mVO);
		return mv;
	}
	
	// < 리뷰 게시판 - 리뷰수정 proc 요청 >
	@RequestMapping("/reWriteProc.jeju")
	public ModelAndView reWriteProc(ModelAndView mv, ReviewVO rVO, MapVO mVO) {
		rService.reWriteProc(mv, rVO, mVO);
		return mv;
	}
}
