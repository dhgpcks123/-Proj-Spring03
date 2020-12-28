package jeju.increpas.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import jeju.increpas.www.vo.*;


public class RecommendDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원 이름 리스트 조회 전담 처리함수
		public List<InfoVO> recommendList(){
			return sqlSession.selectList("recSQL.recommendList");
		}
}
