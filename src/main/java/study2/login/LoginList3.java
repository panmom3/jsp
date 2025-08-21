package study2.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@SuppressWarnings({"serial","unchecked"})
@WebServlet("/study2/login/LoginList3")
public class LoginList3 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		List<LoginVO> vos = dao.getLoginList();
		Map<String, String> map = new HashMap<String, String>();
		
		JSONArray jArray = new JSONArray();
		
		for(LoginVO vo : vos) {
			map.put("mid", vo.getMid());
			map.put("nickName", vo.getNickName());
			map.put("name", vo.getName());
			map.put("age", vo.getAge() + "");
			map.put("gender", vo.getGender());
			map.put("address", vo.getAddress());
		
			//map을 JSON으로 형변환
			JSONObject jObj = new JSONObject(map);
			jArray.add(jObj);
		}
		response.getWriter().write(jArray + "");
	}
	
}
