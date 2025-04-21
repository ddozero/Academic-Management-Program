package com.semi2.board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ABoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ABoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public int getMaxRef() {
		try {
			String sql = "select max(ref) from board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int ref = 0;
			if (rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e2) {
			}
		}
	}

	public int getTotalCnt() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "select count(*) from Board";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public void setSunUpdate(int ref, int sun) {
		try {
			String sql = "update board set sunbun=sunbun+1 where ref = ? "
					+ "and sunbun>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {try {
			if(ps!=null)ps.close();
		}catch(Exception e2) {}}
	}
	
	public int bbsRepWrite(BoardDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			setSunUpdate(dto.getRef(), dto.getSunbun()+1);
			
			String sql = "insert into board values(sq_BOARD_boardidx.nextval,'server','자유 게시판',?,?,?,?,sysdate,0,?,?,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev());
			ps.setInt(7, dto.getSunbun());
			
			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}}
	}

	public ArrayList<BoardDTO> bbsList(int cp, int ls) {
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();

	        int start = (cp - 1) * ls + 1;
	        int end = cp * ls;

	        String sql = "SELECT * FROM (SELECT rownum AS rnum, a.* FROM (SELECT * FROM board WHERE category = '자유 게시판' ORDER BY boardidx DESC) a WHERE rownum <= ?) WHERE rnum >= ?";


	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, end);   // rownum <= ?
	        ps.setInt(2, start); // rnum >= ?

	        rs = ps.executeQuery();

	        ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
	        while (rs.next()) {
	            int boardidx = rs.getInt("boardidx");
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

	            BoardDTO bdto = new BoardDTO(boardidx, midx, idx, category, title, name, pwd, content,
	                                         writedate, readnum, ref, lev, sunbun, secret, fileaddr);
	            arr.add(bdto);
	        }
	        return arr;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}

	
	// ======================================//
	public int bbsWrite(BoardDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "insert into board values(sq_BOARD_boardidx.nextval,?,?,'자유 게시판',?,?,?,?,sysdate,0,0,0,0,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getMidx());
			ps.setInt(2, dto.getIdx());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getName());
			ps.setString(5, dto.getPwd());
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getSecret());

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public int bbsReWrite(BoardDTO dto, int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "update board set title = ?, name = ?, content = ? where boardidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getContent());
			ps.setInt(4, boardidx);

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<BoardDTO> bbsList() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();


			String sql = "select * from board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
			while (rs.next()) {
				int boardidx = rs.getInt("boardidx");
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

				BoardDTO bdto = new BoardDTO(boardidx, midx, idx, category, title, name, pwd, content, writedate,
						readnum, ref, lev, sunbun, secret, fileaddr);

				arr.add(bdto);

			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	public BoardDTO bbsContent(int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "select * from board where boardidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardidx);
			rs = ps.executeQuery();

			rs.next();
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

			BoardDTO bdto = new BoardDTO(boardidx, midx,idx , category, title, name, pwd, content, writedate, readnum,
					ref, lev, sunbun, secret, fileaddr);

			return bdto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public int deleteCon(int boardidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "delete from board where boardidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardidx);

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int updateReadnum(int boardidx) {
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "UPDATE board SET readnum = readnum + 1 WHERE boardidx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, boardidx);
	        return ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
}
