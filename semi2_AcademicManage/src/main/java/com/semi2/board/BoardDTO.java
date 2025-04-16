package com.semi2.board;

import java.sql.Date;

public class BoardDTO {
	private int boardidx;
	private int midx;
	private int idx;
	private String category;
	private String title;
	private String name;
	private String pwd;
	private String content;
	private Date writedate;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	private String secret;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int boardidx, int midx, int idx, String category, String title, String name, String pwd,
			String content, Date writedate, int readnum, int ref, int lev, int sunbun, String secret) {
		super();
		this.boardidx = boardidx;
		this.midx = midx;
		this.idx = idx;
		this.category = category;
		this.title = title;
		this.name = name;
		this.pwd = pwd;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.secret = secret;
	}

	public int getBoardidx() {
		return boardidx;
	}

	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	
	
}	