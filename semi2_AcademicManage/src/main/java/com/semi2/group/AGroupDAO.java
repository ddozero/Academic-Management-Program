package com.semi2.group;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.semi2.lecture.LectureDTO;
import com.semi2.lecture.ManagerLectureDTO;
import com.semi2.member.MemberDTO;

public class AGroupDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public AGroupDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<GroupDTO> selectGroup() {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "select * from CLASSGROUP order by groupidx asc" ;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            ArrayList<GroupDTO> arr = new ArrayList<GroupDTO>();
            while(rs.next()) {
            	int groupidx = rs.getInt("groupidx");
            	String groupname = rs.getString("groupname");
            	String mname = rs.getString("mname");
            	String tname = rs.getString("tname");
            	int scoutn = rs.getInt("scount");
            	
            	GroupDTO gdto = new GroupDTO();
            	gdto.setGroupidx(groupidx);
            	gdto.setGroupname(groupname);
            	gdto.setMname(mname);
            	gdto.setTname(tname);
            	gdto.setScount(scoutn);
            	
            	arr.add(gdto);
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
	//* 반 객체 생성 */
	public int groupJoin() {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "insert into CLASSGROUP values(sq_CLASSGROUP_groupidx.nextval, 0, 'N', 'N', 'N', 0)";
            
            ps = conn.prepareStatement(sql);
            
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
	
	//* 매니저 이름 불러오기 */
	public ArrayList<MemberDTO> selectManager(){
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "select * from member1 where midx = 4";

            
            ps = conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
            while(rs.next()){
            	MemberDTO dto = new MemberDTO();
            	dto.setIdx(rs.getInt("idx"));
            	dto.setName(rs.getString("name"));
            	
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
	
	//* 강사 이름 불러오기 */
	public ArrayList<MemberDTO> selectTeacher(){
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "select * from member1 where midx = 3";

            
            ps = conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
            while(rs.next()){
            	MemberDTO dto = new MemberDTO();
            	dto.setIdx(rs.getInt("idx"));
            	dto.setName(rs.getString("name"));
            	
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
	
	//* 그룹 업데이트 : 정보 수정 */
	public int updateGroup(GroupDTO gdto) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "update classgroup set groupname=?, mname=?, tname=?, scount=? where groupidx=?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, gdto.getGroupname());
            ps.setString(2, gdto.getMname());
            ps.setString(3, gdto.getTname());
            ps.setInt(4, gdto.getScount());
            ps.setInt(5, gdto.getGroupidx());
            
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
	
	//* 반 삭제 */
	public int deleteGroup(int gidx) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "delete from classgroup where groupidx = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gidx);
            
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
	// 강사이름으로 담당강좌 찾기
	/**개설 강좌 조회 메서드-오진우*/
	public LectureDTO findLectureByTname(String tName){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			
			String sql="select * from class where tname = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, tName);
			rs=ps.executeQuery();
			while(rs.next()) {
				int classidx=rs.getInt("classidx");
				String classname=rs.getString("classname");
				String tname=rs.getString("tname");
				int reqscount=rs.getInt("reqscount");
				int entirescount=rs.getInt("entirescount");
				java.sql.Date comingdate=rs.getDate("comingdate");
				java.sql.Date enddate=rs.getDate("enddate");
				int entiredate=rs.getInt("entiredate");
				
				LectureDTO ldto=new LectureDTO();
				ldto.setClassidx(classidx);
				ldto.setClassname(classname);
				ldto.setTname(tname);
				ldto.setReqscount(reqscount);
				ldto.setEntirescount(entirescount);
				ldto.setComingdate(comingdate);
				ldto.setEnddate(enddate);
				ldto.setEntiredate(entiredate);
				
				return ldto;
			}
			return null;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<MemberDTO> inGroup(String groupName) {
        try {
            conn = com.semi2.db.Semi2DB.getConn();
            
            String sql = "select m1.name, m1.id, m1.tel, m1.email, m2.groupname from member1 m1 , member2 m2 where m1.idx=m2.idx and m2.groupname = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, groupName);
            rs = ps.executeQuery();
            
            ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
            
            while(rs.next()) {
            	MemberDTO dto = new MemberDTO();
            	dto.setName(rs.getString("name"));
            	dto.setId(rs.getString("id"));
            	dto.setTel(rs.getString("tel"));
            	dto.setEmail(rs.getString("email"));
            	dto.setGroupname(rs.getString("groupname"));
            	
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
	
	
	
}
