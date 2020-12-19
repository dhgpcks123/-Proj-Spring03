package jeju.increpas.www.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;

@Controller
public class SuggestController {
	
	@Autowired
	SuggestDao suggestDao;
	
	
	// < 장소추천 페이지 - 장소추천 폼 요청 >
	@RequestMapping("/suggest.jeju")
	public ModelAndView getSuggestForm(ModelAndView mv) {
		mv.setViewName("suggestBoard/suggestBoard");
		return mv;
	}
	
	// < 장소추천 페이지 - 추천장소 뽑기 요청 >
	@ResponseBody
	@RequestMapping("/suggestLoc.jeju")
	public InfoVO getSuggestLoc(HttpServletRequest req, StringBuffer buff) {
//		StringBuffer buff = new StringBuffer();
		InfoVO areaInfoVO = null;
		try {
			//이 경우는 10, 20, 30 중 하나가 뽑힌 경우
			int atno = Integer.parseInt(req.getParameter("atno"));
			//atno에 속한 ano를 뽑아온다.
			List anoList= suggestDao.getAno(atno);
			// 안에 숫자를 랜덤하게 섞어주고
			Collections.shuffle(anoList);
			
			int ano = (int) anoList.get(0);
			//이 번호에 대한 정보를 가져와야한다.
			areaInfoVO = suggestDao.getAreaInfo(ano);
		}catch(Exception e) {
			//이 경우는 all인 경우이다.
			List anoList = suggestDao.getAllAno();
			Collections.shuffle(anoList);
			int ano = (int) anoList.get(0);
			areaInfoVO = suggestDao.getAreaInfo(ano);
		}
		
		return areaInfoVO;
	}
	
}
