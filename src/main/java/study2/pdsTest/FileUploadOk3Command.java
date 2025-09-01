package study2.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonInterface;

public class FileUploadOk3Command implements CommonInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 최대 파일 용량을 30MByte 제한
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출한다.
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String oFileName = "";
		String fsName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			oFileName += multipartRequest.getOriginalFileName(file) + "/";
			fsName += multipartRequest.getFilesystemName(file) + "/";
		}
		oFileName = oFileName.substring(0, oFileName.length()-1);
		fsName = fsName.substring(0, fsName.length()-1);
		
		System.out.println("원본 파일명 : " + oFileName);
		System.out.println("서버저장파일명 : " + fsName);
		System.out.println("서버파일 저장 경로명 : " + realPath);
		
		if(oFileName != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일 전송 완료!!!");
		}
		else {
			request.setAttribute("message", "파일 전송 실패~~~~");
		}
		
		request.setAttribute("url", "FileUpload3.st");
	}

}
