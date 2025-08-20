package study2.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginJoinOk")
public class LoginJoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");

		LoginDAO dao = new LoginDAO();
		
		int res = 0;
		res = dao.setLoginJoin(mid, pwd, nickName, name, age, gender, address);
	
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script>");
			out.println("alert('"+mid+"님 회원가입 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/exam/Login';");
			out.println("</script>");
		}
		
		// 아이디 중복 체크
		if(dao.isDuplicateMid(mid)) {
			out.println("<script>");
			out.println("alert('아이디가 중복되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/exam/LoginJoin';");
			out.println("</script>");
		} else {
		    System.out.println("사용 가능한 아이디입니다.");
		}

		// 닉네임 중복 체크
		if(dao.isDuplicateNickName(nickName)) {
			out.println("<script>");
			out.println("alert('닉네임이 중복되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/exam/LoginJoin';");
			out.println("</script>");
		} else {
		    System.out.println("사용 가능한 닉네임입니다.");
		}
		
	}
}
