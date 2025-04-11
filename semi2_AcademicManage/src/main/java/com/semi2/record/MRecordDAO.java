package com.semi2.record;

import java.sql.*;
import java.util.ArrayList;
import com.semi2.group.GroupDTO;

public class MRecordDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MRecordDAO(){
		
	}
	
	/** (매니저) 그룹 정보 가져오기 메소드*/
	public ArrayList<GroupDTO> groupSelect(){
		try {
			conn = com.semi2.db.Semi2DB.getConn();
			String sql = "select * from CLASSGROUP where groupname not in('미지정') ";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<GroupDTO> arr = new ArrayList<GroupDTO>();
			
			while(rs.next()) {
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
	
	
	
}
