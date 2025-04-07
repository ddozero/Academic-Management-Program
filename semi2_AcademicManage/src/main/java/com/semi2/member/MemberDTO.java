package com.semi2.member;

import java.util.*;

public class MemberDTO {
	private int idx;
	private int midx;
	private String name;
	private String sex;
	private String id;
	private String pwd;
	private String tel;
	private String email;
	private String addr;
	private String birth;
	private int appro;
	//매니저&강사세부사항
	private int m3idx;
	private int classidx;
	private int groupidx;
	private String edu2;
	private String career;
	private Date comingdate;
	private String seleclass;
	private String groupname;
	private String memo;
	private String imgaddr;
	
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int idx, int midx, String name, String sex, String id, String pwd, String tel, String email,
			String addr, String birth, int appro, int m3idx, int classidx, int groupidx, String edu2, String career,
			Date comingdate, String seleclass, String groupname, String memo, String imgaddr) {
		super();
		this.idx = idx;
		this.midx = midx;
		this.name = name;
		this.sex = sex;
		this.id = id;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.birth = birth;
		this.appro = appro;
		this.m3idx = m3idx;
		this.classidx = classidx;
		this.groupidx = groupidx;
		this.edu2 = edu2;
		this.career = career;
		this.comingdate = comingdate;
		this.seleclass = seleclass;
		this.groupname = groupname;
		this.memo = memo;
		this.imgaddr = imgaddr;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getAppro() {
		return appro;
	}

	public void setAppro(int appro) {
		this.appro = appro;
	}

	public int getM3idx() {
		return m3idx;
	}

	public void setM3idx(int m3idx) {
		this.m3idx = m3idx;
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

	public String getEdu2() {
		return edu2;
	}

	public void setEdu2(String edu2) {
		this.edu2 = edu2;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public Date getComingdate() {
		return comingdate;
	}

	public void setComingdate(Date comingdate) {
		this.comingdate = comingdate;
	}

	public String getSeleclass() {
		return seleclass;
	}

	public void setSeleclass(String seleclass) {
		this.seleclass = seleclass;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImgaddr() {
		return imgaddr;
	}

	public void setImgaddr(String imgaddr) {
		this.imgaddr = imgaddr;
	}
	
	
}