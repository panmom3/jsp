package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class GuestController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String viewPage = "/WEB-INF/guest/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("GuestList")) {
			command = new GuestListCommand();
			command.execute(request, response);
			viewPage += "guestList";
		}
		else if(com.equals("GuestInput")) {
			viewPage += "guestInput";
		}
		else if(com.equals("GuestInputOk")) {
			command = new GuestInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("Admin")) {
			viewPage += "admin";
		}
		else if(com.equals("AdminOk")) {
			command = new AdminOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("AdminOut")) {
			command = new AdminOutCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("GuestDelete")) {
			command = new GuestDeleteCommand();
			command.execute(request, response);
			return;
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
