package jeju.increpas.www.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import jeju.increpas.www.dao.*;
import jeju.increpas.www.vo.*;
import jeju.increpas.www.util.*;
import jeju.increpas.www.controller.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

@Controller
@RequestMapping("/member")
public class Member {
	
	@Autowired
	MemberDao mbDao;
	
	
	@RequestMapping("/login.jeju") // 클래스의 /member 와 함수의 /login.www 를 합쳐서 /member/login.www 로 처리
	public String loginPage() {
		return "member/login";
	}
	@RequestMapping("/memberJoinEnd.jeju") // 클래스의 /member 와 함수의 /login.www 를 합쳐서 /member/login.www 로 처리
	public String memberJoinEnd() {
		return "member/memberJoinEnd";
	}

	private static final Logger logger = LoggerFactory.getLogger(Member.class);
	
	@RequestMapping(path="/loginProc.jeju", params={"id", "pw"}, method=RequestMethod.POST)
	public ModelAndView loginProc(ModelAndView mv, RedirectView rd,
									HttpSession session, MemberVO mVO) {
		int cnt = mbDao.loginCnt(mVO);
		if(cnt == 0) {
			rd.setUrl("/www/main.jeju");
		} else {
			session.setAttribute("SID", mVO.getId());
//			logger.info(mVO.getId() + " ] - *** Login ***");
			rd.setUrl("/www/main.jeju");
		}
		
		mv.setView(rd);
	//	System.out.println("########");
		return mv;
	}
	
	@RequestMapping("/memberInfo.jeju")
	public ModelAndView getInfo(ModelAndView mv, HttpSession session, 
			RedirectView rv, String id,String msg) {
		
		if(msg != null) {
			mv.addObject("MSG",msg);
			
		}
		if(id != null) {
			mv.addObject("ID",id);
		}
		if(id == null || id=="") {
			rv.setUrl("/www/main.jeju");
			mv.setView(rv);	// redirect 로 뷰를 호출하는 경우
		} else {

			mv.setViewName("member/memberInfo");	//  forward로 뷰 를 부르는 경우 
			MemberVO mbVO = mbDao.getInfo(id);
			
			List<MemberVO> list1 = mbDao.bloodList1();	// 혈액형 리스트 불러오기
			List<MemberVO> list2 = mbDao.bloodList2();	// 혈액형 리스트 불러오기
			
			mv.addObject("DATA", mbVO);
			mv.addObject("LIST1",list1);
			mv.addObject("LIST2",list2);
		}
		
		return mv;
	}
	
	@RequestMapping("/memberInfo2.jeju")
	@ResponseBody
	public MemberVO getInfo(MemberVO mbVO) {
		System.out.println("### vo id : "+ mbVO.getMno());
		
		mbVO = mbDao.getInfo(mbVO.getMno());
		return mbVO;
	}
	
	@RequestMapping(value="/memberInfo.jeju", params="mno", method=RequestMethod.POST)
	public ModelAndView getInfo(ModelAndView mv, int mno) {
		
		MemberVO mbVO = mbDao.getInfo(mno);
		
		mv.addObject("DATA", mbVO);
		mv.setViewName("member/memberInfo");	//  forward로 뷰 를 부르는 경우 
		return mv;
	}
	
	@RequestMapping("/memberEditProc.jeju")
	public ModelAndView memberEditProc(ModelAndView mv, MemberVO mbVO) {
		String msg = "수정실패";
		/*
		mv.setViewName("redirect:/member/memberInfo.jeju?id=" + mbVO.getId() + "&msg" + msg);
		 	jsp에서 파라미터 꺼내서 사용하는 방법
		 	
		 	${param.msg}
		 	
		 	이 경우 전달되는 데이터는 주소 표시줄에 노출이 되고
		 	데이터를 꺼내는 구문도 길어짐
		 	따라서  여기서는 리다이렉트 jsp 페이지를 만들고 
		 	해당 페이지가 열리면 바로 post 방식으로 리다이렉트가 이루어지도록 처리 
		 */
		int cnt = mbDao.editMember(mbVO);
		if(cnt == 1) {
			// 수정에 성공한 경우
			msg = "수정성공!";
		}
		
		mv.setViewName("member/redirect"); // forward 방식 뷰 호출

		mv.addObject("ID",mbVO.getId());
		mv.addObject("MSG",msg);
		
		return mv;
	}
	
	
	@RequestMapping("/logout.jeju")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		// 세션에 기록 내용(속성 : SID)을 지운다.
//		String sid = (String) session.getAttribute("SID");
		System.out.println("### controller logout ");
		session.removeAttribute("SID");
//		logger.info(sid+" ] - ### log out ###");
		// 뷰를 지정한다.
		mv.setViewName("redirect:/main.jeju");
		
		return mv;
	}
	
	@RequestMapping(value="/memberDel.jeju", method=RequestMethod.POST)
	public ModelAndView memberDel(ModelAndView mv, HttpSession session, MemberVO mbVO) {
		int cnt = mbDao.outMember(mbVO);
		
		if(cnt == 1) {
			// 이 경우는 회원 탈퇴에 성공한 경우이므로
			// 세션에 기록된 데이터 지우고
			session.removeAttribute("SID");
			// 메인페이지로 돌려보낸다.
			mv.setViewName("redirect:/main.jeju");
		} else {
			// 처리에 실패한 경우이므로 회원상세정보페이지로 다시 보낸다.
			mv.setViewName("redirect:/member/memberInfo.jeju");
		}
		return mv;
	}
	// 회원가입 약관동의 페이지 폼보기 요청
		@RequestMapping("/memberJoin.jeju") 
		public String memberJoin() {
			return "member/memberJoin";
		}

		// 회원가입 개인정보 페이지 폼보기 요청
		@RequestMapping("/memberJoinProc.jeju") 
		public String memberJoinInfo() {
			return "member/memberJoinInfo";
		}

		// 아이디 체크
		@RequestMapping("/memberIdCheck.jeju") 
		@ResponseBody
		public Map<String, String> idCheck(String id) {
			//  할일
			// 데이베이스에서 조회하고
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("result", (mbDao.getIdCnt(id) == 0) ? "OK" : "NO");
			return map;
		}

		// 회원가입 가입 처리 요청 
		@RequestMapping(value="/joinProc.jeju", method=RequestMethod.POST)
		public ModelAndView joinProc(ModelAndView mv, HttpSession session, MemberVO mbVO ) {
			int cnt = 0;
			try {
				cnt = mbDao.insertMember(mbVO);
			} catch (Exception e) {
				e.printStackTrace();
				cnt=0;
			}
			if(cnt == 1) {
				// 성공하면 로그인처리하고
				session.setAttribute("SID", mbVO.getId());
				
				// 데이터 가져오기 
				String id = mbVO.getId();
				if(id != null) {
					mbVO=mbDao.getInfo(id);
					mv.addObject("DATA",mbVO);
				}
				// 가입완료페이지로 이동하고
				mv.setViewName("member/memberJoinEnd");
			} else {
				// 실패한 경우
				// 회원가입페이지로 다시 이동시키고
				mv.setViewName("redirect:/member/memberJoin.jeju");
			}

			return mv;
		}

}
