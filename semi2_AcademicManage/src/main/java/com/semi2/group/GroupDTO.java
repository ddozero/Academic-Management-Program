package com.semi2.group;

public class GroupDTO {
	
	private int groupidx;
	private int idx;
	private String groupname;
	private String mname;
	private String tname;
	private int scount;
	
	public GroupDTO() {
		
	}

	public GroupDTO(int groupidx, int idx, String groupname, String mname, String tname, int scount) {
		super();
		this.groupidx = groupidx;
		this.idx = idx;
		this.groupname = groupname;
		this.mname = mname;
		this.tname = tname;
		this.scount = scount;
	}

	public int getGroupidx() {
		return groupidx;
	}

	public void setGroupidx(int groupidx) {
		this.groupidx = groupidx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getScount() {
		return scount;
	}

	public void setScount(int scount) {
		this.scount = scount;
	}
	
}


