package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardSearchListCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardVO> vos = dao.getBoardSearchList(search, searchString);
		
		String searchStr = "";
		if(search.equals("title")) searchStr = "글제목";
		else if(search.equals("nickName")) searchStr = "글쓴이";
		else if(search.equals("content")) searchStr = "글내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchStr", searchStr);
		request.setAttribute("searchString", searchString);
	}

}
