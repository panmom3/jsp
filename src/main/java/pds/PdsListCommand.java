package pds;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class PdsListCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "전체" : request.getParameter("part");
		//int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		//int pageSize = request.getParameter("pageSize")==null ? 30 : Integer.parseInt(request.getParameter("pageSize"));


		// 페이징처리
		
		PdsDAO dao = new PdsDAO();
		
		List<PdsVO> vos = dao.getPdsList(0, 30, part);
		
		request.setAttribute("vos", vos);
		request.setAttribute("part", part);
	}

}
