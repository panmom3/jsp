package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardUpdateOkCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("pageSize"));

		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		
		BoardVO vo = new BoardVO();
		
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setOpenSw(openSw);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 수정되었습니다.");
			request.setAttribute("url", "BoardContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("message", "게시글 수정실패~~");
			request.setAttribute("url", "BoardUpdate.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
	}

}
