package study2.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginSearch2")
public class LoginSearch2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdCheck(mid);
		
		String str = "";
		
		if(vo.getName() == null) str = "찾는 자료가 없습니다.";
		else str = vo.getIdx()+"/"+vo.getMid()+"/"+vo.getNickName()+"/"+vo.getName()+"/"+vo.getAge()+"/"+vo.getGender()+"/"+vo.getAddress();
		
		//response.getWriter().write(vo+"");
		response.getWriter().write(str);
	}
	
}
