package study.j0807;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0807/ELtest")
public class ELtest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8"); //post방식의 전송은 서버에서 인코딩처리해준다.
		
		String name2 = request.getParameter("name2")==null ? "" : request.getParameter("name2");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		request.setAttribute("name2", name2);
		request.setAttribute("job", job);
		
		String viewPage = "/study/0807/el.jsp";
	  
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	  dispatcher.forward(request, response);
	}
}
