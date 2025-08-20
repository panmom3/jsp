package study2.password;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/password/PassForm")
public class PassForm extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String viewPage = "/WEB-INF/study2/password/passForm.jsp";
		RequestDispatcher deDispatcher = request.getRequestDispatcher(viewPage);
		deDispatcher.forward(request, response);
	}
}
