package jeju.increpas.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import jeju.increpas.www.vo.*;


public class FavorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	// id로 mno가져오기
	public int getMno(String id) {
		return sqlSession.selectOne("fSQL.getMno", id);
	}

	// 찜하기 중복여부 체크
	public int favorCheck(FavoriteVO faVO) {
		return sqlSession.selectOne("fSQL.favoriteCheck", faVO);
	}

	// 찜하기처리
	public void AddFavorite(FavoriteVO faVO) {
		sqlSession.selectOne("fSQL.setFavorite", faVO);
	}

	// 찜한 목록 불러오기
	public List<InfoVO> getFavoriteView(int mno){
		return sqlSession.selectList("fSQL.favorView", mno);
	}

	// 찜목록 정렬
	public List<InfoVO> sortFavorView(FavoriteVO faVO){
		return sqlSession.selectList("fSQL.favorSort", faVO);
	}
}