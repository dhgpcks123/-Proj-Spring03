package jeju.increpas.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// < 리뷰 게시판 - 리뷰 삭제 proc 요청 >
	@RequestMapping("/delWriteProc.jeju")
	@ResponseBody
	public String delWriteProc(HttpServletRequest req, HttpSession session) {
		String str="NO";
		int rno = Integer.parseInt(req.getParameter("RNO"));
		int cnt = rDao.delWriteAll(rno);
		
		if(cnt == 1) {
			str = "OK";
		}
		return str;
	}
}
