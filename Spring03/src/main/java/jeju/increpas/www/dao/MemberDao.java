
package jeju.increpas.www.dao;

import java.util.*;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import jeju.increpas.www.vo.*;


public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인조회 전담 처리함수
	public int loginCnt(MemberVO mbVO) {
		return sqlSession.selectOne("mbSQL.login", mbVO);
	}
	
	// 회원 정보조회 전담 처리함수
	public MemberVO getInfo(String id) {
		return sqlSession.selectOne("mbSQL.getInfo", id);
	}
	
	// 회원 정보조회 전담 처리함수
	public MemberVO getInfo(int tno) {
		return sqlSession.selectOne("mbSQL.getInfoNo", tno);
	}
	
	// 회원 탈퇴 전담 처리함수
	public int outMember(MemberVO mbVO) {
		return sqlSession.update("mbSQL.del_memb", mbVO);
	}

	
	// 회원 아이디체크 전담 처리함수
	public int getIdCnt(String id) {
		return sqlSession.selectOne("mbSQL.idCount", id);
	}
	
	// 회원 가입 전담 처리함수
	public int insertMember(MemberVO mbVO) {
		return sqlSession.insert("mbSQL.addMember", mbVO);
	}
	
	@Transactional
	// 여러 회원가입 트랜젝션 테스트 전담함수
	public int insertMember(ArrayList<MemberVO> list) {
		int cnt=0;
		for(MemberVO mbVO:list) {
			System.out.println("### dao vo id : "+mbVO.getId());
			cnt += insertMember(mbVO);
		}
		return cnt;
	}
	
	// 회원정보 수정 전담 처리함수
	public int editMember(MemberVO mbVO) {
		return sqlSession.update("mbSQL.editMember",mbVO);
	}
}
