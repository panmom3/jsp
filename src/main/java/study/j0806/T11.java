package study.j0806;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T11")
public class T11 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// null체크처리하기
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String fileName = request.getParameter("fileName")==null ? "" : request.getParameter("fileName");
		
		// 정상적으로 넘어놨는지를 서버에서 체크(찍어본다.)
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		
		// 배열로 넘어오는 자료의 편집
		// 취미 편집
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h + "/";
			}
			hobby = hobby.substring(0, hobby.length()-1);   //마지막 /(슬러시) 삭제
		} 
		System.out.println("취미: " + hobby);
		System.out.println("직업: " + job);
		
		// 가본산 편집
		String mountain = "";
		if(mountains != null) {
			for(String m : mountains) {
				mountain += m + "/";
			}
			mountain = mountain.substring(0, mountain.length()-1);
		}
		System.out.println("가본산: " + mountain);
		System.out.println("자기소개: " + content);
		System.out.println("파일명: " + fileName);
		
		// 서버에 정상적으로 처리된 자료(찍어본 자료)를 view(JSP)페이지로 전송시켜서 예쁘게 출력시켜준다.
		content = content.replace("\n","<br/>");
		
		//request저장소 
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("hobby", hobby);
		request.setAttribute("job", job);
		request.setAttribute("mountain", mountain);
		request.setAttribute("content", content);
		request.setAttribute("fileName", fileName);
		
		//request.setAttribute("message", "");
		//request.setAttribute("url", request.getContextPath()+"/study/0806/t11Ok.jsp");
		
		String viewPage = "/study/0806/t11Ok.jsp";
		//String viewPage = "/include/message.jsp";
	  
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	  dispatcher.forward(request, response);
	}
}
