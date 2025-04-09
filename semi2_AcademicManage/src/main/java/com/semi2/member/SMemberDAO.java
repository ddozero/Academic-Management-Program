package com.semi2.member;

import java.sql.*;


public class SMemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	/**학생 강좌 신청 -오진우*/
	public int studentAddLecture(int classidx,int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update member2 set classidx=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			int result=ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
	}
	/**학생 강좌 취소 - 오진우*/
	public int studentDelLecture(int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update member2 set classidx=0 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int result=ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
	}
	
}
