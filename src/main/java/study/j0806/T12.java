package study.j0806;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0806/T12")
public class T12 extends HttpServlet {
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
		
		// BackEnd 체크완료후 정상적인 자료를 DB에 저장시켜준다.(저장완료 메세지(message)를 호출후 최종 View페이지(url)로 이동처리한다.)
		
		// View페이지에서 앞의 자료를 보여주기위해 vo객체에 모두 담은후 request저장소에 실어 넘겨준다.
		T12VO vo = new T12VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setHobby(hobby);
		vo.setJob(job);
		vo.setMountain(mountain);
		vo.setContent(content);
		vo.setFileName(fileName);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0806/t12Ok.jsp";
	  
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	  dispatcher.forward(request, response);
	}
}
