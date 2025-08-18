package study2.init;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
//@WebServlet("/springGroup")
public class OfficeInit extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("이곳은 /springGroup 서블릿입니다.");
		
		// web.xml에서 넘어온 초기값을 세션에 담아준다.
		String className = getInitParameter("className");
		String mid = getInitParameter("mid");
		
		request.setAttribute("className", className);
		request.setAttribute("mid", mid);
		
		String viewPage = "/WEB-INF/study2/init/login.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
