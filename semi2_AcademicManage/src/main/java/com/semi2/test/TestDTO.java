package com.semi2.test;

public class TestDTO {
	//시험문제 테이블
	private int testidx;//시험고유번호
	private int classidx;//강좌고유번호
	private int numidx;//항목번호(이게 아마 문제번호)
	private String exam;//시험 문제
	private String rightanswer;//정답
	private int score;//배점
	//학생시험정보 테이블
	private int sansweridx;//시험답(학생) 고유번호
	private int idx;//회원 고유번호
	private int groupidx;//반 고유번호
	private String sanswer;//학생 답
	private int yesorno;//정답 유무
	private int totalscore;//총점
	private int submit;// 제출유무
	//추가 컬럼
	private String classname;
	private String tname;
	//강사 추가컬럼
	private String sname; //학생이름
	private String groupname;
	
	
	public TestDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public TestDTO(int testidx, int classidx, int numidx, String exam, String rightanswer, int score, int sansweridx,
			int idx, int groupidx, String sanswer, int yesorno, int totalscore, int submit, String classname,
			String tname, String sname, String groupname) {
		super();
		this.testidx = testidx;
		this.classidx = classidx;
		this.numidx = numidx;
		this.exam = exam;
		this.rightanswer = rightanswer;
		this.score = score;
		this.sansweridx = sansweridx;
		this.idx = idx;
		this.groupidx = groupidx;
		this.sanswer = sanswer;
		this.yesorno = yesorno;
		this.totalscore = totalscore;
		this.submit = submit;
		this.classname = classname;
		this.tname = tname;
		this.sname = sname;
		this.groupname = groupname;
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

	public int getTestidx() {
		return testidx;
	}

	public void setTestidx(int testidx) {
		this.testidx = testidx;
	}

	public int getClassidx() {
		return classidx;
	}

	public void setClassidx(int classidx) {
		this.classidx = classidx;
	}

	public int getNumidx() {
		return numidx;
	}

	public void setNumidx(int numidx) {
		this.numidx = numidx;
	}

	public String getExam() {
		return exam;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public String getRightanswer() {
		return rightanswer;
	}

	public void setRightanswer(String rightanswer) {
		this.rightanswer = rightanswer;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getSansweridx() {
		return sansweridx;
	}

	public void setSansweridx(int sansweridx) {
		this.sansweridx = sansweridx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getGroupidx() {
		return groupidx;
	}

	public void setGroupidx(int groupidx) {
		this.groupidx = groupidx;
	}

	public String getSanswer() {
		return sanswer;
	}

	public void setSanswer(String sanswer) {
		this.sanswer = sanswer;
	}

	public int getYesorno() {
		return yesorno;
	}

	public void setYesorno(int yesorno) {
		this.yesorno = yesorno;
	}

	public int getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}

	public int getSubmit() {
		return submit;
	}

	public void setSubmit(int submit) {
		this.submit = submit;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	
}