package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Guest5Command implements Extension4Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Guest5Command객체 입니다.");
		request.setAttribute("msg", "이곳은 Guest5Command객체 입니다.");
	}

}
