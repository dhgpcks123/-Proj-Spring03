package jeju.increpas.www.dao;

import java.util.List;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.transaction.annotation.*;

import jeju.increpas.www.vo.*;

public class ReviewDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	// < 리뷰 게시판 -  리뷰쓰기 proc 요청 > 처리함수
	// 리뷰 정보 업로드 요청
	public int wReviewInfo(ReviewVO rVO) {
		return sqlSession.insert("rSQL.wReviewInfo", rVO);
	}
	// 리뷰 파일 업로드 요청
	public int wReviewFile(FileVO fVO) {
		return sqlSession.insert("rSQL.wReviewFile", fVO);
	}
	// 리뷰 정보/파일 업로드 요청
	@Transactional
	public void wReivewAll(ReviewVO rVO) {
		//게시글 등록
		wReviewInfo(rVO);
		// 첨부파일 등록
		int rno = rVO.getRno();
		int rtno = rVO.getRtno();
		List<FileVO> list = rVO.getList();
		for(FileVO fVO : list) {
			fVO.setRtno(rtno);
			fVO.setRpno(rno);
			wReviewFile(fVO);
		}
		return;
	}
	
	
	// < 리뷰 게시판 - 리뷰 수정 proc 요청 > 처리함수
	// 리뷰 정보 수정 업데이트 요청
	public int reWriteInfo(ReviewVO rVO) {
		return sqlSession.update("rSQL.reWriteInfo", rVO);
	}
	// 리뷰 파일 추가 업데이트 요청
	public int reWriteFile(FileVO fVO) {
		return sqlSession.insert("rSQL.reWriteFile", fVO);
	}
	// 리뷰 파일 삭제 업데이트 요청
	public int reWriteDel(int pno) {
		return sqlSession.update("rSQL.reWriteDel", pno);
	}
	// 리뷰 정보/파일 업데이트 요청
	@Transactional
	public void reWriteAll(ReviewVO rVO) {
		//정보수정
		reWriteInfo(rVO);
		//파일추가
		// fVO에 필요한 변수 셋팅
		int rtno = rVO.getRtno();
		int rpno = rVO.getRno();
		// 수정 할 게 있으면 값을 넣도록 한다
		if(rVO.getList() != null) {
			List<FileVO> list = rVO.getList();
			for(FileVO fVO : list) {
				fVO.setRtno(rtno);
				fVO.setRpno(rpno);
				wReviewFile(fVO);
			}
		}
		//파일삭제
		// 수정 할 게 있으면 값을 넣도록 한다
		if(rVO.getDelfile() != null) {
			System.out.println(rVO.toString());
			int[] delArray = rVO.getDelfile();
			for(int i = 0 ; i < delArray.length ; i++) {
				int pno = delArray[i];
				reWriteDel(pno);
			}
		}
		return;
	}
	
//	< 리뷰 게시판 - 리뷰 삭제 proc 요청> 처리함수 rpno지우고 rno지우고
		// 리뷰 파일 삭제 업데이트 요청
		public int delWriteFile(int rno) {
			return sqlSession.update("rSQL.delWriteFile", rno);
		}
		// 리뷰 게시글 삭제 업데이트 요청
		public int delWriteInfo(int rno) {
			return sqlSession.update("rSQL.delWriteInfo", rno);
		}
		// 리뷰 정보/파일 업데이트 요청
		@Transactional
		public int delWriteAll(int rno) {
			delWriteFile(rno);
			int cnt = delWriteInfo(rno);
			return cnt;
		}
		
}
