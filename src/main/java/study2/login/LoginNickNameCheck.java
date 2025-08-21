package study2.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginNickNameCheck")
public class LoginNickNameCheck extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginNickNameCheck(nickName);
		
		int res = 0;
		if(vo.getNickName() == null) res = 1;
		
		request.setAttribute("res", res);
		request.setAttribute("nickName", nickName);
		
		String viewPage = "/WEB-INF/study2/login/loginNickNameCheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
