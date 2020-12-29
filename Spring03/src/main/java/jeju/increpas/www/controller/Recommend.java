package jeju.increpas.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.util.*;
import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;

@Controller
@RequestMapping("/recommend")
public class Recommend {
	
	@Autowired
	RecommendDao recDao;
	
	
	@RequestMapping("/recommend.jeju") 
	public ModelAndView recommendList(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/recommend");
		
		return mv;
	}
	
	@RequestMapping("/spring.jeju") 
	public ModelAndView spring(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/spring");
		
		return mv;
	}
	
	@RequestMapping("/summer.jeju") 
	public ModelAndView summer(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/summer");
		
		return mv;
	}
	
	
	
	@RequestMapping("/fall.jeju") 
	public ModelAndView fall(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/fall");
		
		return mv;
	}
	
	
	@RequestMapping("/winter.jeju") 
	public ModelAndView winter(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/winter");
		
		return mv;
	}
	
	
	@RequestMapping("/always.jeju") 
	public ModelAndView always(ModelAndView mv, InfoVO iVO) {
		
		List<InfoVO> store = recDao.recommendList();
		
		mv.addObject("STORE", store);
		mv.setViewName("recommend/always");
		
		return mv;
	}
	
}
