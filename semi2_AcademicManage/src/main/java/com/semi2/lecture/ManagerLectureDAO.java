package com.semi2.lecture;

import java.sql.*;
import java.util.*;
import com.semi2.group.GroupDTO;
import com.semi2.member.*;

public class ManagerLectureDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public ManagerLectureDAO() {

	}

	/** (매니저)강좌관리 페이지 - 매니저,강사 목록 가져오기 */
	public ArrayList<MemberDTO> managerMemberPick(int midx) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select name from member1 where midx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, midx);
			rs = ps.executeQuery();

			ArrayList<MemberDTO> memberPick = new ArrayList<MemberDTO>();
			while (rs.next()) {
				String name = rs.getString("name");

				MemberDTO dto = new MemberDTO();
				dto.setName(name);
				memberPick.add(dto);
			}
			return memberPick;
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

	/** (매니저)강좌관리 페이지 - 반 목록 가져오기 */
	public ArrayList<GroupDTO> managerLecturePick() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select * from classgroup";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<GroupDTO> arr = new ArrayList<GroupDTO>();

			while (rs.next()) {
				int groupidx = rs.getInt("groupidx");
				int idx = rs.getInt("idx");
				String groupname = rs.getString("groupname");
				String mname = rs.getString("mname");
				String tname = rs.getString("tname");
				int scount = rs.getInt("scount");

				GroupDTO dto = new GroupDTO(groupidx, idx, groupname, mname, tname, scount);
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

	/** (매니저)강좌관리 페이지 - 강좌 등록을 위한 반 고유번호 조회 구현 */
	public int GroupIdxSearch(String groupname) { //수강반명 이름을 기준으로 반idx값 조회
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select groupidx from CLASSGROUP where groupname = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, groupname);
			rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getInt("groupidx");
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	/** (매니저)강좌관리 페이지 - 강좌 등록 메소드 구현 */

	public int managerLectureAdd(ManagerLectureDTO dto) {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "INSERT INTO CLASS VALUES (sq_CLASS_classidx.nextval, ?, ?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), to_date(?,'yyyy-mm-dd'), ?, ?)";
			
			int groupIdx = dto.getGroupidx();
			if(groupIdx<=0) { //아직 등록된 강좌가 없으니, 없는 상태에서 name에서 찾아서 idx를 가져옴
				groupIdx = GroupIdxSearch(dto.getGroupname());				
			}
			ps = conn.prepareStatement(sql);
			ps.setInt(1,groupIdx);
			ps.setString(2, dto.getClassname());
			ps.setString(3, dto.getTname());
			ps.setInt(4, dto.getEntirescount());
			ps.setInt(5, dto.getReqscount());
			ps.setString(6, dto.getComingdate());
			ps.setString(7, dto.getEnddate());
			ps.setInt(8, dto.getEntiredate());
			ps.setString(9, dto.getChargemname());

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** (매니저) 등록 강좌 목록 조회 !! 학생 조회랑 겹침!! */
	public ArrayList<ManagerLectureDTO> managerLectureInfo() {
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select * from class order by classidx desc";
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

				ManagerLectureDTO dto = new ManagerLectureDTO(classidx, groupidx, classname, tname, entirescount,
						reqscount, comingdate, enddate, entiredate, chargemname);
			
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

}
