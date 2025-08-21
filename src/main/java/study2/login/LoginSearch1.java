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
@WebServlet("/study2/login/LoginSearch1")
public class LoginSearch1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdCheck(mid);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", vo.getMid());
		map.put("nickName", vo.getNickName());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+"");
		map.put("gender", vo.getGender());
		map.put("address", vo.getAddress());
		System.out.println("map : " + map);
		
		// map형식의 자료를 JSON형식으로 변환
		JSONObject jObj = new JSONObject(map);
		System.out.println("jObj : " + jObj);
		response.getWriter().write(jObj + "");
		
		// JSON객체를 문자열로 변환
//		String str = jObj.toJSONString();
//		System.out.println("str : " + str);
//		response.getWriter().write(str);
	}
	
}
