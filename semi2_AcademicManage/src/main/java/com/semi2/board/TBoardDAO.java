package com.semi2.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class TBoardDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    // 싱글톤 인스턴스
    private static TBoardDAO instance = new TBoardDAO();

    // 외부에서 생성 못하도록 private 생성자
    private TBoardDAO() {}

    // 외부에서 접근할 수 있는 인스턴스 getter
    public static TBoardDAO getInstance() {
        return instance;
    }
    
    // idx를 기준으로 수강 강좌명 조회
    public String findClassNameByIdx(int idx) {
        String classname = "";
    
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT c.classname " +
                         "FROM member2 m2 " +
                         "JOIN class c ON m2.classidx = c.classidx " +
                         "WHERE m2.idx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idx);
            rs = ps.executeQuery();
            if (rs.next()) {
                classname = rs.getString("classname");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return classname;
    }

    // 글 등록
    public boolean insertBoard(int midx, int idx, String category, String title, String name, String pwd, String content, String writedate, String fileaddr) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();

            String sql = "INSERT INTO BOARD (boardidx, midx, idx, category, title, name, pwd, content, writedate, fileaddr) " +
                         "VALUES (sq_BOARD_boardidx.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, midx); 
            ps.setInt(2, idx);
            ps.setString(3, category);
            ps.setString(4, title);
            ps.setString(5, name);
            ps.setString(6, pwd);
            ps.setString(7, content);
            ps.setString(8, writedate);
            ps.setString(9, fileaddr);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;

        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    // 글 목록 조회
    public List<BoardDTO> getBoardList() {
        List<BoardDTO> list = new ArrayList<>();
        try {
            conn = com.semi2.db.Semi2DB.getConn();

            String sql = "SELECT boardidx, title, name, TO_CHAR(writedate, 'YYYY-MM-DD') AS writedate, fileaddr, readnum FROM BOARD ORDER BY boardidx DESC";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setBoardidx(rs.getInt("boardidx"));
                dto.setTitle(rs.getString("title"));
                dto.setName(rs.getString("name"));
                dto.setWritedate(Date.valueOf(rs.getString("writedate")));
                dto.setFileaddr(rs.getString("fileaddr"));
                dto.setReadnum(rs.getInt("readnum"));
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return list;
    }
    
    // 선택한 글 내용보기
    public BoardDTO getBoardContent(int boardidx) {
        BoardDTO dto = null;
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT * FROM BOARD WHERE boardidx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, boardidx);
            rs = ps.executeQuery();

            if (rs.next()) {
                dto = new BoardDTO();
                dto.setBoardidx(rs.getInt("boardidx"));
                dto.setMidx(rs.getInt("midx"));
                dto.setIdx(rs.getInt("idx"));
                dto.setCategory(rs.getString("category"));
                dto.setTitle(rs.getString("title"));
                dto.setName(rs.getString("name"));
                dto.setPwd(rs.getString("pwd"));
                dto.setContent(rs.getString("content"));
                dto.setWritedate(rs.getDate("writedate"));
                dto.setFileaddr(rs.getString("fileaddr"));
                dto.setReadnum(rs.getInt("readnum"));
                dto.setRef(rs.getInt("ref"));
                dto.setLev(rs.getInt("lev"));
                dto.setSunbun(rs.getInt("sunbun"));
                dto.setSecret(rs.getString("secret"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }
        return dto;
    }
    
    // 기존 답글의 순번(sunbun)을 한 칸씩 뒤로 미룸
    public void updateSunbun(int ref, int sunbun) {
        try {
        	conn = com.semi2.db.Semi2DB.getConn();
            String sql = "UPDATE BOARD SET sunbun = sunbun + 1 WHERE ref = ? AND sunbun > ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ref);
            ps.setInt(2, sunbun);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }
    }
    
    // 답글 insert 메소드
    public boolean insertReply(int midx, int idx, String category, String title, String name, String pwd,
            String content, String writedate, String fileaddr, String secret, int ref, int lev, int sunbun) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "INSERT INTO BOARD (boardidx, midx, idx, category, title, name, pwd, content, writedate, fileaddr, secret, ref, lev, sunbun) "
			        + "VALUES (sq_BOARD_boardidx.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			ps.setInt(2, idx);
			ps.setString(3, category);
			ps.setString(4, title);
			ps.setString(5, name);
			ps.setString(6, pwd);
			ps.setString(7, content);
			ps.setString(8, writedate);
			ps.setString(9, fileaddr);
			ps.setString(10, secret);
			ps.setInt(11, ref);
			ps.setInt(12, lev);
			ps.setInt(13, sunbun);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
    
    // 클릭 시 조회수 증가
    public void increaseReadnum(int boardidx) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "UPDATE BOARD SET readnum = readnum + 1 WHERE boardidx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, boardidx);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }
    }
    
    // 작성자한정 게시물 삭제
    public boolean deletePost(int boardidx, int midx, String name) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            // 게시물의 작성자 정보 가져오기
            String selectSql = "SELECT name FROM BOARD WHERE boardidx = ?";
            ps = conn.prepareStatement(selectSql);
            ps.setInt(1, boardidx);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String boardWriter = rs.getString("name");
                
                // 작성자와 로그인된 사용자 정보 비교
                if (boardWriter.equals(name)) {
                    // 삭제 쿼리
                    String deleteSql = "DELETE FROM BOARD WHERE boardidx = ?";
                    ps = conn.prepareStatement(deleteSql);
                    ps.setInt(1, boardidx);
                    
                    int result = ps.executeUpdate();
                    return result > 0;  // 삭제 성공 시 true 반환
                } else {
                    // 작성자가 다르면 삭제 불가
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                
            }
        }
        return false;  // 게시물이 존재하지 않으면 false 반환
    }
    
    //작성자만 게시글 수정하기
    public boolean updateBoard(int boardidx, String title, String content, String pwd, String fileaddr) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "UPDATE BOARD SET title = ?, content = ?, pwd = ?, fileaddr = ? WHERE boardidx = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, pwd);
            ps.setString(4, fileaddr);
            ps.setInt(5, boardidx);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }
    }

}