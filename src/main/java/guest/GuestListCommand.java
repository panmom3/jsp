package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class GuestListCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 현재 페이지번호를 구해온다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		
		// 2. 한 페이지 분량을 구한다.(여기선 1Page당 5건으로 한다.)
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다.(sql명령어(함수)중 count함수를 이용)
		int totRecCnt = dao.getTotRecCnt();
		
		int pageCb = request.getParameter("pageCb")==null ? 1 : Integer.parseInt(request.getParameter("pageCb"));
		pageCb =  pageSize + 5;
		
		// 4. 총 페이지 건수를 구한다.
		int totPage = (int) Math.ceil(totRecCnt / pageSize);
		
		// 5. 현재페이지에서 출력시켜줄 '시작 인덱스번호'를 구한다.
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시될 시작 실제 번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;

		List<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		// 블록페이징처리(시작블록을 0으로 처리했다. 1블록의 크기는 3)
		// 1.블록의 크기결정(3)
		int blockSize = 3;
		
		// 2.현재 페이지가 속한 블록번호를 구한다.(예:총 레코드수가 23개일경우, 1페이지분량이 5개일경우, 총페이지수는 5Page이다.
		// 	이떄 0블록은 '1/2/3', 1블록은 '4/5'
		int curBlock = (pag - 1) / blockSize;
		
		// 3.마지막 블록 구하기 : 앞의 조건인경우는 마지막블록이 1이 된다.
		int lastBlock = (totPage - 1) / blockSize;
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageCb", pageCb);
		
		request.setAttribute("vos", vos);
	}

}
