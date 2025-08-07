package study.j0806;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T04")
public class T04 extends HttpServlet{
	//request:요청 response:응답
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8"); //post방식의 전송은 서버에서 인코딩처리해준다.
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		
		name = URLEncoder.encode(name, "utf-8");
		// DB처리 완료후 성공여부를 jsp로 보내준다.
		response.sendRedirect(request.getContextPath()+"/study/0806/t04Ok.jsp?name="+name+"&age="+age);
	}
}
