package study2.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO {
	private Connection conn = null;  //DB와 연결(접속) 을 담당하는 객체.
	private PreparedStatement pstmt = null;  //SQL을 실행하는 객체.
	private ResultSet rs = null;  //SELECT 쿼리 실행 결과(테이블 형태)를 저장하는 객체.
	
	String sql = "";
	LoginVO vo = null;
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/springgroup";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB연동 실패~~" + e.getMessage());
		}
	}
	
	// conn 반납
	public void connClose() {
		if(conn != null) {
			try {conn.close();} catch (SQLException e) {}
		}
	}
	// pstmt 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {pstmt.close();} catch (SQLException e) {}
		}
	}
	//rs 반납
	public void rsClose() {
		if(rs != null) {
			try {rs.close();pstmt.close();} catch (SQLException e) {}
		}
	}
	
	// 아이디 검색(아이디 중복체크)
	public LoginVO getLoginIdCheck(String mid) {
		vo = new LoginVO(); 
		try {
			sql = "select * from friend where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginIdCheck)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	public LoginVO getLoginNickNameCheck(String nickName) {
		vo = new LoginVO(); 
		try {
			sql = "select * from friend where nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginNickNameCheck)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	// 회원가입처리
	public int setLoginJoinOk(LoginVO vo2) {
		int res = 0;
		try {
			sql = "insert into friend values (default,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setInt(5, vo.getAge());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getAddress());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setLoginJoinOk)~~" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 전체 회원 리스트
	public List<LoginVO> getLoginList() {
		List<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "select * from friend order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getLoginList)~~" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
