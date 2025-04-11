package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

public class TMemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public TMemberDAO() {
		// TODO Auto-generated constructor stub
	}

	// 강사 - 내정보보기
	public MemberDTO getTeacherInfo(String id, int midx) {
		MemberDTO dto = null;
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "SELECT * " + "FROM member1 m1 " + "LEFT JOIN member3 m3 ON m1.idx = m3.idx "
					+ "WHERE m1.id = ? AND m1.midx = ? "
					+ "AND m3.m3idx = (SELECT MAX(m3idx) FROM member3 WHERE idx = m1.idx)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, midx);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setMidx(rs.getInt("midx"));
				dto.setName(rs.getString("name"));
				dto.setSex(rs.getString("sex"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddr(rs.getString("addr"));
				dto.setBirth(rs.getString("birth"));
				dto.setAppro(rs.getInt("appro"));

				// member3의 추가 정보도 세팅
				dto.setEdu2(rs.getString("edu2"));
				dto.setCareer(rs.getString("career"));
				dto.setComingdate(rs.getDate("comingdate"));
				dto.setMemo(rs.getString("memo"));
				dto.setClassidx(rs.getInt("classidx"));
				dto.setGroupidx(rs.getInt("groupidx"));
				dto.setSeleclass(rs.getString("selecclass"));
				dto.setGroupname(rs.getString("groupname"));
				dto.setImgaddr(rs.getString("imgaddr"));
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
			} catch (Exception e2) {
			}
		}
		return dto;
	}

	// 강사정보 세부사항 수정로직
	public int updateTeacherInfo(MemberDTO mdto) {
		try {
			System.out.println("updateTeacherInfo 실행 시작");

			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "INSERT INTO member3 (m3idx, idx, edu2, career, comingdate, memo) VALUES(sq_MEMBER3_m3idx.nextval, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, mdto.getIdx());
			ps.setString(2, mdto.getEdu2());
			ps.setString(3, mdto.getCareer());
			ps.setDate(4, mdto.getComingdate()); // java.sql.Date
			ps.setString(5, mdto.getMemo());
			System.out.println("쿼리 준비 완료");
			int count = ps.executeUpdate();
			System.out.println("쿼리 실행 성공: count = " + count);
			return count;
		} catch (Exception e) {
			System.out.println("DAO 내부 오류 발생:");
			e.printStackTrace();
			return -1;
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

}
