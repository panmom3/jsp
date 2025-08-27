package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonInterface;

public class BoardGoodCheckCommand implements CommonInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요 1씩 증가시키기(중복배제)
		int res = 0;
		HttpSession session = request.getSession();
		List<String> contentReadNum = (List<String>) session.getAttribute("sContentIdx");
		if(contentReadNum == null) contentReadNum = new ArrayList<String>();
		String tempContentReadNum = "boardGood" + idx;
		if(!contentReadNum.contains(tempContentReadNum)) {
			res = dao.setBoardGoodCheck(idx);
			contentReadNum.add(tempContentReadNum);
		}
		session.setAttribute("sContentIdx", contentReadNum);
		
		response.getWriter().write(res + "");
	}

}
