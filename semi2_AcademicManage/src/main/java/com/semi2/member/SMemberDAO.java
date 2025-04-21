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
	
	/**강좌 신청시 현재 인원 추가 -오진우*/
	public int studentAddLecture2(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update class set reqscount=reqscount+1 where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
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
	/**강좌 신청시 현재 인원 감소 -오진우*/
	public int  studentDelLecture2(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update class set reqscount=reqscount-1 where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
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
	
	//** 수강생 개인 정보 조회*/
	public MemberDTO memberFind(int idx) {
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
			rs.close();
			ps.close();
			
				
			String sql2 ="select * from member2 where idx=?";
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			rs.next();
				dto.setCareer(rs.getString("career"));
				dto.setGroupname(rs.getString("groupname"));
				dto.setMemo(rs.getString("memo"));
				dto.setImgaddr(rs.getString("imgaddr"));
				
				
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
	
	   public int stuImg(int idx, String img) {
	       try {
	           conn = com.semi2.db.Semi2DB.getConn();

	           String sql1 = "update member2 set imgaddr=? where idx=?";
	           
	           ps = conn.prepareStatement(sql1);
	           
	           ps.setString(1, img);
	           ps.setInt(2, idx);
	           
	           int count = ps.executeUpdate();

	           return count;

	       } catch (Exception e) {
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
	   
		//** 수강생 개인 정보 수정 */
		public int memberUpdate(MemberDTO dto) {
	        try {
	            conn = com.semi2.db.Semi2DB.getConn();
	            
		           // 1. member1 테이블 수정
		           String sql1 = "update member1 set name=?, sex=?, birth=to_date(?,'yyyy-mm-dd'), addr=?, tel=?, email=? where idx=?";
		           
		           ps = conn.prepareStatement(sql1);
		           
		           ps.setString(1, dto.getName());
		           ps.setString(2, dto.getSex());
		           ps.setString(3, dto.getBirth());
		           ps.setString(4, dto.getAddr());
		           ps.setString(5, dto.getTel());
		           ps.setString(6, dto.getEmail());
		           ps.setInt(7, dto.getIdx());
		           
		           int result1 = ps.executeUpdate();

		           ps.close();

		           // 2. member2 테이블 수정 (입사일 제외)
		           String sql2 = "update member2 set career=?, groupname=?, memo=? where idx=?";
		           
		           ps = conn.prepareStatement(sql2);
		           
		           ps.setString(1, dto.getCareer());
		           ps.setString(2, dto.getGroupname());
		           ps.setString(3, dto.getMemo());
		           ps.setInt(4, dto.getIdx());
					
		           int result2 = ps.executeUpdate();
		           
		           return result1 + result2;
					
	         }catch(Exception e) {
	            e.printStackTrace();
	            return -1;
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
