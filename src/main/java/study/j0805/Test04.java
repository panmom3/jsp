package study.j0805;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/test04Ok")
public class Test04 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		//응답인코딩: html 한글인코딩
		response.setContentType("text/html; charset=utf-8");
		
//		response.getWriter().append("name : " + name + "<br/>")
//			.append("age : " + age + "<br/>")
//			.append("<a href='0805/test04.jsp'>back</a>");
		
		PrintWriter out = response.getWriter();
		out.println("성명 : " + name + "<br/>");
		out.println("나이 : " + age + "<br/>");
		out.println("<a href='0805/test04.jsp'>back</a>");
	}
}
