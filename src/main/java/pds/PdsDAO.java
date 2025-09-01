package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class PdsDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql;
	PdsVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

	// 게시글 전체보기
	public List<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		List<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			if(part.equals("전체")) {
				sql = "select *,"
					+ "  timestampdiff(hour, fDate, now()) as hour_diff, "
					+ "  datediff(now(), fDate) as date_diff "
					+ "  from pds b order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select *,"
						+ "  timestampdiff(hour, fDate, now()) as hour_diff, "
						+ "  datediff(now(), fDate) as date_diff "
						+ "  from pds b where part=? order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setPwd(rs.getString("pwd"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getPdsList) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return vos;
	}
	
	// 자료실에 자료 등록하기
	public int setPdsInputOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "insert into pds values (default,?,?,?,?,?,?,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getPart());
			pstmt.setString(7, vo.getTitle());
			pstmt.setString(8, vo.getContent());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getPwd());
			pstmt.setString(11, vo.getHostIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setBoardInputOk) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}	
	
	
/*
	// 전체 게시글의 수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql오류(getTotRecCnt) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return totRecCnt;
	}

	// 게시글 상세보기위한 1건의 자료 추출
	public PdsVO getBoardContent(int idx) {
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setfDate(rs.getString("fDate"));
				vo.setGood(rs.getInt("good"));
				vo.setComplaint(rs.getString("complaint"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류(getBoardContent) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return vo;
	}

	// 글 조회수 1씩 증가시키기
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류(setBoardReadNumPlus) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
	}

	// 좋아요 횟수 증가시키기
	public int setBoardGoodCheck(int idx) {
		int res = 0;
		try {
			sql = "update board set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류(setBoardGoodCheck) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 좋아요 횟수 증가/감소 처리
	public int setBoardGoodCheckPlusMinus(int idx, int gooCnt) {
		int res = 0;
		try {
			sql = "update board set good = good + ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gooCnt);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류(setBoardGoodCheckPlusMinus) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 삭제처리
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류(setBoardDelete) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 수정처리
	public int setBoardUpdateOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "update board set title=?, content=?, openSw=?, hostIp=?, fDate=now() where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류(setBoardDelete) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 이전글, 다음글 처리
	public PdsVO getPreNextSearch(int idx, String str) {
		vo = new PdsVO();
		try {
			if(str.equals("preVo")) sql = "select idx, title from board where idx < ? order by idx desc limit 1";
			else sql = "select idx, title from board where idx > ? order by idx limit 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류(getPreNextSearch) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return vo;
	}

	// 게시글 조건 검색처리(검색기)
	public List<PdsVO> getBoardSearchList(String search, String searchString) {
		List<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			sql = "select *,"
					+ "  timestampdiff(hour, fDate, now()) as hour_diff, "
					+ "  datediff(now(), fDate) as date_diff "
					+ "  from board "
					+ "  where "+search+" like ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setfDate(rs.getString("fDate"));
				vo.setGood(rs.getInt("good"));
				vo.setComplaint(rs.getString("complaint"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getBoardSearchList) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return vos;
	}

	// 원본글의 댓글 리스트 가져오기
	public List<BoardReplyVO> getBoardReplyList(int idx) {
		List<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
		try {
			sql = "select * from boardReply where boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardReplyVO rVo = new BoardReplyVO();
				rVo.setIdx(rs.getInt("idx"));
				rVo.setBoardIdx(rs.getInt("boardIdx"));
				rVo.setMid(rs.getString("mid"));
				rVo.setNickName(rs.getString("nickName"));
				rVo.setfDate(rs.getString("fDate"));
				rVo.setHostIp(rs.getString("hostIp"));
				rVo.setContent(rs.getString("content"));
				
				replyVos.add(rVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(getBoardReplyList) : " + e.getMessage());
		}
		finally {
			rsClose();
		}
		return replyVos;
	}

	// 댓글 저장 처리
	public int setBoardReplyInputOk(BoardReplyVO vo) {
		int res = 0;
		try {
			sql = "insert into boardReply values (default,?,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setBoardReplyInputOk) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 댓글 삭제 처리
	public int setBoardReplyDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from boardReply where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setBoardReplyInputOk) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}

	// 댓글 수정처리
	public int setBoardReplyUpdateOk(int idx, String content) {
		int res = 0;
		try {
			sql = "update boardReply set content = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(setBoardReplyInputOk) : " + e.getMessage());
		}
		finally {
			pstmtClose();
		}
		return res;
	}
		
*/


	
}
