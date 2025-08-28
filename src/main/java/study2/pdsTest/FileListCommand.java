package study2.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class FileListCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		
		String[] files = new File(realPath).list();
		
		for(String file : files) {
			System.out.println("file : " + file);
		}
		
		request.setAttribute("files", files);
	}

}
