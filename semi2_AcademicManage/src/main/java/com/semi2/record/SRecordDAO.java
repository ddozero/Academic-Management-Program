package com.semi2.record;

import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;
import com.semi2.member.MemberDTO;

public class SRecordDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	/**session의 idx를 통해 classidx 추출 메서드-오진우*/
	public int studentGetClassidx (int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select classidx from member2  where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			int classidx=0;
			if(rs.next()) {
				classidx=rs.getInt("classidx");
			}
			
			return classidx;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}
	
	/**입퇴실 정보 조회 기능-오진우*/
	public  RecordDTO studentShowAttend(MemberDTO mdto) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select r.recordidx,c.classname,r.attendate,r.intime,r.outtime,r.recordtime,r.status from record r,class c where r.classidx=c.classidx and r.recordidx=(select max(recordidx) from record where idx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,mdto.getIdx());
			rs=ps.executeQuery();
			RecordDTO rdto=null;
			if(rs.next()) {
				int recordidx=rs.getInt("recordidx");
				String classname=rs.getString("classname");
				java.sql.Date attendate = rs.getDate("attendate"); 
				java.sql.Timestamp intime = rs.getTimestamp("intime");
				java.sql.Timestamp outtime = rs.getTimestamp("outtime");
				int recordtime=rs.getInt("recordtime");
				int status=rs.getInt("status");
				
				
				rdto=new RecordDTO();
				rdto.setRecordidx(recordidx);
				rdto.setClassname(classname);
				rdto.setattendate(attendate);
				rdto.setIntime(intime);
				rdto.setOuttime(outtime);
				rdto.setRecordtime(recordtime);
				rdto.setStatus(status);
			}
			
			return rdto;
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
	
	/**학생 입실 기능-오진우*/
	public int studentCheckIn(MemberDTO mdto,int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="insert into record values(sq_RECORD_recordidx.nextval,2,?,?,0,100,100,5,sysdate,sysdate, TO_DATE('0001-01-01','YYYY-MM-DD'))";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, mdto.getIdx());
			ps.setInt(2,classidx);
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

	
	
	
	/**학생 퇴실 기능-오진우*/
	public int studentCheckOut(MemberDTO mdto,int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update record set recordtime=480,status=1,outtime=sysdate where recordidx=(select max(recordidx) from record where idx=? and classidx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, mdto.getIdx());
			ps.setInt(2, classidx);
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
	
	/**학생 출결 신청 메서드-오진우*/
	public int studentSubmitAbs(MultipartRequest mr,int idx,String issuedivi) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="insert into recordissue values(sq_RECORDISSUE_issueidx.nextval,?,'미승인',?,0,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,idx);
			ps.setString(2,issuedivi);
			String originname=mr.getOriginalFileName("upload");
			ps.setString(3,originname);
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
	
	/**학생 질병신청 조회 기능1-오진우*/
	public ArrayList<RecordDTO> studentAbsList(int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select reqdate,appro,issuedivi,filename from recordissue where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			RecordDTO rdto=null;
			ArrayList<RecordDTO> arr=new ArrayList<RecordDTO>();
			
			while(rs.next()) {
				java.sql.Date reqdate=rs.getDate("reqdate");
				int appro=rs.getInt("appro");
				String issuedivi=rs.getString("issuedivi");
				String filename=rs.getString("filename");
				
				rdto=new RecordDTO();
				rdto.setReqdate(reqdate);
				rdto.setAppro(appro);
				rdto.setIssuedivi(issuedivi);
				rdto.setFilename(filename);
				arr.add(rdto);
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
	
	/**학생 질병신청 조회 기능2-오진우*/
	public String studentAbsList2(int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select classname from class where classidx=(select classidx from member2 where idx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,idx);
			rs=ps.executeQuery();
			String classname=null;
			if(rs.next()) {
				classname=rs.getString("classname");
			}
			return classname;
			
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
	
	/**출석률 계산용(현재까지의 status값가져오기) -오진우*/
	public ArrayList<RecordDTO> studentAttendRate(int idx,int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select status from record where idx=? and classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setInt(2, classidx);
			rs=ps.executeQuery();
			RecordDTO rdto=null;
			ArrayList<RecordDTO> arr=new ArrayList<RecordDTO>();
			while(rs.next()) {
				int status=rs.getInt("status");
				
				rdto=new RecordDTO();
				rdto.setStatus(status);
				arr.add(rdto);
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
	
	/**출석률 100 가져오기*/
	public int studentEntireRate(int idx,int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select entirate from record where recordidx=(select max(recordidx) from record where idx=? and classidx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setInt(2, classidx);
			rs=ps.executeQuery();
			int entirate=0;
			if(rs.next()) {
				entirate=rs.getInt("entirate");
			}
			
			return entirate;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
	
	/**출석률 계산후 업데이트-오진우*/
	public int studentAttendRate2(int entirate,int percent,int idx,int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update record set currate=?-? where recordidx=(select max(recordidx) from record where idx=? and classidx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, entirate);
			ps.setInt(2, percent);
			ps.setInt(3, idx);
			ps.setInt(4, classidx);
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
	
	/**출석률 출력 -오진우*/
	public int studentAttendRate3(int idx,int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select currate from record where recordidx=(select max(recordidx) from record where idx=? and classidx=?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,idx);
			ps.setInt(2, classidx);
		
			rs=ps.executeQuery();
			int currate=0;
			if(rs.next()) {
				
				currate=rs.getInt("currate");
			}
			return currate;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
	/**날짜별 출석 표시 -오진우*/
	public ArrayList<RecordDTO> studentShowAttend2(int idx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select attendate,intime,outtime,status from record where idx=? order by recordidx asc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			ArrayList<RecordDTO> arr=new ArrayList<RecordDTO>();
			RecordDTO rdto=null;
			while(rs.next()) {
				java.sql.Date attendate = rs.getDate("attendate");
				java.sql.Timestamp intime = rs.getTimestamp("intime");
				java.sql.Timestamp outtime = rs.getTimestamp("outtime");
				int status=rs.getInt("status");
				
				rdto=new RecordDTO();
				rdto.setattendate(attendate);
				rdto.setIntime(intime);
				rdto.setOuttime(outtime);
				rdto.setStatus(status);
				arr.add(rdto);
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
