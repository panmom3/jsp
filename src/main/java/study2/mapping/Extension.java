package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class Extension extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("url : " + request.getRequestURL());
		//System.out.println("uri : " + request.getRequestURI());
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println("com : " + com);
		
		String msg = "";
		
		if(com.equals("home")) {
			msg = "home";
		}
		else if(com.equals("guest")) {
			msg = "guest";
		}
		else if(com.equals("board")) {
			msg = "board";
		}
		else if(com.equals("pds")) {
			msg = "pds";
		}
		
		request.setAttribute("msg", msg);
		
		String viewPage = "/WEB-INF/study2/mapping/extension.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
