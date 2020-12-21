package jeju.increpas.www.controller;


import java.util.Enumeration;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.service.*;
import jeju.increpas.www.vo.*;

@Controller
public class MainController {
	
	@Autowired
	MainService mService;
	@Autowired
	MainDao mDao;
	
	// < 메인 페이지 - 메인 폼 요청 >
	@RequestMapping("/main.jeju")
	public ModelAndView getMain(ModelAndView mv, MapVO mVO) {
//		System.out.println("메이 폼 요청 실행?");
		mService.getMain(mv, mVO);
		return mv;
	}
	// < 메인 페이지 - 
	@RequestMapping(value="/main.jeju", method=RequestMethod.GET, produces="application/text; charset=UTF8")
	public ModelAndView getMainget(ModelAndView mv, MapVO mVO) {
		mService.getMain(mv, mVO);
		return mv;
	}
	// < 메인 페이지 - 로그인 Proc 요청 >
	@RequestMapping("/loginProc.jeju")
	public ModelAndView loginProc(ModelAndView mv, HttpSession session, MemberVO memberVO) {
		int cnt = mDao.loginProc(memberVO);
		if(cnt == 1) {
			//로그인 성공
			String id = memberVO.getId();
			session.setAttribute("SID", id);
		}else {
			//로그인 실패
		}
		mv.setViewName("redirect:/main.jeju");
		return mv;
	}
	// < 메인 페이지 - 로그아웃 Proc 요청 >
	@RequestMapping("/logoutProc.jeju")
	public ModelAndView logoutProc(ModelAndView mv, HttpSession session) {
		session.removeAttribute("SID");
		mv.setViewName("redirect:/main.jeju");
		return mv;
	}
	// < 메인 페이지 - 지도 markerlist 요청 >
	@ResponseBody
	@RequestMapping(value="/markerlist.jeju", method=RequestMethod.POST, produces="application/text; charset=UTF8")
	public String markerlist() {
		String str = mService.markerlist();
		return str;
	}
	// 찜하기 처리
	@ResponseBody
	@RequestMapping("/AddFavorite.jeju")
	public String AddFavorite(HttpServletRequest req, HttpSession session, FavoriteVO faVO) {
		String id = (String)session.getAttribute("SID");
		int mno = mDao.getMno(id);
		
		String ano = req.getParameter("ANO");
		
		faVO.setAno(Integer.parseInt(ano));
		faVO.setMno(mno);
		int check = mDao.favorCheck(faVO);
		
		String faCheck;
		
		if(check == 1){
			faCheck = "NO";
		} else {
		 	mDao.AddFavorite(faVO);
		 	faCheck="OK";
		}
		return faCheck;
	}
	
}
