package study2.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginIdCheck")
public class LoginIdCheck extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIdCheck(mid);
		
		int res = 0;
		if(vo.getMid() == null) res = 1;
		
		request.setAttribute("res", res);
		request.setAttribute("mid", mid);
		
		String viewPage = "/WEB-INF/study2/login/loginIdCheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
