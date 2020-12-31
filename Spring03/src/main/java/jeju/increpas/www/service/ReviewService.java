package jeju.increpas.www.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.servlet.*;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;
import jeju.increpas.www.util.*;

public class ReviewService {

	@Autowired
	ReviewDao rDao;
	
	@Autowired
	FileUtil fileUtil;
	
	// < 리뷰 게시판 - 리뷰쓰기 proc 요청 > 서비스함수
	public void wReviewProc(ModelAndView mv, ReviewVO rVO, MapVO mVO) {
		String rdir = "img/area/";
		ArrayList<FileVO> list = fileUtil.saveProc(rVO.getFile(), rdir);
		
		//BoardVO의 list에 채워주고
				rVO.setList(list);
				
				try{
					rDao.wReivewAll(rVO);
					// 데이터베이스 작업이 완료되면 게시글 리스트 첫페이지로 보낸다
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("### 글 등록 실패 ###");
				}
				mv.setViewName("main/reviewRedirect");
				return;
	}
	
	// < 리뷰 게시판 - 리뷰 수정 proc 요청 > 서비스 함수
	public void reWriteProc(ModelAndView mv, ReviewVO rVO, MapVO mVO) {
		String rdir = "img/review/";
		ArrayList<FileVO> list = fileUtil.saveProc(rVO.getFile(), rdir);
		rVO.setList(list);
		try {
			rDao.reWriteAll(rVO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("### 글 업데이트 실패 ###");
		}
		mv.setViewName("main/reviewRedirect");
		return;
	}
	
}
