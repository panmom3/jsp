package study.j0805;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0805/Test10")
public class Test10 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int su1 = 0;
		int su2 = 0;
		
		//예외처리(숫자외의 문자 입력시 에러 예외처리)
		try {
			su1 = Integer.parseInt(request.getParameter("su1"));
			su2 = Integer.parseInt(request.getParameter("su2"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		int temp = 0, tot = 0;
		
		if(su1 > su2) {
			temp = su1;
			su1 = su2;
			su2 = temp;
		}
		
		for(int i=su1;i<=su2;i++) {
			tot += i; 
		}
		
		PrintWriter out = response.getWriter();
		out.println("<p><input type='button' value='결과보기' onclick='location.href=\""+request.getContextPath()+"/study/0805/test10Ok.jsp?su1="+su1+"&su2="+su2+"&tot="+tot+"\"' /></p>");
	}
}
