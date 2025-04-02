package com.semi2.lecture;

import java.sql.*;

public class LectureDTO {
	
	private int classidx;
	private int groupidx;
	private String classname;
	private String tname;
	private int entirescount;
	private int reqscount;
	private Date comingdate;
	private Date enddate;
	private Date entiredate;
	private String chargemname;
	
	public LectureDTO() {
		// TODO Auto-generated constructor stub
	}

	public LectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount, int reqscount,
			Date comingdate, Date enddate, Date entiredate, String chargemname) {
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

	public Date getEntiredate() {
		return entiredate;
	}

	public void setEntiredate(Date entiredate) {
		this.entiredate = entiredate;
	}

	public String getChargemname() {
		return chargemname;
	}

	public void setChargemname(String chargemname) {
		this.chargemname = chargemname;
	}
	
	
}
