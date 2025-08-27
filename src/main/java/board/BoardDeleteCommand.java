package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardDeleteCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("pageSize"));

		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardDelete(idx);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 삭제되었습니다.");
			request.setAttribute("url", "BoardList.bo");
		}
		else {
			request.setAttribute("message", "게시글 삭제실패~~");
			request.setAttribute("url", "BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}

}
