package com.semi2.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TstudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TstudentDAO() {
		
	}
	
	/**(매니저) 학생 목록 조회 */ //쿼리 member2 조인해서 midx 가져오기
	public ArrayList<MemberDTO> mstudentInfo(int midx){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select m2.m2idx,m1.idx, name,sex,tel,email,addr, to_char(birth, 'yyyy-mm-dd') as birth\r\n"
					+ "from member1 m1, member2 m2\r\n"
					+ "where m1.idx = m2.idx \r\n"
					+ "and m1.midx = ? order by m2idx";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			rs = ps.executeQuery();
			
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
			
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String addr = rs.getString("addr");
				String birth = rs.getString("birth");
				int m2idx = rs.getInt("m2idx");
				
				MemberDTO dto = new MemberDTO(idx, name, sex, tel, email, birth, addr, m2idx);
				
				arr.add(dto);
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
	
	/**(매니저) 학생 세부 정보 조회 */
	public MemberDTO mstudentInfoDetail(int idx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select m1.midx, m1.idx, m1.name, m1.sex, m1.tel, m1.email, m1.addr, to_char(m1.birth, 'yyyy-mm-dd') as birth, m2.career, c.comingdate, g.groupname, m2.memo, m2.imgaddr, m2.edu, c.classname, c.enddate\r\n"
					+ "from member1 m1, member2 m2, classgroup g, class c\r\n"
					+ "where m1.idx = m2.idx\r\n"
					+ "and m2.classidx = c.classidx\r\n"
					+ "and g.groupidx = c.groupidx\r\n"
					+ "and m1.idx = ? and m1.midx!='0'";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			
			MemberDTO dto = null;
			
			if(rs.next()) {
				int midx = rs.getInt("midx");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String addr = rs.getString("addr");
				String birth = rs.getString("birth");
				String career = rs.getString("career");
				Date comingdate = rs.getDate("comingdate");
				String groupname = rs.getString("groupname");
				String memo = rs.getString("memo");
				String imgaddr = rs.getString("imgaddr");
				String edu = rs.getString("edu");
				String classname = rs.getString("classname");
				Date enddate = rs.getDate("enddate");
				
				dto = new MemberDTO(midx,idx,name,sex,tel,email,addr,birth,career,comingdate,groupname,memo,imgaddr,edu,classname,enddate);
				
			}
			return dto;
			
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
	

	
	/**(매니저) 강좌별 수강생 현황 조회 */
	public ArrayList<MemberDTO> lectureStudentList(int classidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select  m1.midx, m1.idx, m1.name, m1.sex, m1.tel, to_char(m1.birth,'yyyy-mm-dd') as birth, m1.email, m1.addr, m1.birth, m2.career, c.comingdate, g.groupname, m2.memo, m2.imgaddr, m2.edu, c.classname, c.enddate\r\n"
					+ "from member1 m1, class c, member2 m2, classgroup g\r\n"
					+ "where m1.idx = m2.idx\r\n"
					+ "and m2.classidx = c.classidx\r\n"
					+ "and g.groupidx = c.groupidx\r\n"
					+ "and m2.classidx = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs = ps.executeQuery();
			
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String addr = rs.getString("addr");
				String birth = rs.getString("birth");
				String career = rs.getString("career");
				Date comingdate = rs.getDate("comingdate");
				String groupname = rs.getString("groupname");
				String memo = rs.getString("memo");
				String imgaddr = rs.getString("imgaddr");
				String edu = rs.getString("edu");
				String classname = rs.getString("classname");
				Date enddate = rs.getDate("enddate");
				
				MemberDTO dto = new MemberDTO(midx,idx,name,sex,tel,email,addr,birth,career,comingdate,groupname,memo,imgaddr,edu,classname,enddate);
				arr.add(dto);
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
	
	/** (강사) 학생 메모 수정 */
	public int updateStudentMemo(int idx, String memo) {
	    int result = 0;
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = "UPDATE member2 SET memo = ? WHERE idx = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, memo);
	        ps.setInt(2, idx);
	        result = ps.executeUpdate();
	        System.out.println("DAO updateStudentMemo() 성공: result = " + result);
	    } catch (Exception e) {
	        System.out.println("DAO updateStudentMemo() 실패");
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	    return result;
	}
	
	/** (강사) 강사정보로 해당 담당강좌 학생목록만 출력 */
	public ArrayList<MemberDTO> findStudentsByTeacher(String tname) {
	    ArrayList<MemberDTO> list = new ArrayList<>();
	    try {
	        conn = com.semi2.db.Semi2DB.getConn();
	        String sql = 
	        		"SELECT m1.idx, m2.m2idx, m1.name, m1.sex, TO_CHAR(m1.birth, 'YYYY-MM-DD') AS birth, " +
	        				"m1.tel, m1.email, m2.memo " +
	        				"FROM member1 m1 " +
	        				"JOIN member2 m2 ON m1.idx = m2.idx " +
	        				"JOIN class c ON m2.classidx = c.classidx " +
	        				"WHERE TRIM(c.tname) = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, tname.trim());

	        rs = ps.executeQuery();
	        while (rs.next()) {
	            MemberDTO dto = new MemberDTO();
	            dto.setIdx(rs.getInt("idx"));
	            dto.setM2idx(rs.getInt("m2idx"));
	            dto.setName(rs.getString("name"));
	            dto.setSex(rs.getString("sex"));
	            dto.setBirth(rs.getString("birth"));
	            dto.setTel(rs.getString("tel"));
	            dto.setEmail(rs.getString("email"));
	            dto.setMemo(rs.getString("memo")); // 추가된 부분
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
	
}