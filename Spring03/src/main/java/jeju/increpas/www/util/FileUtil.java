package jeju.increpas.www.util;

import java.io.File;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import jeju.increpas.www.vo.FileVO;


/**
 * < Spring03 - jeju의 FileVO에 맞게 수정하였음 >
 * 파일업로드에 필요한 기능을 처리하기 위해 만든 클래스( feat.fileUpload 라이브러리 )
 * @author dhgpcks
 * @since 2020/12/15
 * @version v.1.2
 */

public class FileUtil {
	
	
	// Controller에서 saveProc만 가져다 쓰면 rename도 처리하도록 설정
	// dir 예시 ] String dir = "/img/upload";, 
	/* 
		1) FileUpload namePolicy
			: FileUpload는 이름 중복정책 설정을 따로 해줘야한다
	 		파일 이름이 중복되면 덮어쓰기를 하기 때문에 파일 이름을 바꿔서 저장한다
	 */
	
	// sample.txt	--> sample(1).txt	--> sample(2).txt
	// 같은 이름의 파일이 존재하면 파일 이름을 바꿔주는 함수
	public static String rename(String path, String oldName) {		
		int count = 0;				// 뒤에 붙일 번호를 기억할 변수
		String savename = oldName;	// 저장 이름 기억할 변수
		String tmp = oldName;		// 현재 이름 기억할 변수
		
		File file = new File(path, savename);
		
		// .을 기준으로 이름과 확장자를 분리한다.
		int len = tmp.lastIndexOf('.');
		String fileName = tmp.substring(0, len);	//파일 이름
		String fileExt = tmp.substring(len+1);		//확장자
		
		while(file.exists()) {
			// 같은 이름의 파일이 존재하는 경우 이름을 바꿔줄 예정
			// 뒤에 붙일 번호를 증가시킨다.
			count++;
			
			// 저장할 파일 이름을 다시 합친다
			savename = fileName+"("+count+")."+fileExt;
			
			// 이 이름의 파일이 존재하는지 확인하기 위해 다시 File객체로 만들어준다.
			file = new File(path, savename);
		}
		
		return savename;	// 최종 저장 이름
	}
	
	/*
	2) 파일 업로드 처리함수
		: 파일을 입력받으면 ArrayList<FileVO>로 만들어 반환해주는 함수
	 */
	
	public ArrayList<FileVO> saveProc(MultipartFile[] file, String dir){
		// 파일들 정보를 기억할 리스트르 만들고
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		
		// 저장 경로 지정 ...
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources"+ dir;
		
		try {
			for(int i = 0 ; i< file.length; i++) {
				FileVO fVO = new FileVO();
				//파일 원본이름을 알아낸다
				String oriName = file[i].getOriginalFilename();
				// 만약 파일이 업로드 되지 않는 작업이라면 이 파일은 지나가야 한다.
				if(oriName == null || oriName.length() == 0) {	//oriName ="";
					continue;
			}
				
				// 같은 이름의 파일이 존재하는지 검사한다.
				String savename = rename(path, oriName);
				
				// 이제 임시로 업로드(메모리)된 파일을 실제 저장경로에 저장해야 한다.
				// 그리고 이 이름은 데이터베이스에 등록할 때 사용해야 한다.
				
				// 저장해봅시다.
				fVO.setRponame(oriName);
				fVO.setRpsname(savename);
				fVO.setRpsize(file[i].getSize());
				fVO.setRpdir(dir);
				
				list.add(fVO);
				
				//실제 저장시켜주는 함수 : transferTo
				File tmp = new File(path, savename);
				file[i].transferTo(tmp);
				// MultipartFile로 넘어온 객체에 path와 savename을 주면
				// 저장시켜준다
			}
		}catch(Exception e) {
			System.out.println("### 파일 저장 에러 ###");
		}
		return list;
	}
	
	
}
