package jeju.increpas.www.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import jeju.increpas.www.vo.*;

public class MainDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// < 메인 페이지 -  메인 폼 요청 > 처리함수
	// 리뷰 가져오기
	public List<ReviewVO> getReviewInfo(MapVO mVO){
		return sqlSession.selectList("mSQL.getReviewInfo", mVO);
	}
	// 리뷰 사진 가져오기
	public List<RphotoVO> getReviewPhoto(MapVO mVO){
		return sqlSession.selectList("mSQL.getReviewPhoto", mVO);
	}
	// 자세히보기 가져오기
	public List<InfoVO> getStoreInfo(MapVO mVO){
		return sqlSession.selectList("mSQL.getStoreInfo", mVO);
	}

	// < 메인 페이지 - 로그인 Proc 요청 > 처리함수
	// 로그인 체크
	public int loginProc(MemberVO memberVO) {
		return sqlSession.selectOne("mSQL.loginProc", memberVO);
	}
	
	// < 메인 페이지 - 지도 markerlist 요청 > 처리함수
	// markerlist 데이터 받기
	public List<MapVO> getMarklist(){
		return sqlSession.selectList("mSQL.getMarklist");
	}
	
	
	//-------ㅂㅇ
	
	// 맵 정보 가져오기
		public List<MapVO> getMapInfo(){
			return sqlSession.selectList("mSQL.getMapInfo");
	}
	// id로 mno가져오기
	public int getMno(String id) {
		return sqlSession.selectOne("mSQL.getMno", id);
	}
	// 찜하기 중복여부 체크
	public int favorCheck(FavoriteVO faVO) {
		return sqlSession.selectOne("mSQL.favoriteCheck", faVO);
	}
	// 찜하기처리
	public void AddFavorite(FavoriteVO faVO) {
		sqlSession.selectOne("mSQL.setFavorite", faVO);
	}
}
