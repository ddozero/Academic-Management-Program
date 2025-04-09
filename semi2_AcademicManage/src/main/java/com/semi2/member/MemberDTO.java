package com.semi2.member;

import java.sql.*;

public class MemberDTO {
   //회원테이블(MEMBER1)
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
   //매니저&강사세부사항(MEMBER3)
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
   //학생 세부사항(MEMBER2)
   private int m2idx;
   private String edu;
   private String licen;
   //회원구분 테이블(MEMBER)
   private String membersort;
   
   //조인시 추가 테이블(GROUPCLASS, CLASS)
   private String classname; 
   private Date enddate; 
	
	
   public String getClassname() {
		return classname;
	}
	
	
	public void setClassname(String classname) {
		this.classname = classname;
	}
	
	
	public Date getEnddate() {
		return enddate;
	}
	
	
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	
	//(매니저)수강생 세부 정보 출력 생성자
	public MemberDTO(int midx, int idx, String name, String sex, String tel, String email, String addr, String birth,
			String career, Date comingdate, String groupname, String memo, String imgaddr, String edu, String classname,
			Date enddate) {
		super();
		this.idx = idx;
		this.midx = midx;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.birth = birth;
		this.career = career;
		this.comingdate = comingdate;
		this.groupname = groupname;
		this.memo = memo;
		this.imgaddr = imgaddr;
		this.edu = edu;
		this.classname = classname;
		this.enddate = enddate;
	}
	
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	  
   //(매니저)수강생 목록 출력 생성자
   public MemberDTO(int idx, String name, String sex, String tel, String email, String birth, String addr, int m2idx) {
	super();
	this.idx = idx;
	this.name = name;
	this.sex = sex;
	this.tel = tel;
	this.email = email;
	this.birth = birth;
	this.addr = addr;
	this.m2idx = m2idx;
}



//회원테이블(MEMBER1)생성자
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
   //매니저&강사세부사항(MEMBER3)생성자
   public MemberDTO(int m3idx, int idx, int classidx, int groupidx, String edu2, String career, Date comingdate,
         String seleclass, String groupname, String memo, String imgaddr) {
      super();
      this.m3idx = m3idx;
      this.idx = idx;
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
   //학생 세부사항(MEMBER2)생성자
   public MemberDTO(int m2idx, int idx, int classidx,String edu,String licen, String career, String memo, String imgaddr  
         ) {
      super();
      this.m2idx = m2idx;
      this.idx = idx;
      this.classidx = classidx;
      this.edu = edu;
      this.licen = licen;
      this.career = career;
      this.memo = memo;
      this.imgaddr = imgaddr;         
   }
   
   //회원구분 테이블(MEMBER)
   public MemberDTO(int midx, String membersort) {
      super();
      this.midx = midx;
      this.membersort = membersort;
   }

   
   
   
   public MemberDTO(int idx, int midx, String name, String sex, String id, String pwd, String tel, String email,
         String addr, String birth, int appro, int m3idx, int classidx, int groupidx, String edu2, String career,
         Date comingdate, String seleclass, String groupname, String memo, String imgaddr, int m2idx, String edu,
         String licen, String membersort) {
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
      this.m2idx = m2idx;
      this.edu = edu;
      this.licen = licen;
      this.membersort = membersort;
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

   public int getM2idx() {
      return m2idx;
   }

   public void setM2idx(int m2idx) {
      this.m2idx = m2idx;
   }

   public String getEdu() {
      return edu;
   }

   public void setEdu(String edu) {
      this.edu = edu;
   }

   public String getLicen() {
      return licen;
   }

   public void setLicen(String licen) {
      this.licen = licen;
   }

   public String getMembersort() {
      return membersort;
   }

   public void setMembersort(String membersort) {
      this.membersort = membersort;
   }
   
   
   
   
}