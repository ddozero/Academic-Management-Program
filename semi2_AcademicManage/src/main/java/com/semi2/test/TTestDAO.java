package com.semi2.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class TTestDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TTestDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// 1. 강사이름으로 classidx + classname 목록 반환
    public ArrayList<Map<String, Object>> getClassListByTname(String tname) {
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        try {
        	conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT classidx, classname FROM class WHERE tname = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, tname.trim());
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("classidx", rs.getInt("classidx"));
                map.put("classname", rs.getString("classname"));
                list.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e2) {}
        }
        return list;
    }
	
	// 2. classidx에 해당하는 시험 문제 목록 가져오기
    public ArrayList<TestDTO> getTestListByClassidx(int classidx) {
        ArrayList<TestDTO> list = new ArrayList<>();
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT * FROM test WHERE classidx = ? ORDER BY numidx ASC";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, classidx);
            rs = ps.executeQuery();
            while (rs.next()) {
                TestDTO dto = new TestDTO();
                dto.setTestidx(rs.getInt("testidx"));
                dto.setClassidx(rs.getInt("classidx"));
                dto.setNumidx(rs.getInt("numidx"));
                dto.setExam(rs.getString("exam"));
                dto.setRightanswer(rs.getString("rightanswer"));
                dto.setScore(rs.getInt("score"));
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
            		
            	}
        }
        return list;
    }
    // 담당강좌 시험등록
    public int insertTest(TestDTO dto) {
        int result = 0;
        try {
        	conn = com.semi2.db.Semi2DB.getConn();
            String sql = "INSERT INTO test VALUES (sq_test_testidx.nextval, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, dto.getClassidx());
            ps.setInt(2, dto.getNumidx());
            ps.setString(3, dto.getExam());
            ps.setString(4, dto.getRightanswer());
            ps.setInt(5, dto.getScore());
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { 
            	if (ps != null) ps.close();
            	if (conn != null) conn.close();
            	} catch (Exception e2) {
            		
            	}
        }
        return result;
    }

    // 담당강좌 특정 항목 시험 삭제
    public int deleteTest(int testidx) {
        int result = 0;
        try {
        	conn = com.semi2.db.Semi2DB.getConn();
            String sql = "DELETE FROM test WHERE testidx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, testidx);
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { 
            	if (ps != null) ps.close();
            	if (conn != null) conn.close();
            	} catch (Exception e2) {
            		
            	}
        }
        return result;
    }
    
    // 사용된 numidx 값 확인하기
    public ArrayList<Integer> getUsedNumidxList(int classidx) {
        ArrayList<Integer> usedList = new ArrayList<>();
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT numidx FROM test WHERE classidx = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, classidx);
            rs = ps.executeQuery();
            while (rs.next()) {
                usedList.add(rs.getInt("numidx"));
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
        return usedList;
    }
    
    //시험문제 비교관련 담당강좌 학생 시험정보 조회
    public ArrayList<TestDTO> getTestSubmitList(int classidx) {
        ArrayList<TestDTO> list = new ArrayList<>();
        
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT t.testidx, t.numidx, t.exam, t.rightanswer, t.score, " +
                         "s.sansweridx, s.idx, s.groupidx, s.sanswer, s.yesorno, s.totalscore, s.submit, " +
                         "m.name, g.groupname, c.classname, c.tname " +
                         "FROM test t " +
                         "LEFT JOIN sanswer s ON t.testidx = s.testidx " +
                         "LEFT JOIN member1 m ON s.idx = m.idx " +
                         "LEFT JOIN classgroup g ON s.groupidx = g.groupidx " +
                         "JOIN class c ON t.classidx = c.classidx " +
                         "WHERE t.classidx = ? " +
                         "ORDER BY t.numidx ASC";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, classidx);
            rs = ps.executeQuery();
            while (rs.next()) {
                TestDTO dto = new TestDTO();
                dto.setTestidx(rs.getInt("testidx"));
                dto.setNumidx(rs.getInt("numidx"));
                dto.setExam(rs.getString("exam"));
                dto.setRightanswer(rs.getString("rightanswer"));
                dto.setScore(rs.getInt("score"));
                dto.setSansweridx(rs.getInt("sansweridx"));
                dto.setIdx(rs.getInt("idx"));
                dto.setGroupidx(rs.getInt("groupidx"));
                dto.setSanswer(rs.getString("sanswer"));
                dto.setYesorno(rs.getInt("yesorno"));
                dto.setTotalscore(rs.getInt("totalscore"));
                dto.setSubmit(rs.getInt("submit"));
                dto.setClassname(rs.getString("classname"));
                dto.setTname(rs.getString("tname"));

                dto.setSname(rs.getString("sname")); //학생이름
                dto.setGroupname(rs.getString("groupname"));
                
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
            		
            	}
        }
        return list;
    }
    
    // idx별 최고점수 조회
    public ArrayList<TestDTO> getTestSubmitMaxScoreList(int classidx) {
        ArrayList<TestDTO> list = new ArrayList<>();
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            String sql = "SELECT m.name, g.groupname, c.classname, c.tname, " +
                         "s.idx, s.groupidx, s.classidx, MAX(s.totalscore) AS maxscore, s.submit " +
                         "FROM sanswer s " +
                         "JOIN member1 m ON s.idx = m.idx " +
                         "JOIN classgroup g ON s.groupidx = g.groupidx " +
                         "JOIN class c ON s.classidx = c.classidx " +
                         "WHERE s.classidx = ? " +
                         "GROUP BY s.idx, m.name, g.groupname, c.classname, c.tname, s.groupidx, s.classidx, s.submit " +
                         "ORDER BY s.idx";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, classidx);
            rs = ps.executeQuery();
            while (rs.next()) {
                TestDTO dto = new TestDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setGroupidx(rs.getInt("groupidx"));
                dto.setClassidx(rs.getInt("classidx"));
                dto.setTotalscore(rs.getInt("maxscore"));
                dto.setSubmit(rs.getInt("submit"));
                dto.setTname(rs.getString("tname"));
                dto.setClassname(rs.getString("classname"));
                dto.setSanswer(rs.getString("name"));   
                dto.setRightanswer(rs.getString("groupname"));
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
            		
            	}
        }
        return list;
    }

}