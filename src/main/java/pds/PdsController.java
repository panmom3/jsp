package pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

@SuppressWarnings("serial")
@WebServlet("*.pds")
public class PdsController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String viewPage = "/WEB-INF/pds/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("PdsList")) {
			command = new PdsListCommand();
			command.execute(request, response);
			viewPage += "pdsList";
		}
		else if(com.equals("PdsInput")) {
			viewPage += "pdsInput";
		}
		else if(com.equals("PdsInputOk")) {
			command = new PdsInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("PdsDelete")) {
			//command = new PdsDeleteCommand();
			command.execute(request, response);
			return;
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
