package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardContentCommand implements CommonInterface {

	@SuppressWarnings({"unchecked","unused"})
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String boardFlag = request.getParameter("boardFlag")==null ? "" : request.getParameter("boardFlag");
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
		// 게시글 조회수 1씩 증가시키기(중복방지)
		HttpSession session = request.getSession();
		List<String> contentReadNum = (List<String>) session.getAttribute("sContentIdx");
		if(contentReadNum == null) contentReadNum = new ArrayList<String>();
		String tempContentReadNum = "board" + idx;
		if(!contentReadNum.contains(tempContentReadNum)) {
			dao.setBoardReadNumPlus(idx);
			contentReadNum.add(tempContentReadNum);
		}
		session.setAttribute("sContentIdx", contentReadNum);
		
		// 현재글의 내용을 DB에서 읽어와서 vo에 담아준다.
		BoardVO vo = dao.getBoardContent(idx);
		
		// 이전글/다음글 처리하기
		BoardVO preVo  = dao.getPreNextSearch(idx, "preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx, "nextVo");
		
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		
		// 댓글 리스트 처리
		List<BoardReplyVO> replyVos = dao.getBoardReplyList(idx);
		request.setAttribute("replyVos", replyVos);
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("boardFlag", boardFlag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
	}

}
