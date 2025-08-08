package study.j0807;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.j0806.T12VO;

@SuppressWarnings("serial")
@WebServlet("/j0807/JSTLtest1_1")
public class JSTLtest1_1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		//작업(DB)처리 완료후 view로 처리된 내용을 넘겨준다.
		T12VO vo = new T12VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setJob(job);

		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0807/jstl1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	  dispatcher.forward(request, response);
	}
}
