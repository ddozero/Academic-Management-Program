package com.semi2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.http.HttpSession;

public class AMemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	   public static final int NOT_ID=1;
	   public static final int NOT_PWD=2;
	   public static final int LOGIN_OK=3;
	   public static final int ERROR=-1;
	
	public AMemberDAO() {
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
					sql += " order by appro asc,idx asc";
				}else if(sort.equals("4")){
					sql += " where midx = 4 or midx = 0 order by idx asc";
				}else {
					sql += " order by idx asc";
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
	   
	   //* idx가 발생하는 시기가 insert쿼리 생성되고 나서 발생하는 숫자라 만들어지고 나서의 max값 가져오기 */
	   public int maxIdx() {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql="select max(idx) from member1";
	             
	             ps = conn.prepareStatement(sql);
	             rs = ps.executeQuery();
	             
	             rs.next();  
	             
	             System.out.println(rs.getInt(1));
	             return rs.getInt(1);

	          }catch(Exception e) {
	             e.printStackTrace();
	             return 0;
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
	   
	 //* 매니저 관리 게시판에서 매니저만 조회하는 메서드*/
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
				
					
				String sql2 ="select * from member3 where idx=?";
				ps = conn.prepareStatement(sql2);
				ps.setInt(1, idx);
				rs=ps.executeQuery();
				
				rs.next();
					dto.setComingdate(rs.getDate("comingdate"));
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
	   
	   //* 매니저 계정 삭제 메서드 */
	   public int memberDelete(int idx) {
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
	   
	   //* 회원가입을 할 때 member1테이블 말고도 member2 || 3 이 만들어져서 참조키 때문에 삭제가 안돼서 해당 메서드로 대체 */
	   public int[] addHiddenIdx(HttpSession session, String idxx_s) {
		    int[] arr = (int[]) session.getAttribute("idxHidden");

		    if (arr == null) {
		        arr = new int[10];
		    }

		    if (idxx_s != null) {
		        try {
		            int idxx = Integer.parseInt(idxx_s);
		            for (int i = 0; i < arr.length; i++) {
		                if (arr[i] == 0) {
		                    arr[i] = idxx;
		                    break;
		                }
		            }
		            session.setAttribute("idxHidden", arr); // 세션에 저장
		        } catch (NumberFormatException e) {
		            e.printStackTrace(); // 예외 방어 코드
		        }
		    }

		    return arr;
		}
	   
		
		public int memberJoin(MemberDTO dto) {
			try {
				conn = com.semi2.db.Semi2DB.getConn();
				
				String sql = "insert into MEMBER1 values(sq_MEMBER1_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), ?)";
				
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
				ps.setInt(10, dto.getAppro());
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
	   
	   //* 매니저가 가입했을 때 입사날짜 저장해서 불러오는 메서드 // Member3 table create */
	   public int addMember3(int idx) {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql ="insert into member3 values (sq_member3_m3idx.nextval, ?, 0, 0,'N', 'N', sysdate,'N', 'N', 'N', 'defaultpf.jpg')";
	             
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
	   
	   //* member2 table create*/
	   public int addMember2(int idx) {
	         try {
	             conn = com.semi2.db.Semi2DB.getConn();
	             
	             String sql="insert into member2 values(sq_MEMBER2_m2idx.nextval,?,0,0,'N','N','N','N','N','defaultpf.jpg')";
	             ps = conn.prepareStatement(sql);
	             ps.setInt(1, idx);
	             
	             int count = ps.executeUpdate();
	             
	             return count;
	             
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
	   
	   
	   //* 회원별 승인 처리 */
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
	   
	   //* 매니저 개인정보 수정 */
	   public int memUpdate(MemberDTO dto) {
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
	           String sql2 = "update member3 set career=?, groupname=?, memo=? where idx=?";
	           
	           ps = conn.prepareStatement(sql2);
	           
	           ps.setString(1, dto.getCareer());
	           ps.setString(2, dto.getGroupname());
	           ps.setString(3, dto.getMemo());
	           ps.setInt(4, dto.getIdx());
	           
	           int result2 = ps.executeUpdate();

	           return result1 + result2;

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
	   
	   public int manaImg(int idx, String img) {
	       try {
	           conn = com.semi2.db.Semi2DB.getConn();

	           String sql1 = "update member3 set imgaddr=? where idx=?";
	           
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

	   	public String autoInt() {
	   		int ran1 = (int)(Math.random() * (57 - 48 + 1)) + 48;
	   		int ran2 = (int)(Math.random() * (90 - 65 + 1)) + 65;
	   		int ran3 = (int)(Math.random() * (122 - 97 + 1)) + 97;
	   		int ran4 = (int)(Math.random() * (57 - 48 + 1)) + 48;
	   		int ran5 = (int)(Math.random() * (90 - 65 + 1)) + 65;
	   		int ran6 = (int)(Math.random() * (122 - 97 + 1)) + 97;

	   		char[] chars = new char[6];
	   		chars[0] = (char)ran1;
	   		chars[1] = (char)ran2;
	   		chars[2] = (char)ran3;
	   		chars[3] = (char)ran4;
	   		chars[4] = (char)ran5;
	   		chars[5] = (char)ran6;

	   		ArrayList<Character> charList = new ArrayList<>();
	   		for (int i = 0; i < chars.length; i++) {
	   		    charList.add(chars[i]);
	   		}

	   		Collections.shuffle(charList);

	   		StringBuilder result = new StringBuilder();
	   		
	   		for (int i = 0; i < charList.size(); i++) {
	   		    result.append(charList.get(i));
	   		}

	   		return result.toString();
	   	}
   }
