package com.semi2.test;

import java.sql.*;
import java.util.*;


public class STestDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	/**등록된 시험 불러오기 -오진우*/
	public ArrayList<TestDTO> studentShowExam(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select distinct c.classname, c.tname from class c,test t where c.classidx = t.classidx and c.classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			ArrayList<TestDTO> arr=new ArrayList<TestDTO>();
			while(rs.next()) {
				String classname=rs.getString("classname");
				String tname=rs.getString("tname");
				
				TestDTO tdto=new TestDTO();
				tdto.setClassname(classname);
				tdto.setTname(tname);
				arr.add(tdto);
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

	/**시험에 등록된 문제 불러오기 -오진우*/
	public ArrayList<TestDTO> studentShowExam2(int classidx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select * from test where classidx=? order by numidx asc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			ArrayList<TestDTO> arr=new ArrayList<TestDTO>();
			while(rs.next()) {
				int testidx=rs.getInt("testidx");
				int numidx=rs.getInt("numidx");
				String exam=rs.getString("exam");
				
				TestDTO tdto=new TestDTO();
				tdto.setTestidx(testidx);
				tdto.setNumidx(numidx);
				tdto.setExam(exam);
				arr.add(tdto);
				
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

	/**시험문제 강사에게 제출 -오진우*/
	public int studentSubmitTest(int classidx,int idx,int groupidx,int testidx,int numidx,String sanswer) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="insert into sanswer values(sq_SANSWER_sansweridx.nextval,?,?,?,?,?,?,0,0,1)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			ps.setInt(3, groupidx);
			ps.setInt(4, testidx);
			ps.setInt(5, numidx);
			ps.setString(6, sanswer);
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
	/**classidx를 통해 groupidx 추출 메서드-오진우*/
	public int studentGetGroupidx(int classidx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select groupidx from class where classidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			rs=ps.executeQuery();
			int groupidx=0;
			if(rs.next()) {
				groupidx=rs.getInt("groupidx");
			}
			return groupidx;
			
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

	/**시험 제출 여부 확인 메서드-오진우*/
	public ArrayList<TestDTO> studentCheckSubmit(int classidx,int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select submit from sanswer where classidx=? and idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			rs=ps.executeQuery();
			ArrayList<TestDTO> arr=new ArrayList<TestDTO>();
			while(rs.next()) {
				int submit=rs.getInt("submit");
				
				TestDTO tdto=new TestDTO();
				tdto.setSubmit(submit);
				
				arr.add(tdto);
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
	
	/**점수 계산 메서드 -오진우*/
	public int studentTestScore(int classidx,int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select sum(totalscore) as score from sanswer where classidx=? and idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			rs=ps.executeQuery();
			int score=0;
			if(rs.next()) {
				score=rs.getInt("score");
			}
			return score;
			
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
	/**시험 채점 메서드-오진우*/
	public ArrayList<TestDTO> checkAnswer(int classidx,int idx){
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="select t.numidx,s.testidx,t.rightanswer,s.sanswer,t.score from sanswer s,test t where s.testidx=t.testidx and s.numidx=t.numidx and t.classidx=? and s.idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, classidx);
			ps.setInt(2, idx);
			rs=ps.executeQuery();
			ArrayList<TestDTO> arr=new ArrayList<TestDTO>();
			while(rs.next()) {
				int numidx=rs.getInt("numidx");
				int testidx=rs.getInt("testidx");
				String rightanswer=rs.getString("rightanswer");
				String sanswer=rs.getString("sanswer");
				int score=rs.getInt("score");
				
				TestDTO tdto=new TestDTO();
				tdto.setNumidx(numidx);;
				tdto.setTestidx(testidx);
				tdto.setRightanswer(rightanswer);
				tdto.setSanswer(sanswer);
				tdto.setScore(score);
				arr.add(tdto);
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
	/**채점후 점수 입력 메서드(정답시)-오진우*/
	public int updateStudentScore(int yesorno,int score,int testidx,int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update sanswer set yesorno=?,totalscore=totalscore+? where testidx=? and idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, yesorno);
			ps.setInt(2, score);
			ps.setInt(3, testidx);
			ps.setInt(4, idx);
			
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
	/**채점후 점수 입력 메서드(오답시)-오진우*/
	public int updateStudentScore2(int yesorno,int testidx,int idx) {
		try {
			conn=com.semi2.db.Semi2DB.getConn();
			String sql="update sanswer set yesorno=? where testidx=?  and idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, yesorno);
			ps.setInt(2, testidx);
			ps.setInt(3, idx);
			
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
 