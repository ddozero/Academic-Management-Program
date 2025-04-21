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
	
	//recordissue 테이블(추가)
	private int issueidx;
	private String issuestatus; //신청상태
	private String issuedivi; //질병조퇴구분
	private int appro; //승인구분
	private String filename;
	Date reqdate; //신청날자 

	
	//추가생성자 250418 - 수강생 출결 질병/조퇴 목록 조회 수정(도영)
	private String name;
	public RecordDTO(int recordidx, int issueidx, int midx, int idx, String name, String groupname, String classname, String issuestatus, String issuedivi, String filename,
			int appro, Date reqdate, int groupidx) {
		super();
		this.recordidx = recordidx;
		this.issueidx = issueidx;
		this.midx = midx;
		this.idx = idx;
		this.name = name;
		this.groupname = groupname;
		this.classname = classname;
		this.issuestatus = issuestatus;
		this.issuedivi = issuedivi;
		this.filename = filename;
		this.appro = appro;
		this.reqdate = reqdate;
		this.groupidx = groupidx;
	}
	
	//추가DTO 250413

		private String groupname;
		private int groupidx;
		private String tname;

		public String getName() {
			return name;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		
		public String getTname() {
			return tname;
		}

		public void setTname(String tname) {
			this.tname = tname;
		}

		public String getGroupname() {
			return groupname;
		}

		public void setGroupname(String groupname) {
			this.groupname = groupname;
		}

		public int getGroupidx() {
			return groupidx;
		}

		public void setGroupidx(int groupidx) {
			this.groupidx = groupidx;
		}
		

		//(매니저) 250411 강사 근태 관리 추가 생성자- 도영
		public RecordDTO(int recordidx, int midx, int idx, int classidx, int recordtime, int entirate, int currate,
				int status, Date attendate, Timestamp intime, Timestamp outtime, String classname, String groupname,
				int groupidx, String name) {
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
			this.groupname = groupname;
			this.groupidx = groupidx;
			this.name = name;
		}


	public RecordDTO(int idx, int issueidx, String issuestatus, String issuedivi, int appro, String filename,
				Date reqdate) {
		super();
		this.idx = idx;
		this.issueidx = issueidx;
		this.issuestatus = issuestatus;
		this.issuedivi = issuedivi;
		this.appro = appro;
		this.filename = filename;
		this.reqdate = reqdate;
	}

	public int getIssueidx() {
		return issueidx;
	}

	public void setIssueidx(int issueidx) {
		this.issueidx = issueidx;
	}

	public String getIssuestatus() {
		return issuestatus;
	}

	public void setIssuestatus(String issuestatus) {
		this.issuestatus = issuestatus;
	}

	public String getIssuedivi() {
		return issuedivi;
	}

	public void setIssuedivi(String issuedivi) {
		this.issuedivi = issuedivi;
	}

	public int getAppro() {
		return appro;
	}

	public void setAppro(int appro) {
		this.appro = appro;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getReqdate() {
		return reqdate;
	}

	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}

	
	
	//원본은 여기서부터 시작
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
