package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk1Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// String fName = request.getParameter("fName")==null ? "" : request.getParameter("fName");
		// System.out.println("fName : " + fName);
		
		/*
		  COS라이브러리 : MultipartRequest() / DefaultFileRenamePolicy()
		  MultipartRequest() : 
		  	MultipartRequest(서버저장소명,'서버에 저장될 파일의 경로','서버에 저장될 파일의 최대용량','코드변환방식',기타옵션(파일명중복방지처리등.))
		  	
		  	서버 파일시스템의 저장경로 : getRealPath() - 홈디렉토리(webapp)기준으로 설정
		  	ServletContext application = request.getServletContext();
				application.getRealPath("");
		*/
		// ServletContext application = request.getServletContext();
		// application.getRealPath("");
		
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장시킬 최대 파일 용량을 10MByte 제한
		String encoding = "UTF-8";
		
		// 파일 업로드 처리(객체가 생성됨과 동시에 파일이 업로드 된다.)
		//MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding);
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드시킨 파일의 정보를 추출....
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		String part = multipartRequest.getParameter("part");
		
		System.out.println("원본 파일명 : " + originalFileName);
		System.out.println("서버저장파일명 : " + filesystemName);
		System.out.println("서버파일 저장 경로명 : " + realPath);
		System.out.println("분류 : " + part);
		
		// BackEnd 파일 체크
		if(originalFileName != null && !originalFileName.equals("")) {
			request.setAttribute("message", "파일 전송 완료!!!");
		}
		else {
			request.setAttribute("message", "파일 전송 실패~~~~");
		}
		
		request.setAttribute("url", "FileUpload1.st");
	}

}
