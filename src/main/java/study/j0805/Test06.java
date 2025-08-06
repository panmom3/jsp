package study.j0805;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/j0805/Test6_1","/j0805/Test6_2","/j0805/test06Ok"})
public class Test06 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int flag = Integer.parseInt(request.getParameter("flag")); 
		
		System.out.println("이곳은 "+flag+" Get메소드 입니다.");
		response.getWriter().append("<input type='button' value='돌아가기("+flag+")' onclick='history.back()'/>");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int flag = Integer.parseInt(requset.getParameter("flag")); 
		
		System.out.println("이곳은 Post메소드("+flag+") 입니다.");
		response.getWriter().append("<input type='button' value='(Servlet("+flag+")돌아가기' onclick='history.back()'/>");
	}
}
