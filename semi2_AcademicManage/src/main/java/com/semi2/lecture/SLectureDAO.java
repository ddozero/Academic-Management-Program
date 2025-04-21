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
			LectureDTO ldto=null;
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
				
				ldto=new LectureDTO();
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
				String classintro=rs.getString("classintro");
				
				ldto=new LectureDTO();
				ldto.setClassidx(classidx);
				ldto.setClassname(classname);
				ldto.setTname(tname);
				ldto.setReqscount(reqscount);
				ldto.setEntirescount(entirescount);
				ldto.setComingdate(comingdate);
				ldto.setEnddate(enddate);
				ldto.setEntiredate(entiredate);
				ldto.setClassintro(classintro);
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

	/**현재 신청강좌 존재시 신청불가 메서드*/
	public int studentCheckMyLecture(int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select classidx from member2 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			int classidx=-1;
			if(rs.next()) {
				classidx=rs.getInt("classidx");
			}
			return classidx;
			
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
	
	
	/**인원초과시 신청불가체크 -오진우*/
	public LectureDTO studentCheckCount(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select reqscount,entirescount from class where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			LectureDTO ldto=null;
			if(rs.next()) {
				int reqscount=rs.getInt("reqscount");
				int entirescount=rs.getInt("entirescount");
				
				ldto=new LectureDTO();
				ldto.setReqscount(reqscount);
				ldto.setEntirescount(entirescount);
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
	
	/**강좌 평가하기 -오진우*/
	public int studentEstiTeacher(int classidx,int idx,int estinum,String esticon) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="insert into CLASSESTIMATE values(sq_CLASSESTIMATE_estidx.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			ps.setInt(3, estinum);
			ps.setString(4, esticon);
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
	
}
