package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.test5")
public class Extension5Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Extension4Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		// 로그인 체크
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		if(mid == null) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("Home5")) {
			command = new Home5Command();
			command.execute(request, response);
			viewPage += "home5";
		}
		else if(com.equals("Guest5")) {
			command = new Guest5Command();
			command.execute(request, response);
			viewPage += "guest5";
		}
		else if(com.equals("Board5")) {
			command = new Board5Command();
			command.execute(request, response);
			viewPage += "board5";
		}
		else if(com.equals("Pds5")) {
			command = new Pds5Command();
			command.execute(request, response);
			viewPage += "pds5";
		}
		else {
			viewPage += "extension5";
		}
		viewPage += ".jsp";
		System.out.println("viewPage : " + viewPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
