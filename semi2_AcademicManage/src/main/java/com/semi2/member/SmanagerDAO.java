package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SmanagerDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
   public static final int NOT_ID=1;
   public static final int NOT_PWD=2;
   public static final int LOGIN_OK=3;
   public static final int ERROR=-1;
	
	
	//* 매니저 관리 게시판에서 매니저만 조회하는 메서드*/
	   public MemberDTO managerFind(int idx) {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql="select * from MEMBER1 where idx=?";
	             ps=conn.prepareStatement(sql);
	             ps.setInt(1, idx);
	             rs=ps.executeQuery();
	             
	             rs.next();
	             MemberDTO dto = new MemberDTO();
	             	dto.setIdx(rs.getInt("idx"));
					dto.setMidx(rs.getInt("midx"));
					dto.setName(rs.getString("name"));
					dto.setSex(rs.getString("sex"));
					dto.setTel(rs.getString("tel"));
					dto.setEmail(rs.getString("email"));
					dto.setAddr(rs.getString("addr"));
					dto.setBirth(rs.getString("birth"));
	             return dto;
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
	   
	   //* 매니저가 가입했을 때 입사날짜 저장해서 불러오는 메서드 */
	   public int managerInfoAdd(int idx) {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql ="INSERT INTO member3 VALUES (sq_member3_m3idx.nextval, ?, 1, 1,'N', 'N', sysdate,'N', 'N', 'N', 'N');";
	             
	             ps = conn.prepareStatement(sql);
	             ps.setInt(1, idx);
	             int count = ps.executeUpdate();
	             
	             return count;
	          }catch(Exception e) {
	             e.printStackTrace();
	             return ERROR;
	          }finally {
	             try {
	                if(ps!=null)ps.close();
	                if(conn!=null)conn.close();
	             }catch(Exception e2) {
	                e2.printStackTrace();
	             }
	          }
	   }
	   
	   //* 매니저 계정 삭제 메서드 */
	   public int managerDelete(int idx) {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql ="delete from member1 where idx = ?";
	             
	             ps = conn.prepareStatement(sql);
	             ps.setInt(1, idx);
	             int count = ps.executeUpdate();
	             
	             return count;
	          }catch(Exception e) {
	             e.printStackTrace();
	             return ERROR;
	          }finally {
	             try {
	                if(ps!=null)ps.close();
	                if(conn!=null)conn.close();
	             }catch(Exception e2) {
	                e2.printStackTrace();
	             }
	          }
	   }
}
