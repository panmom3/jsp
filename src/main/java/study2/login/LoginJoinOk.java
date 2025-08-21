package study2.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/login/LoginJoinOk")
public class LoginJoinOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO voMid = dao.getLoginIdCheck(mid);
		LoginVO voNickName = dao.getLoginNickNameCheck(nickName);
		
		PrintWriter out = response.getWriter();
		if(voMid.getMid() != null || voNickName.getNickName() != null) {
			out.println("<script>");
			out.println("alert('중복된 정보입니다.\n회원 아이디나 닉네임을 확인하세요');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin';");
			out.println("</script>");
		}
		
		// 비밀번호 암호화
		// salt값 구하기
		int salt = (int)(Math.random()*99999-10001+1)+10001;
		int encPwd = Integer.parseInt(pwd) ^ salt;
		pwd = String.valueOf(salt) + String.valueOf(encPwd);
		
		LoginVO vo = new LoginVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		int res = dao.setLoginJoinOk(vo);
		
		if(res != 0) {
			out.println("<script>");
			out.println("alert('회원가입 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/Login';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원가입 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/study2/login/LoginJoin';");
			out.println("</script>");
		}

	}
	
}
