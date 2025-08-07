package study.j0806;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T10")
public class T10 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		if(mid.equals("admin") && pwd.equals("1234")) {
			//response.sendRedirect(request.getContextPath()+"/study/0806/t10_member.jsp?mid="+mid+"&msgFlag=ok");
			String viewPage = "/include/message.jsp?mid="+mid+"&message="+mid+"님 로그인 되었습니다.";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath()+"/study/0806/t10_login.jsp?msgFlag=no");
		}
	}
	
}
