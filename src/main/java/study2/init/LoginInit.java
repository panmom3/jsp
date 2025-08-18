package study2.init;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/init/login")
public class LoginInit extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("이곳은 /study2/init/login 서블릿입니다.");
		
		// web.xml에서 넘어온 공통변수를 세션에 담아준다.
		String officeName = getServletContext().getInitParameter("officeName");
		String officeEmail = getServletContext().getInitParameter("officeEmail");
		
		// application객체 사용하기 위한 생성처리
		ServletContext application = request.getServletContext();
		application.setAttribute("aTest", "값");
		
		// session객체 사용하기 위한 생성처리
		HttpSession session = request.getSession();
		
		session.setAttribute("sOfficeName", officeName);
		session.setAttribute("sOfficeEmail", officeEmail);
		
		String viewPage = "/WEB-INF/study2/init/login.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
