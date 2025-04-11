package com.semi2.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.semi2.member.*;

public class MstudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MstudentDAO() {
		
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
	
}
