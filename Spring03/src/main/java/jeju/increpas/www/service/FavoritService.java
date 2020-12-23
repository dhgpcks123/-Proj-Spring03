package jeju.increpas.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;

public class FavoritService {

	
	@Autowired
	FavorDao fDao;
	
	
	// 찜하기 목록
			public void getFavorView(ModelAndView mv, String id) {
				int mno = fDao.getMno(id);
				List<InfoVO> list = fDao.getFavoriteView(mno);

				mv.addObject("LIST", list);
				mv.setViewName("favor/favorView");
			}

			// 찜하기 목록 정렬
			public void sortFavorView(ModelAndView mv, FavoriteVO faVO) {
				List<InfoVO> list = fDao.sortFavorView(faVO);
				mv.addObject("LIST", list);		
				mv.setViewName("favor/favorView");
			}
}
