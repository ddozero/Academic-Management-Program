package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

public class MMemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**(매니저) 강사 목록 조회*/
	public ArrayList<MemberDTO> mteacherList(int midx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select m1.idx, m1.midx, m1.name,m1.sex,m1.tel,m1.email,m1.addr, to_char(m1.birth, 'yyyy-mm-dd') as birth,m1.appro,m3.m3idx,m3.comingdate \r\n"
					+ "from member1 m1, member3 m3\r\n"
					+ "where m1.idx = m3.idx \r\n"
					+ "and m1.midx = ? order by m3idx ";
			
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
				int appro = rs.getInt("appro");
				int m3idx = rs.getInt("m3idx");
				Date comingdate = rs.getDate("comingdate");
				
				MemberDTO dto = new MemberDTO(idx, midx, name, sex, tel, email, addr, birth, appro, m3idx, comingdate);
				
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
	
	/**(매니저) 강사 목록 세부 조회*/
	public MemberDTO mteacherListDetail(int idx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select m1.midx, m1.idx, m1.name, m1.sex, m1.tel, m1.email, m1.addr,to_char(m1.birth, 'yyyy-mm-dd') as birth, m1.appro, m3.m3idx, m3.classidx, m3.edu2, m3.career, c.comingdate, m3.groupname,m3.memo, m3.selecclass, c.enddate, m3.imgaddr\r\n"
					+ "from member1 m1, member3 m3, class c\r\n"
					+ "where m1.idx = m3.idx\r\n"
					+ "and m3.classidx = c.classidx\r\n"
					+ "and m1.idx = ?";
			
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
				int appro = rs.getInt("appro");
				int m3idx = rs.getInt("m3idx");
				int classidx = rs.getInt("classidx");
				String edu2 = rs.getString("edu2");
				String career = rs.getString("career");
				Date comingdate = rs.getDate("comingdate");
				String groupname = rs.getString("groupname");
				String memo = rs.getString("memo");
				String selecclass = rs.getString("selecclass");
				Date enddate = rs.getDate("enddate");
				String imgaddr = rs.getString("imgaddr");
				
				dto = new MemberDTO(idx, midx, name, sex, tel, email, addr, birth,appro, m3idx, classidx, edu2, career, comingdate, groupname,memo, selecclass, enddate, imgaddr);
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
