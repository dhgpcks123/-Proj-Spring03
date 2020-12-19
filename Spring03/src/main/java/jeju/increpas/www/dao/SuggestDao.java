package jeju.increpas.www.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import jeju.increpas.www.vo.*;

public class SuggestDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	// < 장소추천 페이지 - 추천장소 뽑기 요청 > 질의명령
	// 유형(atno)에 속한 ano 뽑아내기
	public List getAno(int atno){
		return sqlSession.selectList("suggestSQL.getAno", atno);
	}
	// AreaInfo(ano)로 장소의 정보를 가져오기
	public InfoVO getAreaInfo(int ano) {
		return sqlSession.selectOne("suggestSQL.getAreaInfo", ano);
	}
	// atno가 10, 20, 30인 ano값을 뽑아오기
	public List getAllAno(){
		return sqlSession.selectList("suggestSQL.getAllAno");
	}
}
