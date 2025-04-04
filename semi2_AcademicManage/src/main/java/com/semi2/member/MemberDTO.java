package com.semi2.member;


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
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int idx, int midx, String name, String sex, String id, String pwd, String tel, String email,
			String addr, String birth, int appro) {
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
	
	
}