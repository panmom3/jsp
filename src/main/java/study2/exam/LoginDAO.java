package study2.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
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
	
	// 아이디 검색
	public LoginVO getLoginIdCheck(String mid, String pwd) {
		vo = new LoginVO(); 
		try {
			sql = "select * from friend where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
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
			System.out.println("SQL오류~~" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
}
