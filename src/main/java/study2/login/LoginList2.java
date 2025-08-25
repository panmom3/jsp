package study2.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@SuppressWarnings({"serial","unchecked"})
@WebServlet("/study2/login/LoginList2")
public class LoginList2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//LoginDAO dao = new LoginDAO();
		//List<LoginVO> vos = dao.getLoginList();
		
		Map<String, String> map = new HashMap<>(); 
		map.put("mid", "snm1234");
		map.put("nickName", "소장군");
		map.put("name", "소나무");
		map.put("age", "66");
		map.put("gender", "여자");
		map.put("address", "평양");
		
		// map형식의 자료를 JSON형식으로 변환
		JSONObject jObj = new JSONObject(map);
		
		// json형식의 자료를 json배열에 담아준다.
		JSONArray jArray = new JSONArray();
		
		jArray.add(jObj);
		
		map = new HashMap<>(); 
		map.put("mid", "lks1234");
		map.put("nickName", "이장군");
		map.put("name", "이기자");
		map.put("age", "33");
		map.put("gender", "남자");
		map.put("address", "서울");
		
		jObj = new JSONObject(map);
		jArray.add(jObj);
		System.out.println("jArray : " + jArray);
		
		response.getWriter().write(jArray + "");
	}
	
}
