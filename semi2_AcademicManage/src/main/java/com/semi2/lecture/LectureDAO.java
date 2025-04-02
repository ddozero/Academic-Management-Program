package com.semi2.lecture;

import java.sql.*;
import java.util.*;

public class LectureDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public LectureDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**개설 강좌 조회 메서드-오진우*/
	public ArrayList<LectureDTO> lectureList(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String pwd="1234";
			conn=DriverManager.getConnection(url,user,pwd);
			String sql="select * from class";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<LectureDTO> arr=new ArrayList<LectureDTO>();
			while(rs.next()) {
				int classidx=rs.getInt("classidx");
				int groupidx=rs.getInt("groupidx");
				String classname=rs.getString("classname");
				String tname=rs.getString("tname");
				int entirescount=rs.getInt("entirescount");
				int reqscount=rs.getInt("reqscount");
				java.sql.Date comingdate=rs.getDate(" comingdate");
				java.sql.Date enddate=rs.getDate("enddate");
				java.sql.Date entiredate=rs.getDate("entiredate");
				String chargemname=rs.getString("chargemname");
				LectureDTO ldto=new LectureDTO(classidx, groupidx, classname, tname, entirescount, reqscount, comingdate, enddate, entiredate, chargemname);
				arr.add(ldto);
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
				e2.printStackTrace();
			}
		}
		
		
	}
}
