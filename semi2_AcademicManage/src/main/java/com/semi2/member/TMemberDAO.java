package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	        
	        // classgroup을 m3.groupidx 기준으로 조인하도록 수정
	        String sql = 
	            "SELECT m1.*, m3.*, c.classname AS classname, g.groupname AS groupname " +
	            "FROM member1 m1 " +
	            "LEFT JOIN member3 m3 ON m1.idx = m3.idx " +
	            "LEFT JOIN class c ON m3.classidx = c.classidx " +
	            "LEFT JOIN classgroup g ON m3.groupidx = g.groupidx " +  // groupidx 조인 경로 변경
	            "WHERE m1.id = ? " +
	            "  AND m1.midx = ? " +
	            "  AND m3.m3idx = (SELECT MAX(m3idx) FROM member3 WHERE idx = m1.idx)";

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

	            // member3의 추가 정보 세팅
	            dto.setEdu2(rs.getString("edu2"));
	            dto.setCareer(rs.getString("career"));
	            dto.setComingdate(rs.getDate("comingdate"));
	            dto.setMemo(rs.getString("memo"));
	            dto.setClassidx(rs.getInt("classidx"));
	            dto.setGroupidx(rs.getInt("groupidx"));
	            dto.setSeleclass(rs.getString("selecclass"));
	            dto.setImgaddr(rs.getString("imgaddr"));

	            // classgroup에서 가져온 정보 세팅
	            dto.setClassname(rs.getString("classname"));   // 강좌명
	            dto.setGroupname(rs.getString("groupname"));   // 반이름
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
	    return dto;
	}

	// 강사정보 세부사항 수정로직 (UPDATE 버전)
	public int updateTeacherInfo(MemberDTO mdto) {
	    try {
	        System.out.println("updateTeacherInfo 실행 시작");

	        conn = com.semi2.db.Semi2DB.getConn();
	        
	        // UPDATE 쿼리로 수정
	        String sql = "UPDATE member3 " +
	                     "SET edu2 = ?, career = ?, comingdate = ?, memo = ? " +
	                     "WHERE idx = ? " +
	                     "AND m3idx = (SELECT MAX(m3idx) FROM member3 WHERE idx = ?)";

	        ps = conn.prepareStatement(sql);
	        ps.setString(1, mdto.getEdu2());
	        ps.setString(2, mdto.getCareer());
	        ps.setDate(3, mdto.getComingdate()); // java.sql.Date
	        ps.setString(4, mdto.getMemo());
	        ps.setInt(5, mdto.getIdx());
	        ps.setInt(6, mdto.getIdx()); // 서브쿼리용 idx 재사용

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
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
}