package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;
import study2.login.LoginDAO;
import study2.login.LoginVO;

public class AdminOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdCheck(mid);
		
		if(vo.getMid() != null) {
			// 비밀번호 복호화(X), 로그인시 입력된 비밀번호를 salt값과 함께 암호화 시킨후 DB비밀번호와 비교한다.
			String salt = vo.getPwd().substring(0, 5);
			pwd = salt + (Integer.parseInt(pwd) ^ Integer.parseInt(salt)) + "";
			
			if(vo.getPwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("sAdmin", "adminOK");
				
				request.setAttribute("message", "관리자 인증 성공!!!");
				request.setAttribute("url", "GuestList.gu");
			}
		}
		else {
			request.setAttribute("message", "관리자 인증 실패~~");
			request.setAttribute("url", "Admin.gu");
		}
		
	}

}
