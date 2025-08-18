package study.jexam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings({"serial","unchecked"})
@WebServlet("/jexam/Ex03_1")
public class Ex03_1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		int tot = kor + eng + mat;
		double avg = tot / 3.0;
		
		String grade;
		if(avg >= 90) grade ="A";
		else if(avg >= 80) grade = "B";
		else if(avg >= 70) grade = "C";
		else if(avg >= 60) grade = "D";
		else grade = "F";
		
		GrdVO vo = new GrdVO();
		vo.setName(name);
		vo.setKor(kor);
		vo.setEng(eng);
		vo.setMat(mat);
		vo.setTot(tot);
		vo.setAvg(avg);
		vo.setGrade(grade);
		
		// 세션에서 리스트 가져오기
    HttpSession session = request.getSession();
    List<GrdVO> vos = (List<GrdVO>) session.getAttribute("vos");
    if (vos == null) vos = new ArrayList<>();

    // 현재 입력 추가
    vos.add(vo);
		
		// 순위계산
		for(GrdVO v1 : vos) {
			int rank = 1;
			for(GrdVO v2 : vos) {
				if(v2.getAvg() > v1.getAvg()) rank++;			
			}
			v1.setRank(rank);
		}
		
		// 세션에 다시 저장
		session.setAttribute("vos", vos);
		
		// 뷰에 처리된 내용 넘겨준다
		//request.setAttribute("vos", vos);
		String viewPage = "/study/exam/ex03_vos1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
