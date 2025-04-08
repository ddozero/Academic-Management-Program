package com.semi2.lecture;



public class ManagerLectureDTO {
	private int classidx;
	private int groupidx;
	private String classname;
	private String tname;
	private int entirescount;
	private int reqscount;
	private String comingdate;
	private String enddate;
	private int entiredate;
	private String chargemname;
	
	private String groupname;
	private String classintro;
	
	public ManagerLectureDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public ManagerLectureDTO(String groupname) {
		super();
		this.groupname = groupname;
	}

	public String getClassintro() {
		return classintro;
	}

	public void setClassintro(String classintro) {
		this.classintro = classintro;
	}

	public ManagerLectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount,
			int reqscount, String comingdate, String enddate, int entiredate, String chargemname, String groupname,
			String classintro) {
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
		this.groupname = groupname;
		this.classintro = classintro;
	}

	public ManagerLectureDTO(int classidx, int groupidx, String classname, String tname, int entirescount,
			int reqscount, String comingdate, String enddate, int entiredate, String chargemname, String groupname) {
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
		this.groupname = groupname;
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

	public String getComingdate() {
		return comingdate;
	}

	public void setComingdate(String comingdate) {
		this.comingdate = comingdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
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




}

