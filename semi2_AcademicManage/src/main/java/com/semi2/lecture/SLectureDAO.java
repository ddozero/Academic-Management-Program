package com.semi2.lecture;

import java.sql.*;
import java.util.ArrayList;

public class SLectureDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public SLectureDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**개설 강좌 조회 메서드-오진우*/
	public ArrayList<LectureDTO> lectureList(){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select * from class where not classidx=0";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<LectureDTO> arr=new ArrayList<LectureDTO>();
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
	
	/**개설 강좌 자세히 보기1-오진우*/
	public LectureDTO lectureDetail(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select * from class where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,classidx);
			rs=ps.executeQuery();
			LectureDTO ldto=null;
			if(rs.next()) {
				String classname=rs.getString("classname");
				String tname=rs.getString("tname");
				int reqscount=rs.getInt("reqscount");
				int entirescount=rs.getInt("entirescount");
				java.sql.Date comingdate=rs.getDate("comingdate");
				java.sql.Date enddate=rs.getDate("enddate");
				int entiredate=rs.getInt("entiredate");
				
				ldto=new LectureDTO();
				ldto.setClassidx(classidx);
				ldto.setClassname(classname);
				ldto.setTname(tname);
				ldto.setReqscount(reqscount);
				ldto.setEntirescount(entirescount);
				ldto.setComingdate(comingdate);
				ldto.setEnddate(enddate);
				ldto.setEntiredate(entiredate);
			}
			
			return ldto;
			
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
	

	/**개설 강좌 자세히 보기2-오진우*/
	public ArrayList<LectureDTO> lectureDetailList(int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select weeknum,weekname,weekcon from classdetil2 where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			ArrayList<LectureDTO> arr=new ArrayList<LectureDTO>();
			while(rs.next()) {
				int weeknum=rs.getInt("weeknum");
				String weekname=rs.getString("weekname");
				String weekcon=rs.getString("weekcon");
				
				LectureDTO ldto=new LectureDTO();
				ldto.setWeeknum(weeknum);
				ldto.setWeekname(weekname);
				ldto.setWeekcon(weekcon);

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
	
	/**개설 강좌 자세히 보기3-오진우*/
	public String lectureDetailList2(int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select classintro from classdetil where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			String classintro=null;
			if(rs.next()) {
				classintro=rs.getString("classintro");
			}
			return classintro;
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
	
	/**내 강좌 보기 -오진우*/
	public LectureDTO studentMyLecture(int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select c.classidx,c.classname,c.tname,c.reqscount,c.entirescount,c.comingdate,c.enddate,c.entiredate from class c,member2 m where c.classidx=m.classidx and m.idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			LectureDTO ldto=null;
			if(rs.next()) {
				int classidx=rs.getInt("classidx");
				String classname=rs.getString("classname");
				String tname=rs.getString("tname");
				int reqscount=rs.getInt("reqscount");
				int entirescount=rs.getInt("entirescount");
				java.sql.Date comingdate=rs.getDate("comingdate");
				java.sql.Date enddate=rs.getDate("enddate");
				int entiredate=rs.getInt("entiredate");
				
				ldto=new LectureDTO();
				ldto.setClassidx(classidx);
				ldto.setClassname(classname);
				ldto.setTname(tname);
				ldto.setReqscount(reqscount);
				ldto.setEntirescount(entirescount);
				ldto.setComingdate(comingdate);
				ldto.setEnddate(enddate);
				ldto.setEntiredate(entiredate);
				
			}
			
			return ldto;
			
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
