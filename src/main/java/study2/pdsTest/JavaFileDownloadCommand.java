package study2.pdsTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class JavaFileDownloadCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		String realPath = request.getServletContext().getRealPath("/images/pdsTest/");
		
		File file = new File(realPath + fileName);
		
		// HTTP통신에 따른 HTTP프로토콜 형식에 맞도록 헤더에 전송할 파일의 정보를 담아준다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) response.setContentType("application/octet-stream");	// 2진 바이너리 형식으로 변화...
		
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 변경한 사항들을 헤더에 첨부처리한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// 다운로드받을 파일을 Byte단위로 처리해서 전송(bit)한다.
		FileInputStream fis = new FileInputStream(file);
		//FileOutputStream fos = new FileOutputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size = fis.read(buffer))  != -1) {
			sos.write(buffer, 0, size);
		}
		sos.flush();
		sos.close();
		fis.close();
	}

}
