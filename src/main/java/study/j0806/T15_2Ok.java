package study.j0806;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T15_2Ok")
public class T15_2Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		int kor = (request.getParameter("kor")==null || request.getParameter("kor").equals("")) ? 0 : Integer.parseInt(request.getParameter("kor"));
		int eng = (request.getParameter("eng")==null || request.getParameter("eng").equals("")) ? 0 : Integer.parseInt(request.getParameter("eng"));
		int mat = (request.getParameter("mat")==null || request.getParameter("mat").equals("")) ? 0 : Integer.parseInt(request.getParameter("mat"));
		int sci = (request.getParameter("sci")==null || request.getParameter("sci").equals("")) ? 0 : Integer.parseInt(request.getParameter("sci"));
		int soc = (request.getParameter("soc")==null || request.getParameter("soc").equals("")) ? 0 : Integer.parseInt(request.getParameter("soc"));
		
		int tot = kor+eng+mat+sci+soc;
		double avg = tot / 5.0;
		String grade = "";
		
		switch ((int) avg / 10) {
			case 10:
			case 9: grade = "A"; break;
			case 8: grade = "B"; break;
			case 7: grade = "C"; break;
			case 6: grade = "D"; break;
			default: grade = "F";
		}
		
		T15VO vo = new T15VO(name, hakbun, kor, eng, mat, sci, soc, tot, avg, hostIp, grade);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0806/t15_res.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
