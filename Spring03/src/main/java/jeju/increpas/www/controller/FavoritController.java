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
public class FavoritController {

	@Autowired
	FavorDao fDao;
	@Autowired
	FavoritService fService;
	
	// 찜하기 처리
		@ResponseBody
		@RequestMapping("/AddFavorite.jeju")
		public String AddFavorite(HttpServletRequest req, HttpSession session, FavoriteVO faVO) {
			String id = (String)session.getAttribute("SID");
			int mno = fDao.getMno(id);
			
			String ano = req.getParameter("ANO");
			
			faVO.setAno(Integer.parseInt(ano));
			faVO.setMno(mno);
			int check = fDao.favorCheck(faVO);
			
			String faCheck;
			
			if(check == 1){
				faCheck = "NO";
			} else {
				fDao.AddFavorite(faVO);
			 	faCheck="OK";
			}
			return faCheck;
		}
		// 찜하기리스트 보기
			@RequestMapping("/FavorView.jeju")
			public ModelAndView FavorView(ModelAndView mv, HttpSession session) {
				String id = (String) session.getAttribute("SID");
				fService.getFavorView(mv, id);

				return mv;
			}

		//찜하기 리스트 정렬
		@RequestMapping("SortFavorView.jeju")
		public ModelAndView SortFavorView(ModelAndView mv, HttpSession session, FavoriteVO faVO) {
			String id = (String) session.getAttribute("SID");
			faVO.setMno(fDao.getMno(id));
			fService.sortFavorView(mv, faVO);

			return mv;
		}
}
