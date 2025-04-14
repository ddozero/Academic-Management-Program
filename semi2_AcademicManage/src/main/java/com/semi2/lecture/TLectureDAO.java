package com.semi2.lecture;

import java.sql.*;
import java.util.*;
import com.semi2.member.*;

public class TLectureDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public TLectureDAO() {
		
	}
	// 강사이름으로 담당강좌 찾기
	public ArrayList<ManagerLectureDTO> findLectureByTname(String tname) {
	    ArrayList<ManagerLectureDTO> arr = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT c.classidx, g.groupidx, g.groupname, c.classname, c.tname, " +
	                     "c.entirescount, c.reqscount, TO_CHAR(c.comingdate, 'yyyy-mm-dd') AS comingdate, " +
	                     "TO_CHAR(c.enddate, 'yyyy-mm-dd') AS enddate, c.entiredate, c.chargemname, c.classintro " +
	                     "FROM class c JOIN classgroup g ON c.groupidx = g.groupidx " +
	                     "WHERE TRIM(c.tname) = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, tname.trim());

	        System.out.println("실행 SQL: " + sql);
	        System.out.println("tname 파라미터: [" + tname + "]");

	        rs = ps.executeQuery();
	        while (rs.next()) {
	            ManagerLectureDTO dto = new ManagerLectureDTO(
	                rs.getInt("classidx"), rs.getInt("groupidx"),
	                rs.getString("classname"), rs.getString("tname"),
	                rs.getInt("entirescount"), rs.getInt("reqscount"),
	                rs.getString("comingdate"), rs.getString("enddate"),
	                rs.getInt("entiredate"), rs.getString("chargemname"),
	                rs.getString("groupname"), rs.getString("classintro")
	            );
	            arr.add(dto);
	        }
	        System.out.println("결과 개수: " + arr.size());
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {}
	    }
	    return arr;
	}

	/** (매니저)(강사) 등록 강좌 목록 조회 메소드 */
	public ArrayList<ManagerLectureDTO> managerLectureInfo() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate, c.entiredate, c.chargemname, c.classintro from class c, classgroup g where c.groupidx = g.groupidx order by classidx asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<ManagerLectureDTO> arr = new ArrayList<ManagerLectureDTO>();

			while (rs.next()) {
				int classidx = rs.getInt("classidx");
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");
				String classintro = rs.getString("classintro");

				ManagerLectureDTO dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,
					reqscount, comingdate, enddate, entiredate, chargemname, groupname, classintro);
				arr.add(dto);
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
			} catch (Exception e2) {}
		}
	}

	/** (매니저)(강사) 세부 강좌 조회 메소드 */
	public ManagerLectureDTO managerLectureList(int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate, c.entiredate, c.chargemname, c.classintro from class c, classgroup g where c.groupidx = g.groupidx and c.classidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs = ps.executeQuery();

			ManagerLectureDTO dto = null;
			if(rs.next()) {
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");
				String classintro = rs.getString("classintro");

				dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,reqscount, comingdate, enddate, entiredate, chargemname, groupname, classintro);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}

	//강좌 개요 수정
	public int updateClassIntro(ManagerLectureDTO dto) {
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "UPDATE CLASS SET classintro = ? WHERE classidx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, dto.getClassintro());
	        ps.setInt(2, dto.getClassidx());
	        return ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {}
	    }
	}

	// 이미 등록된 주차 관련 로직(1~2)
	// 1. 등록된 주차번호 가져오기
	public ArrayList<Integer> getUsedWeekNums(int classidx) {
	    ArrayList<Integer> usedWeeks = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT weeknum FROM CLASSDETIL2 WHERE classidx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            usedWeeks.add(rs.getInt("weeknum"));
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
	    return usedWeeks;
	}

	// 2. 전체 주차 수 계산 (전체일수 / 5일 기준)
	public int getCalculatedWeekCount(int classidx) {
	    int result = 0;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT entiredate FROM class WHERE classidx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            int entiredate = rs.getInt("entiredate");
	            result = (int)Math.ceil(entiredate / 5.0); // 5일 기준 주차 계산
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
	    return result;
	}

	// 세부 강좌 주차 등록
	public int insertLectureWeek(ManagerLectureDTO dto) {
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "INSERT INTO CLASSDETIL2 (weekidx, classidx, weeknum, weekname, weekcon, weekperiod) " +
	                     "VALUES (sq_CLASSDETIL2_weekidx.nextval, ?, ?, ?, ?, ?)";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, dto.getClassidx());
	        ps.setInt(2, dto.getWeeknum());
	        ps.setString(3, dto.getWeekname());
	        ps.setString(4, dto.getWeekcon());
	        ps.setString(5, dto.getWeekperiod());
	        int result = ps.executeUpdate();
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) { }
	    }
	}

	// 세부 목차 목록 조회
	public ArrayList<ManagerLectureDTO> getWeekList(int classidx) {
	    ArrayList<ManagerLectureDTO> list = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "SELECT weekidx, weeknum, weekname, weekcon, weekperiod " +
	                     "FROM CLASSDETIL2 WHERE classidx = ? ORDER BY weeknum";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            int weekidx = rs.getInt("weekidx");
	            int weeknum = rs.getInt("weeknum");
	            String weekname = rs.getString("weekname");
	            String weekcon = rs.getString("weekcon");
	            String weekperiod = rs.getString("weekperiod");

	            ManagerLectureDTO dto = new ManagerLectureDTO(classidx, weekidx, weeknum, weekname, weekcon, weekperiod);
	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) { }
	    }
	    return list;
	}
	
	// 세부목차목록 삭제로직
	public int deleteWeekByNum(int classidx, int weeknum) {
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "DELETE FROM CLASSDETIL2 WHERE classidx = ? AND weeknum = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, classidx);
	        ps.setInt(2, weeknum);
	        return ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {}
	    }
	}

}