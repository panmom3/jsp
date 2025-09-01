package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk2Command implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 최대 파일 용량을 30MByte 제한
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName1 = multipartRequest.getOriginalFileName("fName1");
		String originalFileName2 = multipartRequest.getOriginalFileName("fName2");
		String originalFileName3 = multipartRequest.getOriginalFileName("fName3");
		
		String filesystemName1 = multipartRequest.getFilesystemName("fName1");
		String filesystemName2 = multipartRequest.getFilesystemName("fName2");
		String filesystemName3 = multipartRequest.getFilesystemName("fName3");
		
		System.out.println("원본 파일명1 : " + originalFileName1);
		System.out.println("원본 파일명2 : " + originalFileName2);
		System.out.println("원본 파일명3 : " + originalFileName3);
		System.out.println("서버저장파일명1 : " + filesystemName1);
		System.out.println("서버저장파일명2 : " + filesystemName2);
		System.out.println("서버저장파일명3 : " + filesystemName3);
		System.out.println("서버파일 저장 경로명 : " + realPath);
		
		// BackEnd 파일 체크
		if(originalFileName1 != null && !originalFileName1.equals("")) {
			request.setAttribute("message", "파일 전송 완료!!!");
		}
		else {
			request.setAttribute("message", "파일 전송 실패~~~~");
		}
		
		request.setAttribute("url", "FileUpload2.st");
	}

}
