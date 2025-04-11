package com.semi2.group;

public class GroupDTO {
	
	// 반(Group) 테이블
	private int groupidx;
	private int idx;
	private String groupname;
	private String mname;
	private String tname;
	private int scount;
	//비품(item) 테이블
	private int itemidx;
	private String itemname;
	private int itemcose;
	private int itemcount;
	
	
	public GroupDTO() {
		
	}

	
	//반 테이블 생성자
	public GroupDTO(int groupidx, int idx, String groupname, String mname, String tname, int scount) {
		super();
		this.groupidx = groupidx;
		this.idx = idx;
		this.groupname = groupname;
		this.mname = mname;
		this.tname = tname;
		this.scount = scount;
	}
	
	//비품 테이블 생성자
	public GroupDTO(int groupidx, int idx, String groupname, String mname, String tname, int scount, int itemidx,
			String itemname, int itemcose, int itemcount) {
		super();
		this.groupidx = groupidx;
		this.idx = idx;
		this.groupname = groupname;
		this.mname = mname;
		this.tname = tname;
		this.scount = scount;
		this.itemidx = itemidx;
		this.itemname = itemname;
		this.itemcose = itemcose;
		this.itemcount = itemcount;
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


	public int getItemidx() {
		return itemidx;
	}


	public void setItemidx(int itemidx) {
		this.itemidx = itemidx;
	}


	public String getItemname() {
		return itemname;
	}


	public void setItemname(String itemname) {
		this.itemname = itemname;
	}


	public int getItemcose() {
		return itemcose;
	}


	public void setItemcose(int itemcose) {
		this.itemcose = itemcose;
	}


	public int getItemcount() {
		return itemcount;
	}


	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

}