package com.semi2.record;

import java.sql.Date;
import java.sql.Timestamp;

public class RecordDTO {
	private int recordidx;
	private int midx;
	private int idx;
	private int classidx;
	private int recordtime;
	private int entirate;
	private int currate;
	private int status;
	private Date attendate;
	private Timestamp intime;
	private Timestamp outtime;
	private String classname;

	public RecordDTO() {
		// TODO Auto-generated constructor stub
	}

	public RecordDTO(int recordidx, int midx, int idx, int classidx, int recordtime, int entirate, int currate,
			int status, Date attendate, Timestamp intime, Timestamp outtime, String classname) {
		super();
		this.recordidx = recordidx;
		this.midx = midx;
		this.idx = idx;
		this.classidx = classidx;
		this.recordtime = recordtime;
		this.entirate = entirate;
		this.currate = currate;
		this.status = status;
		this.attendate = attendate;
		this.intime = intime;
		this.outtime = outtime;
		this.classname = classname;
	}

	public int getRecordidx() {
		return recordidx;
	}

	public void setRecordidx(int recordidx) {
		this.recordidx = recordidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getClassidx() {
		return classidx;
	}

	public void setClassidx(int classidx) {
		this.classidx = classidx;
	}

	public int getRecordtime() {
		return recordtime;
	}

	public void setRecordtime(int recordtime) {
		this.recordtime = recordtime;
	}

	public int getEntirate() {
		return entirate;
	}

	public void setEntirate(int entirate) {
		this.entirate = entirate;
	}

	public int getCurrate() {
		return currate;
	}

	public void setCurrate(int currate) {
		this.currate = currate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getattendate() {
		return attendate;
	}

	public void setattendate(Date attendate) {
		this.attendate = attendate;
	}

	public Timestamp getIntime() {
		return intime;
	}

	public void setIntime(Timestamp intime) {
		this.intime = intime;
	}

	public Timestamp getOuttime() {
		return outtime;
	}

	public void setOuttime(Timestamp outtime) {
		this.outtime = outtime;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

}
