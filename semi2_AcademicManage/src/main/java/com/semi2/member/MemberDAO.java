package com.semi2.member;

/*
	public asd() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
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
	
	   public static final int NOT_ID=1;
	   public static final int NOT_PWD=2;
	   public static final int LOGIN_OK=3;
	   public static final int ERROR=-1;
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean idCheck(String id) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
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
			conn = com.semi2.db.Semi2DB.getConn();
			
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
	
	public int loginCheck(MemberDTO dto) {
	      try {
	          conn = com.semi2.db.Semi2DB.getConn();
	          
	          String sql = "select * from MEMBER1 where id=?";
	          ps = conn.prepareStatement(sql);
	          ps.setString(1, dto.getId());
	          rs = ps.executeQuery();
	          
	         if(!rs.next()) {
	        	 return NOT_ID;
	         }
	         
	         String sql1 = "select * from MEMBER1 where id=? and pwd = ?";
	         ps = conn.prepareStatement(sql1);
	          ps.setString(1, dto.getId());
	          ps.setString(2, dto.getPwd());
	          rs = ps.executeQuery();
	          
	          if (!rs.next()) {
	              return NOT_PWD;
	          } else {
	              dto.setIdx(rs.getInt("idx"));
	              dto.setMidx(rs.getInt("midx"));
	              dto.setName(rs.getString("name"));

	              return LOGIN_OK;
	          }
	          
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
	
	public MemberDTO getUserInfo(MemberDTO dto) {
			try {
				conn = com.semi2.db.Semi2DB.getConn();
				
				String sql="select * from MEMBER1 where id=? and pwd=?";
				
			}catch(Exception e) {
				e.printStackTrace();
				return null;
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
