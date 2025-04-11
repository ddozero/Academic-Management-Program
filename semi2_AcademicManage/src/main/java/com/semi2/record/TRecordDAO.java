package com.semi2.record;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.Timestamp;

public class TRecordDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public TRecordDAO() {
		// TODO Auto-generated constructor stub
	}

	// class테이블에서 name으로 tname과 일치하는 classidx, classname 조회
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
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
	}

	// 출근 중복방지 로직
	public boolean checkDuplicateAbsence(int midx, int idx, int classidx) {
		boolean exists = false;
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "SELECT 1 FROM record " + "WHERE midx = ? AND idx = ? AND classidx = ? "
					+ "AND TRUNC(attendate) = TRUNC(SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			ps.setInt(2, idx);
			ps.setInt(3, classidx);
			rs = ps.executeQuery();
			exists = rs.next(); // 결과가 있으면 true
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return exists;
	}

	// 입실기록 저장
	public int attenInSave(RecordDTO dto) {
		int result = 0;
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "INSERT INTO record (recordidx, midx, idx, classidx, recordtime, entirate, currate, attendate, intime, outtime) "
					+ "VALUES (sq_record_recordidx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getMidx());
			ps.setInt(2, dto.getIdx());
			ps.setInt(3, dto.getClassidx());
			ps.setInt(4, dto.getRecordtime());
			ps.setInt(5, dto.getEntirate());
			ps.setInt(6, dto.getCurrate());
			ps.setDate(7, dto.getattendate());
			ps.setTimestamp(8, dto.getIntime());
			ps.setTimestamp(9, dto.getOuttime());
			result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
	}

	// 퇴근기록 중복방지
	public boolean checkAlreadyOut(int midx, int idx, int classidx) {
		boolean exists = false;
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "SELECT 1 FROM record " + "WHERE midx = ? AND idx = ? AND classidx = ? AND status = 1"
					+ "AND TRUNC(attendate) = TRUNC(SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			ps.setInt(2, idx);
			ps.setInt(3, classidx);
			rs = ps.executeQuery();
			exists = rs.next(); // 결과가 있으면 true
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return exists;
	}

	// 퇴근기록 저장
	public int attenOutSave(int midx, int idx, int classidx, Timestamp outtime) {
		int result = 0;
		try {
			conn = com.semi2.db.Semi2DB.getConn();

			String sql = "UPDATE record " + "SET outtime = ?, status = 1 "
					+ "WHERE midx = ? AND idx = ? AND classidx = ? "
					+ "AND TRUNC(attendate) = TRUNC(SYSDATE) AND status = 5";
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
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 모든 출퇴근기록보기
	public ArrayList<RecordDTO> recordShow() {
		ArrayList<RecordDTO> arr = new ArrayList<>();
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "SELECT * FROM record ORDER BY attendate DESC";
			ps = conn.prepareStatement(sql);
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
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
