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
			String sql = "select m2.m2idx,m1.idx, name,sex,id,pwd,tel,email,addr, to_char(birth, 'yyyy-mm-dd') as birth,appro \r\n"
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
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 학생 세부 정보 조회 */
	public MemberDTO mstudentInfoDetail(int midx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select m1.midx, m1.idx, m1.name, m1.sex, m1.birth, m1.addr, m1.tel, m1.email, m2.edu, m2.career, g.groupname, c.classname, c.comingdate, c.enddate, m2.imgaddr, m2.memo\r\n"
					+ "from member1 m1, member2 m2, classgroup g, class c\r\n"
					+ "where m1.idx = m2.idx\r\n"
					+ "and m2.classidx = c.classidx\r\n"
					+ "and g.groupidx = c.groupidx \r\n"
					+ "and m1.midx = 2";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			rs = ps.executeQuery();
			
			MemberDTO dto = null;
			
			if(rs.next()) {
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
	
}
