package jeju.increpas.www.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.service.MainService;
import jeju.increpas.www.vo.MapVO;

@Controller
public class MainController {
	
	@Autowired
	MainService mService;
	
	// < 메인 페이지 - 메인 폼 요청 >
	@RequestMapping("/main.jeju")
	public ModelAndView getMain(ModelAndView mv, MapVO mVO) {
			mService.getMain(mv, mVO);
		return mv;
	}
		
}
