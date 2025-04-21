package com.semi2.lecture;

import java.sql.*;
import java.util.*;
import com.semi2.group.GroupDTO;
import com.semi2.member.*;

public class MLectureDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public MLectureDAO() {

	}

	/** (매니저)강좌관리 페이지 - 매니저,강사 목록 가져오기 */
	public ArrayList<MemberDTO> managerMemberPick(int midx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select name from member1 where midx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			rs = ps.executeQuery();

			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			while (rs.next()) {
				String name = rs.getString("name");

				MemberDTO dto = new MemberDTO();
				dto.setName(name);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	/** (매니저)강좌관리 페이지 - 반 목록 가져오기 (미사용) */
	public ArrayList<GroupDTO> managerLecturePick() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select * from classgroup";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<GroupDTO> arr = new ArrayList<GroupDTO>();

			while (rs.next()) {
				int groupidx = rs.getInt("groupidx");
				String groupname = rs.getString("groupname");
				String mname = rs.getString("mname");
				String tname = rs.getString("tname");
				int scount = rs.getInt("scount");

				GroupDTO dto = new GroupDTO(groupidx, groupname, mname, tname, scount);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	/** (매니저) 강좌등록 -  강사 등록된 반 가져오기 */
	public int getGroupname(String tname) {
		
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select groupidx from classgroup where trim(tname) = ?";
					
			ps = conn.prepareStatement(sql);
			ps.setString(1, tname.trim());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("groupidx");
			}
			return  -1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 강좌 등록 - 강사 등록된 매니저 가져오기 */
	public String getMname(int groupidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select mname from classgroup where groupidx = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, groupidx);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getString("mname");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	

//	/** (매니저)강좌관리 페이지 - 강좌 등록을 위한 반 고유번호 조회 구현 */
//	public int GroupIdxSearch(String groupname) { //수강반명 이름을 기준으로 반idx값 조회
//		try {
//			conn = com.semi2.db.Semi2DB.getConn();
//			String sql = "select groupidx from CLASSGROUP where groupname = ?";
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, groupname);
//			rs = ps.executeQuery();
//
//			if (rs.next()) {
//				return rs.getInt("groupidx");
//			}
//			return -1;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return -1;
//		} finally {
//			try {
//				if (rs != null)rs.close();
//				if (ps != null)ps.close();
//				if (conn !=null)conn.close();
//
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
//	}

	/** (매니저)강좌관리 페이지 - 강좌 등록 메소드 구현 */

	public int managerLectureAdd(ManagerLectureDTO dto) {
		try {
			Connection conn = null;
			PreparedStatement ps = null;
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, ?, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), to_date(?,'yyyy-mm-dd'), ?, ?,?)";
			ps = conn.prepareStatement(sql);
			
			int groupidx = getGroupname(dto.getTname().trim());
			if(groupidx<=0) { //아직 등록된 강좌가 없으니, 없는 상태에서 name에서 찾아서 idx를 가져옴
				System.out.println("groudidx :  " + dto.getTname());			
			}
			
			String chargemname = getMname(groupidx);
			
			ps.setInt(1,groupidx);
			ps.setString(2, dto.getClassname());
			ps.setString(3, dto.getTname());
			ps.setInt(4, dto.getEntirescount());
			ps.setInt(5, dto.getReqscount());
			ps.setString(6, dto.getComingdate());
			ps.setString(7, dto.getEnddate());
			ps.setInt(8, dto.getEntiredate());
			ps.setString(9, chargemname);
			ps.setString(10, dto.getClassintro());
			
			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)ps.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** (매니저) 등록 강좌 목록 조회 메소드 */
	public ArrayList<ManagerLectureDTO> managerLectureInfo() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate, c.entiredate, c.chargemname\r\n"
					+ "from class c, classgroup g\r\n"
					+ "where c.groupidx = g.groupidx\r\n"
					+ "order by classidx asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<ManagerLectureDTO> arr = new ArrayList<ManagerLectureDTO>();

			while (rs.next()) {
				int classidx = rs.getInt("classidx");
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");

				ManagerLectureDTO dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,
						reqscount, comingdate, enddate, entiredate, chargemname, groupname);
			
				arr.add(dto);
			}
			return arr;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/** (매니저) 등록 강좌 삭제 메소드 */
	public int managerLectureDel(int classidx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "Delete from class where classidx = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, classidx);
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 등록 강좌 수정 정보 조회 메소드 */
	public ManagerLectureDTO managerLectureUpSh(int classidx) {
		try {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			conn=com.semi2.db.Semi2DB.getConn();
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate, c.entiredate, c.chargemname, c.classintro\r\n"
					+ "from class c, classgroup g\r\n"
					+ "where c.groupidx = g.groupidx and classidx = ?\r\n"
					+ "order by classidx asc";
			ps = conn.prepareStatement(sql);
			
			
			ps.setInt(1, classidx);
			rs = ps.executeQuery();
			
			ManagerLectureDTO dto = null;
			
			if(rs.next()) {
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");
				String classintro = rs.getString("classintro");
				
				dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,reqscount, comingdate, enddate, entiredate, chargemname, groupname, classintro);
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
			}
		}
	}
	
	/** (매니저) 등록 강좌 수정 메소드 */
	public int managerLectureUp(ManagerLectureDTO dto) {
		try {
			Connection conn = null;
			PreparedStatement ps = null;
			
			conn=com.semi2.db.Semi2DB.getConn();
			
			String sql="update class set\r\n"
					+ "groupidx = ?, classname = ?, entirescount = ?, reqscount = ?, comingdate = to_date(?, 'yyyy-mm-dd'), enddate = to_date(?, 'yyyy-mm-dd'), entiredate = ?, classintro =?\r\n"
					+ "where classidx = ?";
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getGroupidx());
			ps.setString(2, dto.getClassname());
			ps.setInt(3, dto.getEntirescount());
			ps.setInt(4, dto.getReqscount());
			ps.setString(5, dto.getComingdate());
			ps.setString(6, dto.getEnddate());
			ps.setInt(7, dto.getEntiredate());
			ps.setString(8, dto.getClassintro());
			ps.setInt(9, dto.getClassidx());
			
			int count = ps.executeUpdate();
			return count;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 세부 강좌 조회 메소드 */
	public ManagerLectureDTO managerLectureList(int classidx){
		try {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			conn=com.semi2.db.Semi2DB.getConn();
			
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate,\r\n"
					+ "c.entiredate, c.chargemname, c.classintro\r\n"
					+ "from class c, classgroup g\r\n"
					+ "where c.groupidx = g.groupidx \r\n"
					+ "and c.classidx=?\r\n";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs = ps.executeQuery();
			
			ManagerLectureDTO dto = null;
			
			if(rs.next()) {
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");
				String classintro = rs.getString("classintro");
				
				dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,reqscount, comingdate, enddate, entiredate, chargemname, groupname, classintro);
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
	/**(매니저) 강좌 목록 - 검색 기능*/
	public ArrayList<ManagerLectureDTO> lectureFind(String fkey, String fvalue){
		try {
			 Connection conn = null;
			 PreparedStatement ps = null;
			 ResultSet rs = null;
			 conn=com.semi2.db.Semi2DB.getConn();
			
			if ("classidx".equals(fkey)) {
			    fkey = "c.classidx";
			} else if ("tname".equals(fkey)) {
			    fkey = "c.tname";
			} else if ("groupidx".equals(fkey)) {
			    fkey = "g.groupidx";
			}
			
			String sql = "select c.classidx, g.groupidx, g.groupname, c.classname, c.tname, c.entirescount, c.reqscount, " +
		             "to_char(c.comingdate, 'yyyy-mm-dd') as comingdate, to_char(c.enddate, 'yyyy-mm-dd') as enddate, " +
		             "c.entiredate, c.chargemname " +
		             "from class c, classgroup g " +
		             "where c.groupidx = g.groupidx " +
		             "and " + fkey + " = ? ";

			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs=ps.executeQuery();
			
			ArrayList<ManagerLectureDTO> arr = new ArrayList<ManagerLectureDTO>();
			
			while (rs.next()) {
				int classidx = rs.getInt("classidx");
				int groupidx = rs.getInt("groupidx");
				String classname = rs.getString("classname");
				String tname = rs.getString("tname");
				int entirescount = rs.getInt("entirescount");
				int reqscount = rs.getInt("reqscount");
				String comingdate = rs.getString("comingdate");
				String enddate = rs.getString("enddate");
				int entiredate = rs.getInt("entiredate");
				String chargemname = rs.getString("chargemname");
				String groupname = rs.getString("groupname");

				ManagerLectureDTO dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,
						reqscount, comingdate, enddate, entiredate, chargemname, groupname);
				arr.add(dto);
				
				System.out.println("fkey: " + fkey);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

}
