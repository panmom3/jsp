package board;

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
@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonInterface command = null;
		String viewPage = "/WEB-INF/board/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		if(mid == null) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/study2/login/Login");
			viewPage = "/include/message";
		}
		else if(com.equals("BoardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "boardList";
		}
		else if(com.equals("BoardInput")) {
			viewPage += "boardInput";
		}
		else if(com.equals("BoardInputOk")) {
			command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("BoardContent")) {
			command = new BoardContentCommand();
			command.execute(request, response);
			viewPage += "boardContent";
		}
		else if(com.equals("BoardGoodCheck")) {
			command = new BoardGoodCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("BoardGoodCheckPlusMinus")) {
			command = new BoardGoodCheckPlusMinusCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("BoardDelete")) {
			command = new BoardDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("BoardUpdate")) {
			command = new BoardUpdateCommand();
			command.execute(request, response);
			viewPage += "boardUpdate";
		}
		else if(com.equals("BoardUpdateOk")) {
			command = new BoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("BoardSearchList")) {
			command = new BoardSearchListCommand();
			command.execute(request, response);
			viewPage += "boardSearchList";
		}
		else if(com.equals("BoardReplyInput")) {
			command = new BoardReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("BoardReplyDelete")) {
			command = new BoardReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("BoardReplyUpdateOk")) {
			command = new BoardReplyUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		viewPage += ".jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
