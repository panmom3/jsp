package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.test3")
public class Extension3Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("home3")) {
			Home3Command command = new Home3Command();
			command.execute(request, response);
			viewPage += "home3";
		}
		else if(com.equals("guest3")) {
			Guest3Command command = new Guest3Command();
			command.execute(request, response);
			viewPage += "guest3";
		}
		else if(com.equals("board3")) {
			Board3Command command = new Board3Command();
			command.execute(request, response);
			viewPage += "board3";
		}
		else if(com.equals("pds3")) {
			Pds3Command command = new Pds3Command();
			command.execute(request, response);
			viewPage += "pds3";
		}
		else {
			viewPage += "extension3";
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
