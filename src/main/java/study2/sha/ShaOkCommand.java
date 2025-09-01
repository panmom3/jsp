package study2.sha;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;
import common.SecurityUtil;

public class ShaOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String rePwd = request.getParameter("rePwd")==null ? "" : request.getParameter("rePwd");
		
		//UUID uid = UUID.randomUUID();
		
		SecurityUtil security = new SecurityUtil();
		String salt = UUID.randomUUID().toString().substring(0,4);
		pwd = security.encryptSHA256(pwd + salt);	// 암호화
		
		// 확인
		rePwd = security.encryptSHA256(rePwd + salt);
		
		System.out.println("pwd : " + pwd);
		System.out.println("rep : " + rePwd);
		
		response.getWriter().write(pwd+"/"+rePwd);
	}

}
