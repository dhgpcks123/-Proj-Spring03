package jeju.increpas.www.aop;

import javax.servlet.http.*;
import org.aspectj.lang.*;
import org.aspectj.lang.annotation.*;
import org.slf4j.*;
import org.springframework.stereotype.*;

// 찜하기를 클릭했을 경우 log 처리해줄 AOP클래스이다.

@Service
@Aspect
public class FavoritAOP {
	private static Logger log = LoggerFactory.getLogger(FavoritAOP.class);
	
	@Pointcut("execution(* jeju.increpas.www.controller.FavoritController.AddFavorite(..))")
	public void addFavoriteAspect() {}
	
	@After("addFavoriteAspect()")
	public void recordAddFaovrite(JoinPoint join) {
		HttpServletRequest req = (HttpServletRequest) join.getArgs()[0];
		HttpSession session = (HttpSession) join.getArgs()[1];
		String ano = (String) req.getParameter("ANO");
		String sid = (String) session.getAttribute("SID");
		if(sid == null || sid.length() != 0) {
			log.info(sid+"님 ] "+ano+" 번 게시글을 북마크 하였습니다");
		}
	}


}
