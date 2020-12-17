package jeju.increpas.www.service;

import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.servlet.*;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;

public class MainService {
	
	@Autowired
	MainDao mDao;
	//localhost/jeju/min.jeju로 요청
	
	// < 메인 페이지 - 메인 폼 요청 > 서비스 함수
	public void getMain(ModelAndView mv, MapVO mVO) {

		if(mVO.getAx() == 0 || mVO.getAy() == 0) {
			mVO.setAx(33.23574587023389);
			mVO.setAy(126.36351258114277);
		}
		
		List<RphotoVO> rphotovoList = mDao.getReviewPhoto(mVO);
		
		List<ReviewVO> review = mDao.getReviewInfo(mVO);
		List<InfoVO> store = mDao.getStoreInfo(mVO);
		review.get(0).setRphotovoList(rphotovoList);
		
		mv.addObject("MAPx", mVO.getAx());
		mv.addObject("MAPy", mVO.getAy());
		mv.addObject("REVIEW", review);
		mv.addObject("STORE", store);
		
		mv.setViewName("main/mainPage");
		return;
	}
	
	// < 메인 페이지 - 지도 markerlist 요청 > 서비스 함수
	public String markerlist() {
		//데이터베이스 작업
		List<MapVO> list = mDao.getMarklist();
		//resp.setHeader("Content-Type", "application/xml");
		//resp.setContentType("text/xml; charset=UTF-8");
		//resp.setCharacterEncoding("UTF-8");

		StringBuffer buff = new StringBuffer();
		buff.append(" [ ");
		for(int i = 0 ; i< list.size()-1; i ++) {
			buff.append(" { ");
			buff.append("	\"title\": \"'" + list.get(i).getAname()+"'\"  " + ", ");
			buff.append("	\"x\": \"" + list.get(i).getAx() +" \", " );		
			buff.append("	\"y\": \"" + list.get(i).getAy() + " \"" );		
			buff.append(" }, ");
		};	
			buff.append(" {");
			buff.append("	\"title\": \"'" + list.get(list.size()-1).getAname()+"'\"  " + ", ");
			buff.append("	\"x\": \"" + list.get(list.size()-1).getAx() + "\", " );		
			buff.append("	\"y\": \"" + list.get(list.size()-1).getAy() + "\"" );		
			buff.append(" } ");
		
			buff.append(" ] ");
			
			return buff.toString();
	}
}
