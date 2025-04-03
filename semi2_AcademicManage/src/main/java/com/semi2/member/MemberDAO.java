package com.joing.member;

/*
	public int memberJoin(MemberDTO dto) {
		try {
			conn = com.joing.db.JoingDB.getConn();
		}catch(Exception e) {
			e.printStackTrace();
			return ;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static final int ERROR = -1;
	private static final int NOT_ID = 1;
	private static final int NOT_PWD = 2;
	private static final int LOGIN_OK = 3;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean idCheck(String id) {
		try {
			conn = com.joing.db.JoingDB.getConn();
			
			String sql = "select * from MEMBER1 where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			return rs.next();
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	public int memberJoin(MemberDTO dto) {
		try {
			conn = com.joing.db.JoingDB.getConn();
			
			String sql = "insert into MEMBER1 values(sq_MEMBER1_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), 0)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getMidx());		
			ps.setString(2, dto.getName());		
			ps.setString(3, dto.getSex());		
			ps.setString(4, dto.getId());		
			ps.setString(5, dto.getPwd());		
			ps.setString(6, dto.getTel());		
			ps.setString(7, dto.getEmail());		
			ps.setString(8, dto.getAddr());
			ps.setString(9, dto.getBirth());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
