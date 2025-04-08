package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	   public int loginCheck(String userid, String userpwd) {
		      try {
		         conn = com.semi2.db.Semi2DB.getConn();
		         String sql = "select pwd from MEMBER1 where id=?";
		         ps = conn.prepareStatement(sql);
		         ps.setString(1, userid);
		         rs = ps.executeQuery();
		         if(rs.next()) {
		            String dbpwd = rs.getString("pwd");
		            if(dbpwd.equals(userpwd)) {
		               return LOGIN_OK;
		            }else {
		               return NOT_PWD;
		            }
		         }else {
		            return NOT_ID;
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		         return ERROR;
		      }finally {
		         try {
		            if(rs!=null)rs.close();
		            if(ps!=null)ps.close();
		            if(conn!=null)conn.close();                        
		         } catch (Exception e2) {}
		      }
		   }
	
	   public MemberDTO getUserInfo(String userid) {
		      try {
		         conn = com.semi2.db.Semi2DB.getConn();
		         String sql = "select * from MEMBER1 where id=?";
		         ps= conn.prepareStatement(sql);
		         ps.setString(1, userid);
		         rs = ps.executeQuery();
		         
		         MemberDTO dto = new MemberDTO();
		         
		         if(rs.next()) {
		        	 dto.setIdx(rs.getInt("idx"));
		        	 dto.setMidx(rs.getInt("midx"));
		        	 dto.setName(rs.getString("name"));
		        	 dto.setId(rs.getString("id"));
		        	 dto.setPwd(rs.getString("pwd"));
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
		         } catch (Exception e2) {}
		      }
		   }
	   
	   //*계정 목록 게시판 회원 조회*/
	   public ArrayList<MemberDTO> memSelect(String sort){
			try {
				conn = com.semi2.db.Semi2DB.getConn();
				
				String sql = "select * from MEMBER1";
				
				if(sort.equals("1")) {
					sql += " order by appro asc";
				}else {
					sql += "";
				}
				
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
				
				while(rs.next()) {
					int idx = rs.getInt("idx");
					int midx = rs.getInt("midx");
					String name = rs.getString("name");
					String sex = rs.getString("sex");
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String tel = rs.getString("tel");
					String email = rs.getString("email");
					String addr = rs.getString("addr");
					String birth = rs.getString("birth");
					int appro = rs.getInt("appro");
					
					MemberDTO dto = new MemberDTO();
					dto.setIdx(idx);
					dto.setMidx(midx);
					dto.setName(name);
					dto.setSex(sex);
					dto.setId(id);
					dto.setPwd(pwd);
					dto.setTel(tel);
					dto.setEmail(email);
					dto.setAddr(addr);
					dto.setBirth(birth);
					dto.setAppro(appro);
					
					arr.add(dto);
				}
				return arr;
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
	   
	   //* 승인 처리 */
	   public int updateAcc(int idx) {
			try {
				conn = com.semi2.db.Semi2DB.getConn();
				
				String sql ="update MEMBER1 set appro = 1 where idx = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, idx);
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
