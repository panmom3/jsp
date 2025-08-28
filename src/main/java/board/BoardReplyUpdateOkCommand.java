package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardReplyUpdateOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardReplyUpdateOk(idx, content);
		
		response.getWriter().write(res + "");

	}

}
