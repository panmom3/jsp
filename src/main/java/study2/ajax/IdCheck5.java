package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/study2/ajax/IdCheck5")
public class IdCheck5 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIdCheck(mid);
		
		String str = "";
		if(vo.getMid() == null) str = "찾는 자료가 없습니다.";
		else str = vo.getNickName();
		 
		response.getWriter().write(str);  //문서형식으로 넘김
		
	}
	
}