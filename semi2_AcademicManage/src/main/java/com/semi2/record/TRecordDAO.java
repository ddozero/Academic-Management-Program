package com.semi2.record;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.Timestamp;

public class TRecordDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TRecordDAO() {
			// TODO Auto-generated constructor stub
		}
	
	//class테이블에서 name으로 tname과 일치하는 classidx, classname 조회
	public void getClassByName(RecordDTO dto, String name) {
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT classidx, classname FROM class WHERE tname = ?"; // tname이 name과 같다고 가정
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, name); // name 값을 그대로 tname으로 비교
	        rs = ps.executeQuery();
	        if (rs.next()) {
	        	dto.setClassidx(rs.getInt("classidx"));
	            dto.setClassname(rs.getString("classname"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { 
	        	if (rs != null) rs.close();
	        	if (ps != null) ps.close();
	        	if (conn != null) conn.close(); 
	       } catch (Exception e) {
	    	   
	       }
	    }
	}
	// 출근 중복방지 로직
	public boolean checkDuplicateAbsence(int midx, int idx, int classidx) {
	    boolean exists = false;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT 1 FROM record " +
	                     "WHERE midx = ? AND idx = ? AND classidx = ? " +
	                     "AND TRUNC(attendate) = TRUNC(SYSDATE)";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, midx);
	        ps.setInt(2, idx);
	        ps.setInt(3, classidx);
	        rs = ps.executeQuery();
	        exists = rs.next();  // 결과가 있으면 true
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e) {}
	    }
	    return exists;
	}
	
	//입실기록 저장
	public int attenInSave(RecordDTO dto) {
	    int result = 0;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "INSERT INTO record (recordidx, midx, idx, classidx, recordtime, entirate, currate, status, attendate, intime, outtime) " +
                    	 "VALUES (sq_record_recordidx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, dto.getMidx());
	        ps.setInt(2, dto.getIdx());
	        ps.setInt(3, dto.getClassidx());
	        ps.setInt(4, dto.getRecordtime());
	        ps.setInt(5, dto.getEntirate());
	        ps.setInt(6, dto.getCurrate());
	        ps.setInt(7, dto.getStatus());
	        ps.setDate(8, dto.getattendate());
	        ps.setTimestamp(9, dto.getIntime());
	        ps.setTimestamp(10, dto.getOuttime());
	        result = ps.executeUpdate();
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try { 
	        if (ps != null) ps.close();
	        if (conn != null) conn.close(); 
	        } catch (Exception e) {
	        	
	        }
	    }
	}
	
	//퇴근기록 중복방지
	public boolean checkAlreadyOut(int midx, int idx, int classidx) {
	    boolean exists = false;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT 1 FROM record " +
	                     "WHERE midx = ? AND idx = ? AND classidx = ? AND status = 1" +
	                     "AND TRUNC(attendate) = TRUNC(SYSDATE)";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, midx);
	        ps.setInt(2, idx);
	        ps.setInt(3, classidx);
	        rs = ps.executeQuery();
	        exists = rs.next(); // 결과가 있으면 true
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close();
	        if (ps != null) ps.close();
	        if (conn != null) conn.close(); 
	        } catch (Exception e) {
	        }
	    }
	    return exists;
	}
	
	
	//퇴근기록 저장
	public int attenOutSave(int midx, int idx, int classidx, Timestamp outtime) {
	    int result = 0;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();

	        String sql = "UPDATE record " +
	                     "SET outtime = ?, status = 1 " +
	                     "WHERE midx = ? AND idx = ? AND classidx = ? " +
	                     "AND TRUNC(attendate) = TRUNC(SYSDATE) AND status = 5";
	        ps = conn.prepareStatement(sql);
	        ps.setTimestamp(1, outtime);
	        ps.setInt(2, midx);
	        ps.setInt(3, idx);
	        ps.setInt(4, classidx);
	        result = ps.executeUpdate();
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	// 강사 출퇴근기록보기
	public ArrayList<RecordDTO> recordShow(int midx) {
	    ArrayList<RecordDTO> arr = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT * FROM record WHERE MIDX = ? ORDER BY attendate DESC";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, midx);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            RecordDTO rdto = new RecordDTO();
	           
	            rdto.setMidx(rs.getInt("midx"));
	            rdto.setIdx(rs.getInt("idx"));
	            rdto.setClassidx(rs.getInt("classidx"));
	            rdto.setRecordtime(rs.getInt("recordtime"));
	            rdto.setEntirate(rs.getInt("entirate"));
	            rdto.setCurrate(rs.getInt("currate"));
	            rdto.setStatus(rs.getInt("status"));
	            rdto.setattendate(rs.getDate("attendate"));
	            rdto.setIntime(rs.getTimestamp("intime"));
	            rdto.setOuttime(rs.getTimestamp("outtime"));
	            arr.add(rdto);
	        }
	        return arr;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ArrayList<>();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) { e.printStackTrace(); }
	    }
	}
	
	// 강사 이름으로 classidx 조회
	public int findClassidxByTname(String tname) {
	    int classidx = -1;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    String sql = "SELECT classidx FROM class WHERE tname = ?";

	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, tname);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            classidx = rs.getInt("classidx");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e) {}
	    }

	    return classidx;
	}
	
	// classidx와 attendate 기준에 부합하는 학생 출결 전체 정보 조회
	public ArrayList<RecordDTO> selectStudentRecordByClassidx(int classidx, Date attendate) {
	    ArrayList<RecordDTO> list = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    String sql = "SELECT r.*, m.name, cg.groupname, c.classname " +
	                 "FROM record r " +
	                 "JOIN member1 m ON r.idx = m.idx " +
	                 "JOIN class c ON r.classidx = c.classidx " +
	                 "JOIN classgroup cg ON c.groupidx = cg.groupidx " +
	                 "WHERE r.classidx = ? " +
	                 "AND m.midx = 2 " +  // 학생만
	                 "AND TRUNC(r.attendate) = TRUNC(?)";

	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        ps.setDate(2, attendate);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            RecordDTO dto = new RecordDTO();
	            dto.setRecordidx(rs.getInt("recordidx"));
	            dto.setMidx(rs.getInt("midx"));
	            dto.setIdx(rs.getInt("idx"));
	            dto.setClassidx(rs.getInt("classidx"));
	            dto.setRecordtime(rs.getInt("recordtime"));
	            dto.setEntirate(rs.getInt("entirate"));
	            dto.setCurrate(rs.getInt("currate"));
	            dto.setStatus(rs.getInt("status"));
	            dto.setattendate(rs.getDate("attendate"));
	            dto.setIntime(rs.getTimestamp("intime"));
	            dto.setOuttime(rs.getTimestamp("outtime"));
	            dto.setName(rs.getString("name"));
	            dto.setGroupname(rs.getString("groupname"));
	            dto.setClassname(rs.getString("classname"));
	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if (rs != null) rs.close();
	        if (ps != null) ps.close();
	        if (conn != null) conn.close(); 
	        } catch (Exception e) {}
	    }

	    return list;
	}
	
	// 전체 학생 기록 조회 (날짜 무관)
	public ArrayList<RecordDTO> selectAllStudentRecordByClassidx(int classidx) {
	    ArrayList<RecordDTO> list = new ArrayList<>();
	    try {
	    	conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT r.*, m.name, g.groupname, c.classname FROM record r " +
	                     "JOIN member1 m ON r.idx = m.idx " +
	                     "JOIN member2 m2 ON m.idx = m2.idx " +
	                     "JOIN class c ON r.classidx = c.classidx " +
	                     "JOIN classgroup g ON c.groupidx = g.groupidx " +
	                     "WHERE r.midx = 2 AND r.classidx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            RecordDTO dto = new RecordDTO();
	            dto.setIdx(rs.getInt("idx"));
	            dto.setClassidx(rs.getInt("classidx"));
	            dto.setRecordtime(rs.getInt("recordtime"));
	            dto.setEntirate(rs.getInt("entirate"));
	            dto.setCurrate(rs.getInt("currate"));
	            dto.setStatus(rs.getInt("status"));
	            dto.setattendate(rs.getDate("attendate"));
	            dto.setIntime(rs.getTimestamp("intime"));
	            dto.setOuttime(rs.getTimestamp("outtime"));
	            dto.setName(rs.getString("name"));
	            dto.setGroupname(rs.getString("groupname"));
	            dto.setClassname(rs.getString("classname"));

	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { 
	        if (rs != null) rs.close();
	        if (ps != null) ps.close();
	        if (conn != null) conn.close(); 
	        } catch (Exception e) {}
	    }
	    return list;
	}


	// 수강생조회 이름 필터 검색
	public ArrayList<RecordDTO> selectStudentRecordByClassidxAndName(int classidx, String name) {
	    ArrayList<RecordDTO> list = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();

	        String sql = "SELECT r.*, m.name, g.groupname, c.classname " +
	                     "FROM record r " +
	                     "JOIN member1 m ON r.idx = m.idx " +
	                     "JOIN member2 m2 ON m.idx = m2.idx " +
	                     "JOIN class c ON r.classidx = c.classidx " +
	                     "JOIN classgroup g ON c.groupidx = g.groupidx " +
	                     "WHERE r.midx = 2 AND r.classidx = ? AND m.name LIKE ?";

	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        ps.setString(2, "%" + name + "%");

	        rs = ps.executeQuery();
	        while (rs.next()) {
	            RecordDTO dto = new RecordDTO();

	            dto.setRecordidx(rs.getInt("recordidx"));
	            dto.setMidx(rs.getInt("midx"));
	            dto.setIdx(rs.getInt("idx"));
	            dto.setClassidx(rs.getInt("classidx"));
	            dto.setRecordtime(rs.getInt("recordtime"));
	            dto.setEntirate(rs.getInt("entirate"));
	            dto.setCurrate(rs.getInt("currate"));
	            dto.setStatus(rs.getInt("status"));
	            dto.setattendate(rs.getDate("attendate"));
	            dto.setIntime(rs.getTimestamp("intime"));
	            dto.setOuttime(rs.getTimestamp("outtime"));
	            dto.setName(rs.getString("name"));
	            dto.setGroupname(rs.getString("groupname"));
	            dto.setClassname(rs.getString("classname"));

	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return list;
	}

}