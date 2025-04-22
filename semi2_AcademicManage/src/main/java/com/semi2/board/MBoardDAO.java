package com.semi2.board;
import java.sql.*;
import java.util.ArrayList;


public class MBoardDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**(매니저)게시판 목록 출력 기능*/
	public ArrayList<BoardDTO> mNoticeBoardList(String category, int cp, int ls){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			//페이징 
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			
			
			String sql = "select * from (select rownum as rnum, a.* from (select * from board order by boardidx desc)a)b \r\n"
					+ "where category =? and rnum>=? and rnum<=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			
			ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();

			while (rs.next()) {
				int boardidx = rs.getInt("boardidx");
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				String secret = rs.getString("secret");
				String fileaddr = rs.getString("fileaddr");

				BoardDTO bdto = new BoardDTO(boardidx, midx, idx, category, title, name, pwd, content, writedate,
						readnum, ref, lev, sunbun, secret, fileaddr);
				arr.add(bdto);
			}
			return arr;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저)글쓰기 기능 */
	public int mBoardWrite(BoardDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			
			String sql = "INSERT INTO BOARD(boardidx, midx, idx, category, title, name, pwd, content, writedate, readnum, ref, lev, sunbun) VALUES (sq_BOARD_boardidx.nextval, ?, ?, ?, ?, ?, ?, ?, SYSDATE, 0, 0, 0, 0)";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getMidx());
			ps.setInt(2, dto.getIdx());
			ps.setString(3, dto.getCategory());
			ps.setString(4, dto.getTitle());
			ps.setString(5, dto.getName());
			ps.setString(6, dto.getPwd());
			ps.setString(7, dto.getContent());

			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저)본문 보기 기능*/
	public BoardDTO mboardContent(int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select * from board where boardidx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boardidx);
			rs=ps.executeQuery();
			
			BoardDTO bdto = null;
			
			if(rs.next()) {
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				String secret = rs.getString("secret");
				String fileaddr = rs.getString("fileaddr");


				bdto = new BoardDTO(boardidx, midx, idx, category, title, name, pwd, content, writedate,
						readnum, ref, lev, sunbun, secret, fileaddr);
			}
			return bdto;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 총 게시물 수 관련 메소드 */
	public int mboardTotalcnt(String category) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select count(*) from board where category = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, category);
			rs = ps.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
			return count == 0?1:count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/** 조회수 기능 구현 */
	public int getReadnum(int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "update board set readnum = readnum+1 where boardidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardidx);
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	/** 게시글 수정 기능 구현 */
	public int mboardContentUp(BoardDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "update board set category = ?, title = ?, name = ?, pwd = ?, content = ? where boardidx = ?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getCategory());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getPwd());
			ps.setString(5, dto.getContent());
			ps.setInt(6, dto.getBoardidx());
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/** 게시글 삭제 기능 구현 */
	public int mboardDel(int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "Delete from board where boardidx = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardidx);
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
		
}
