package com.semi2.lecture;

import java.sql.*;

public class LectureDTO {
   
   //강좌 테이블(CLASS)
   private int classidx;
   private int groupidx;
   private String classname;
   private String tname;
   private int entirescount;
   private int reqscount;
   private Date comingdate;
   private Date enddate;
   private int entiredate;
   private String chargemname;
   private String classintro;
   //주차테이블(CLASSDETIL2)
   private int weekidx;
   private int weeknum;
   private String weekname;
   private String weekcon;
   private String weekperiod;
   //강좌평가 테이블(ClASSESTIMATE)
   private int estidx;
   private int idx;
   private int estinum;
   private String esticon;
   
   public LectureDTO() {
	// TODO Auto-generated constructor stub
   }
   
   //강좌(CLASS)테이블 생성자
	public LectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount, int reqscount,
			Date comingdate, Date enddate, int entiredate, String chargemname, String classintro) {
		super();
		this.classidx = classidx;
		this.groupidx = groupidx;
		this.classname = classname;
		this.tname = tname;
		this.entirescount = entirescount;
		this.reqscount = reqscount;
		this.comingdate = comingdate;
		this.enddate = enddate;
		this.entiredate = entiredate;
		this.chargemname = chargemname;
		this.classintro = classintro;
	}
	
	//주차테이블(CLASSDETIL2) 생성자
	public LectureDTO(int classidx, int weekidx, int weeknum, String weekname, String weekcon, String weekperiod) {
		super();
		this.classidx = classidx;
		this.weekidx = weekidx;
		this.weeknum = weeknum;
		this.weekname = weekname;
		this.weekcon = weekcon;
		this.weekperiod = weekperiod;
	}
	

	//강좌평가테이블(ClASSESTIMATE) 생성자
	
	public LectureDTO(int classidx, int estidx, int idx, int estinum, String esticon) {
		super();
		this.classidx = classidx;
		this.estidx = estidx;
		this.idx = idx;
		this.estinum = estinum;
		this.esticon = esticon;
	}
		
	
	public LectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount, int reqscount,
			Date comingdate, Date enddate, int entiredate, String chargemname, String classintro, int weekidx,
			int weeknum, String weekname, String weekcon, String weekperiod, int estidx, int idx, int estinum,
			String esticon) {
		super();
		this.classidx = classidx;
		this.groupidx = groupidx;
		this.classname = classname;
		this.tname = tname;
		this.entirescount = entirescount;
		this.reqscount = reqscount;
		this.comingdate = comingdate;
		this.enddate = enddate;
		this.entiredate = entiredate;
		this.chargemname = chargemname;
		this.classintro = classintro;
		this.weekidx = weekidx;
		this.weeknum = weeknum;
		this.weekname = weekname;
		this.weekcon = weekcon;
		this.weekperiod = weekperiod;
		this.estidx = estidx;
		this.idx = idx;
		this.estinum = estinum;
		this.esticon = esticon;
	}

	public int getClassidx() {
		return classidx;
	}

	public void setClassidx(int classidx) {
		this.classidx = classidx;
	}

	public int getGroupidx() {
		return groupidx;
	}

	public void setGroupidx(int groupidx) {
		this.groupidx = groupidx;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getEntirescount() {
		return entirescount;
	}

	public void setEntirescount(int entirescount) {
		this.entirescount = entirescount;
	}

	public int getReqscount() {
		return reqscount;
	}

	public void setReqscount(int reqscount) {
		this.reqscount = reqscount;
	}

	public Date getComingdate() {
		return comingdate;
	}

	public void setComingdate(Date comingdate) {
		this.comingdate = comingdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getEntiredate() {
		return entiredate;
	}

	public void setEntiredate(int entiredate) {
		this.entiredate = entiredate;
	}

	public String getChargemname() {
		return chargemname;
	}

	public void setChargemname(String chargemname) {
		this.chargemname = chargemname;
	}

	public String getClassintro() {
		return classintro;
	}

	public void setClassintro(String classintro) {
		this.classintro = classintro;
	}

	public int getWeekidx() {
		return weekidx;
	}

	public void setWeekidx(int weekidx) {
		this.weekidx = weekidx;
	}

	public int getWeeknum() {
		return weeknum;
	}

	public void setWeeknum(int weeknum) {
		this.weeknum = weeknum;
	}

	public String getWeekname() {
		return weekname;
	}

	public void setWeekname(String weekname) {
		this.weekname = weekname;
	}

	public String getWeekcon() {
		return weekcon;
	}

	public void setWeekcon(String weekcon) {
		this.weekcon = weekcon;
	}

	public String getWeekperiod() {
		return weekperiod;
	}

	public void setWeekperiod(String weekperiod) {
		this.weekperiod = weekperiod;
	}

	public int getEstidx() {
		return estidx;
	}

	public void setEstidx(int estidx) {
		this.estidx = estidx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getEstinum() {
		return estinum;
	}

	public void setEstinum(int estinum) {
		this.estinum = estinum;
	}

	public String getEsticon() {
		return esticon;
	}

	public void setEsticon(String esticon) {
		this.esticon = esticon;
	}
		   
	   
	
}