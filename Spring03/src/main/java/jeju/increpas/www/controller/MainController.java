package jeju.increpas.www.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.MainDao;
import jeju.increpas.www.service.MainService;
import jeju.increpas.www.vo.FavoriteVO;
import jeju.increpas.www.vo.MapVO;
import jeju.increpas.www.vo.MemberVO;
import jeju.increpas.www.vo.ReviewVO;

@Controller
public class MainController {
	
	@Autowired
	MainService mService;
	@Autowired
	MainDao mDao;
	
	// < 메인 페이지 - 메인 폼 요청 >
	@RequestMapping("/main.jeju")
	public ModelAndView getMain(ModelAndView mv, MapVO mVO) {
			mService.getMain(mv, mVO);
		return mv;
	}
	
	// 로그인 처리
	@RequestMapping("/LoginProc.jeju")
	public ModelAndView LoginProc(ModelAndView mv, HttpSession session, MemberVO meVO) {
		int check = mDao.LoginProc(meVO);
		System.out.println(check);
		if(check == 1) {
			session.setAttribute("SID", meVO.getId());
		}
		mv.setViewName("redirect: /www/main.jeju");
		return mv;
	}
	
	// 로그아웃 처리
	@RequestMapping("/LogoutProc.jeju")
	public ModelAndView LogoutProc(ModelAndView mv, HttpSession session) {
		session.removeAttribute("SID");
		
		mv.setViewName("redirect: /www/main.jeju");
		return mv;
	}
	
	// 찜하기 처리
	@RequestMapping("/AddFavorite.jeju")
	public ModelAndView AddFavorite(ModelAndView mv, FavoriteVO faVO) {
		
		
		System.out.println("작업이 성공적으로 이루어짐");
		mv.setViewName("redirect: /www/main.jeju");
		return mv;
	}
}
