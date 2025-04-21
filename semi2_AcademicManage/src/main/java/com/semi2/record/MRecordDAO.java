package com.semi2.record;

import java.sql.*;
import java.util.ArrayList;
import com.semi2.group.GroupDTO;
import com.semi2.member.MemberDTO;
import com.semi2.record.*;

public class MRecordDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MRecordDAO(){
		
	}
	
	/** (매니저) 반 정보 옵션값 가져오기 메소드*/
	public ArrayList<GroupDTO> groupSelect(){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select * from CLASSGROUP where groupname not in('미지정') ";
			
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<GroupDTO> arr = new ArrayList<GroupDTO>();
			
			while(rs.next()) {
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
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/** (매니저) 강사 출결 정보 가져오기 메소드 */
	public ArrayList<RecordDTO> mtrecordSelectList(int midx, int groupidx, Date attendate){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select r.recordidx, r.midx, r.idx, c.classidx, r.recordtime, r.entirate, r.currate, r.status, r.attendate, r.intime, r.outtime, c.classname, g.groupname, g.groupidx, m1.name\r\n"
					+ "from record r, class c, classgroup g, member1 m1\r\n"
					+ "where r.classidx = c.classidx\r\n"
					+ "and c.groupidx = g.groupidx\r\n"
					+ "and r.idx = m1.idx\r\n"
					+ "and r.midx =? and g.groupidx =?\r\n"
					+ "and trunc(r.attendate) = trunc(?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			ps.setInt(2, groupidx);
			ps.setDate(3, attendate);
			rs = ps.executeQuery();
			
			ArrayList<RecordDTO> arr = new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				int recordidx = rs.getInt("recordidx");
				int idx = rs.getInt("idx");
				int classidx = rs.getInt("classidx");
				int recordtime = rs.getInt("recordtime");
				int entirate = rs.getInt("entirate");
				int currate = rs.getInt("currate");
				int status = rs.getInt("status");
				Timestamp intime = rs.getTimestamp("intime");
				Timestamp outtime = rs.getTimestamp("outtime");
				String classname = rs.getString("classname");
				String groupname = rs.getString("groupname");
				String name = rs.getString("name");
		
				
				RecordDTO dto = new RecordDTO(recordidx, midx, idx, classidx, recordtime, entirate, currate,
						status, attendate, intime, outtime, classname, groupname,groupidx,name);
				
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
	
	
	/**(매니저) 학생 출결 정보 가져오기 메소드 */
	public ArrayList<RecordDTO> msrecordSelectList(int midx, int groupidx, Date attendate){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select r.recordidx, r.midx, r.idx, m2.classidx, r.recordtime, r.entirate, r.currate, r.status, r.attendate, r.intime, r.outtime, c.classname, m2.groupname, m2.groupidx, m1.name\r\n"
					+ "from record r, class c, classgroup g, member1 m1, member2 m2 \r\n"
					+ "where r.midx = ?\r\n"
					+ "and m2.groupidx = ?\r\n"
					+ "and r.idx = m1.idx\r\n"
					+ "and m1.idx = m2.idx\r\n"
					+ "and m2.classidx = c.classidx\r\n"
					+ "and m2.groupidx = g.groupidx\r\n"
					+ "and trunc(r.attendate) = trunc(?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			ps.setInt(2, groupidx);
			ps.setDate(3, attendate);
			rs = ps.executeQuery();
			
			ArrayList<RecordDTO> arr = new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				int recordidx = rs.getInt("recordidx");
				int idx = rs.getInt("idx");
				int classidx = rs.getInt("classidx");
				int recordtime = rs.getInt("recordtime");
				int entirate = rs.getInt("entirate");
				int currate = rs.getInt("currate");
				int status = rs.getInt("status");
				Timestamp intime = rs.getTimestamp("intime");
				Timestamp outtime = rs.getTimestamp("outtime");
				String classname = rs.getString("classname");
				String groupname = rs.getString("groupname");
				String name = rs.getString("name");
		
				
				RecordDTO dto = new RecordDTO(recordidx, midx, idx, classidx, recordtime, entirate, currate,
						status, attendate, intime, outtime, classname, groupname,groupidx,name);
				
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
	
	
	
	/** (매니저) 강사, 학생 출결관리 - 총 근무시간 수정 메소드 */
	public int recordTimeUp(RecordDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "update record set recordtime = ? where recordidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getRecordtime());
			ps.setInt(2, dto.getRecordidx());
			
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
	
	
	/**(매니저) 강사, 학생 출결관리 검색 조회(이름) */
	public ArrayList<RecordDTO> attendFind(String name, int groupidx, Date attendate){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select DISTINCT r.recordidx, r.midx, r.idx, c.classidx, r.recordtime, r.entirate, r.currate, r.status, r.attendate, r.intime, r.outtime, c.classname, g.groupname, g.groupidx, m1.name\r\n"
					+ "from record r, class c, classgroup g, member1 m1\r\n"
					+ "where r.classidx = c.classidx\r\n"
					+ "and c.groupidx = g.groupidx\r\n"
					+ "and r.idx = m1.idx\r\n"
					+ "and m1.name like ?\r\n"
					+ "and g.groupidx = ?\r\n"
					+ "and trunc(r.attendate) = trunc(?)\r\n";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,"%" + name + "%");
			ps.setInt(2, groupidx);
			ps.setDate(3, attendate);
			
			rs = ps.executeQuery();
			
			ArrayList<RecordDTO> arr = new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				int recordidx = rs.getInt("recordidx");
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				int classidx = rs.getInt("classidx");
				int recordtime = rs.getInt("recordtime");
				int entirate = rs.getInt("entirate");
				int currate = rs.getInt("currate");
				int status = rs.getInt("status");
				Timestamp intime = rs.getTimestamp("intime");
				Timestamp outtime = rs.getTimestamp("outtime");
				String classname = rs.getString("classname");
				String groupname = rs.getString("groupname");
		
				
				RecordDTO dto = new RecordDTO(recordidx, midx, idx, classidx, recordtime, entirate, currate,
						status, attendate, intime, outtime, classname, groupname,groupidx,name);
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
	
	/**(매니저) 강사,학생 근태관리 상태값 변경 */
	public int lectureStatusUp(RecordDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "update record set status = ? where recordidx = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getStatus());
			ps.setInt(2, dto.getRecordidx());
			
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
	
	/**(매니저) 수강생 출결 질병 / 조퇴 목록 조회 */
	public ArrayList<RecordDTO> msRecordFile(int groupidx){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select rs.issueidx,r.recordidx,r.midx,m1.idx,m1.name,m2.groupname,c.classname,rs.issuestatus,rs.issuedivi,rs.filename,rs.appro,rs.reqdate,m2.groupidx \r\n"
					+ "from recordissue rs \r\n"
					+ "join member1 m1 on rs.idx=m1.idx \r\n"
					+ "join member2 m2 on m1.idx=m2.idx \r\n"
					+ "left join (select * from record where recordidx in (select min(recordidx) from record \r\n"
					+ "group by idx)) r on rs.idx=r.idx \r\n"
					+ "left join class c on r.classidx=c.classidx \r\n"
					+ "where m2.groupidx=?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, groupidx);
			rs = ps.executeQuery();
			
			ArrayList<RecordDTO> arr = new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				int recordidx = rs.getInt("recordidx");
				int issueidx = rs.getInt("issueidx");
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String groupname = rs.getString("groupname");
				String classname = rs.getString("classname");
				String issuestatus = rs.getString("issuestatus");
				String issuedivi = rs.getString("issuedivi");
				String filename = rs.getString("filename");
				int appro = rs.getInt("appro");
				Date reqdate = rs.getDate("reqdate");
				
				RecordDTO dto = new RecordDTO(recordidx, issueidx, midx, idx, name, groupname, classname, issuestatus,issuedivi, filename,appro, reqdate, groupidx);
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
	
	/**(매니저) 수강생 출결 질병 / 조퇴 인정 - 승인/미승인  */
	public int msAttendIssue(RecordDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "update recordissue set appro = ?, issuestatus = ? where issueidx = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getAppro());
			ps.setString(2, dto.getIssuestatus());
			ps.setInt(3, dto.getIssueidx());

			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**(매니저) 수강생 출결 관리 학생 이름 검색 후 목록 조회 (미구현)*/
	public ArrayList<RecordDTO> msAttendFind(String fkey, String fvalue){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			
			String sql = "select r.recordidx, r.midx, r.idx, m2.classidx, r.recordtime, r.entirate, r.currate, r.status, r.attendate, r.intime, r.outtime, c.classname, m2.groupname, m2.groupidx, m1.name\r\n"
					+ "from record r, class c, classgroup g, member1 m1, member2 m2\r\n"
					+ "where r.midx = '2'\r\n"
					+ "and r.idx = m1.idx\r\n"
					+ "and m1.idx = m2.idx\r\n"
					+ "and m2.classidx = c.classidx\r\n"
					+ "and m2.groupidx = g.groupidx"
					+ "and " + fkey + " = ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs = ps.executeQuery();
			
			ArrayList<RecordDTO> arr = new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				int recordidx = rs.getInt("recordidx");
				int midx = rs.getInt("midx");
				int idx = rs.getInt("idx");
				int classidx = rs.getInt("classidx");
				int recordtime = rs.getInt("recordtime");
				int entirate = rs.getInt("entirate");
				int currate = rs.getInt("currate");
				int status = rs.getInt("status");
				Date attendate = rs.getDate("attendate");
				Timestamp intime = rs.getTimestamp("intime");
				Timestamp outtime = rs.getTimestamp("outtime");
				String classname = rs.getString("classname");
				String groupname = rs.getString("groupname");
				int groupidx = rs.getInt("groupidx");
				String name = rs.getString("name");
		
				
				RecordDTO dto2 = new RecordDTO(recordidx, midx, idx, classidx, recordtime, entirate, currate,
						status, attendate, intime, outtime, classname, groupname,groupidx,name);
				arr.add(dto2);
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

