package jeju.increpas.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.FavorDao;
import jeju.increpas.www.dao.MainDao;
import jeju.increpas.www.service.MainService;
import jeju.increpas.www.vo.AreaInfoVO;
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
	@Autowired
	FavorDao fDao;
	
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
	public ModelAndView AddFavorite(ModelAndView mv, FavoriteVO faVO, HttpSession session) {
		String id = (String)session.getAttribute("SID");
		System.out.println("id : "+id);
		
		int mno = fDao.getMno(id);
		System.out.println("id number : "+mno);
		faVO.setMno(mno);
		
		System.out.println("faVO.mno : "+faVO.getMno());
		System.out.println("faVO.ano : "+faVO.getAno());
		
		//찜할 정보의 중복여부 체크
		int check = fDao.favorCheck(faVO);
		
		if(check == 1) {
			System.out.println("이미 찜하기 되어있습니당!");
			mv.setViewName("redirect: /www/main.jeju");
		} else {
			fDao.AddFavorite(faVO);
			System.out.println("작업이 성공적으로 이루어짐.");	
			mv.setViewName("redirect: /www/main.jeju");
		}
		return mv;
	}
	
	// 찜하기리스트 보기
	@RequestMapping("/FavorView.jeju")
	public ModelAndView FavorView(ModelAndView mv, HttpSession session) {
		String id = (String) session.getAttribute("SID");
		mService.getFavorView(mv, id);
		
		return mv;
	}
	
	//찜하기 리스트 정렬
	@RequestMapping("SortFavorView.jeju")
	public ModelAndView SortFavorView(ModelAndView mv, HttpSession session, FavoriteVO faVO) {
		String id = (String) session.getAttribute("SID");
		faVO.setMno(fDao.getMno(id));
		//System.out.println("faVO.mno : " +faVO.getMno());
		//System.out.println("faVO.ano : " +faVO.getAno());
		mService.sortFavorView(mv, faVO);
		
		return mv;
	}
}
