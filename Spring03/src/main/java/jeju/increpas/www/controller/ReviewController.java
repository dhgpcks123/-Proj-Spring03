package jeju.increpas.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.ReviewDao;
import jeju.increpas.www.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewDao reviewDao;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/wReviewProc.jeju")
	public ModelAndView wReviewProc(ModelAndView mv) {
		
		return mv;
	}
}
