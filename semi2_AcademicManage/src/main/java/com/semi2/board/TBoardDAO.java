package com.semi2.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TBoardDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private static TBoardDAO instance = new TBoardDAO();

    private TBoardDAO() {
    	
    }

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
    public boolean insertBoard(int midx, int idx, String category, String title, String name, String pwd, String content, String writedate, String fileaddr, int ref) {
        try {
            // DB 연결
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "INSERT INTO BOARD (boardidx, midx, idx, category, title, name, pwd, content, writedate, fileaddr, readnum, ref, lev, sunbun) " +
                         "VALUES (sq_BOARD_boardidx.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, 0, ?, 0, 0)";
            ps = conn.prepareStatement(sql);
            
            // 파라미터 설정
            ps.setInt(1, midx);  // midx가 숫자형인지 확인
            ps.setInt(2, idx);    // idx가 숫자형인지 확인
            ps.setString(3, category);
            ps.setString(4, title);
            ps.setString(5, name);
            ps.setString(6, pwd);
            ps.setString(7, content);
            ps.setString(8, writedate);
            ps.setString(9, fileaddr);
            ps.setInt(10, ref + 1); // ref 값이 숫자형인지 확인
            
            // INSERT 실행
            int count = ps.executeUpdate();
            
            // 삽입 성공 시 true 반환
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    // 답글 순번을 갱신하는 메서드 (sunbun 업데이트)
    public void updateSunbun(int ref, int sunbun) {
        try {
            String sql = "UPDATE BOARD SET sunbun = sunbun + 1 WHERE ref = ? AND sunbun >= ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ref);
            ps.setInt(2, sunbun);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception e2) {}
        }
    }

    // 답글 삽입 메서드
    public boolean insertReply(int midx, int idx, String category, String title, String name, String pwd,
            String content, String writedate, String fileaddr, String secret, int ref, int lev, int sunbun) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            // 답글 순번 갱신
            updateSunbun(ref, sunbun + 1);  // 기존 답글의 순번을 갱신

            String sql = "INSERT INTO BOARD (boardidx, midx, idx, category, title, name, pwd, content, writedate, fileaddr, secret, ref, lev, sunbun) " +
                         "VALUES (sq_BOARD_boardidx.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?)";
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
            ps.setInt(12, lev + 1); // 답글은 원본 글보다 하나 높은 레벨을 갖는다.
            ps.setInt(13, sunbun + 1); // 답글의 순번을 1 증가시킨다.

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

    // 게시판 목록 조회 (페이징 적용)
    public List<BoardDTO> getBoardList(int cp, int ls) {
        List<BoardDTO> list = new ArrayList<>();
        try {
            conn = com.semi2.db.Semi2DB.getConn();

            // 페이징 처리: 시작과 끝 인덱스 계산
            int start = (cp - 1) * ls + 1;
            int end = cp * ls;

            // SQL 쿼리 수정: ref DESC, sunbun ASC로 정렬하며, 페이징 처리
            String sql = "SELECT * FROM (" +
                         "    SELECT rownum as rnum, a.* FROM (" +
                         "        SELECT boardidx, midx, idx, category, title, name, pwd, content, writedate, readnum, ref, lev, sunbun, secret, fileaddr " +
                         "        FROM BOARD " +
                         "        ORDER BY ref DESC, sunbun ASC" +
                         "    ) a" +
                         ") b WHERE rnum >= ? AND rnum <= ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            rs = ps.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setBoardidx(rs.getInt("boardidx"));
                dto.setMidx(rs.getInt("midx"));
                dto.setIdx(rs.getInt("idx"));
                dto.setCategory(rs.getString("category"));
                dto.setTitle(rs.getString("title"));
                dto.setName(rs.getString("name"));
                dto.setPwd(rs.getString("pwd"));
                dto.setContent(rs.getString("content"));
                dto.setWritedate(rs.getDate("writedate"));
                dto.setReadnum(rs.getInt("readnum"));
                dto.setRef(rs.getInt("ref"));
                dto.setLev(rs.getInt("lev"));
                dto.setSunbun(rs.getInt("sunbun"));
                dto.setSecret(rs.getString("secret"));
                dto.setFileaddr(rs.getString("fileaddr"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) { e2.printStackTrace(); }
        }

        return list;
    }

    // 게시물 총 개수 조회
    public int getTotalCnt() {
        int totalCnt = 0;
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT COUNT(*) FROM BOARD";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalCnt = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e2) { e2.printStackTrace(); }
        }
        return totalCnt;
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
                dto.setReadnum(rs.getInt("readnum"));
                dto.setRef(rs.getInt("ref"));
                dto.setLev(rs.getInt("lev"));
                dto.setSunbun(rs.getInt("sunbun"));
                dto.setSecret(rs.getString("secret"));
                dto.setFileaddr(rs.getString("fileaddr"));
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
    
}