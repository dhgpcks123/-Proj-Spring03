package jeju.increpas.www.interceptor;

import javax.servlet.http.*;

import org.springframework.web.servlet.*;

//이 클래스는 .jeju 로 오는 모든 요청을 인터셉트해서 로그인 여부를 검사할 예정
public class LoginCheck implements HandlerInterceptor{

	@Override
	//이 함수는 요청을 처리할 함수가 실행 되기 전에 호출되는 함수
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 세션 검사
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("SID");
		// 검사 결과에 따라 기억된 내용이 없으면 로그인 페이지로 보낸다.
		if(sid == null || sid.length() == 0) {
			response.sendRedirect("/www/main.jeju");
			// 반환 값 논리값의 의미 : 실행 된 이후 요청 처리함수를 실행할지 말지 결정
			// true: 실행, false: 실행안함
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
