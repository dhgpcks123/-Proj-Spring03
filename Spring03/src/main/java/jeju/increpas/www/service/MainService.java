package jeju.increpas.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import jeju.increpas.www.dao.MainDao;
import jeju.increpas.www.vo.InfoVO;
import jeju.increpas.www.vo.MapVO;
import jeju.increpas.www.vo.ReviewVO;
import jeju.increpas.www.vo.RphotoVO;

public class MainService {
	
	@Autowired
	MainDao mDao;
	//localhost/jeju/min.jeju로 요청.
	// < 메인 페이지 - 메인 폼 요청 > 서비스 함수
	public void getMain(ModelAndView mv, MapVO mVO) {

		if(mVO.getAx() == 0 || mVO.getAy() == 0) {
			mVO.setAx(33.23574587023389);
			mVO.setAy(126.36351258114277);
		}
		
		List<RphotoVO> rphotovoList = mDao.getReviewPhoto(mVO);
		
		List<ReviewVO> review = mDao.getReviewInfo(mVO);
		List<InfoVO> store = mDao.getStoreInfo(mVO);
		List<MapVO> maplist = mDao.getMapInfo();
		review.get(0).setRphotovoList(rphotovoList);
		
		mv.addObject("MAPx", mVO.getAx());
		mv.addObject("MAPy", mVO.getAy());
		mv.addObject("REVIEW", review);
		mv.addObject("STORE", store);
		mv.addObject("MAPLIST", maplist);
		
		mv.setViewName("main/mainPage");
		return;
	}
	
}
