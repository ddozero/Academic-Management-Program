<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	int count=1;
	if(classidx==0){
%>
	<script>
	window.alert('현재 신청하신 강좌가 존재 하지않습니다. 강좌를 먼저 신청해주세요.');
	location.href='/semi2_AcademicManage/student/studentlecture/studentLectureList.jsp';
	</script>
<%		
		return;
	}	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
/* 평가 폼 전체 스타일 */
form[name="fm"] {
  display: flex;
  flex-direction: column;
  gap: 18px;
  padding: 20px;
}

/* 강좌명 및 강사 정보 라벨 */
form[name="fm"] label {
  font-size: 15px;
  color: #333;
  margin-bottom: 4px;
  font-weight: 500;
}

/* 입력 필드 공통 스타일 */
form[name="fm"] input[type="text"] {
  width: 100%;
  max-width: 400px;
  height: 36px;
  padding: 6px 12px;
  font-size: 14px;
  border: 1px solid #d6d6d6;
  border-radius: 8px;
  background-color: #fff;
  color: #333;
}

/* 클릭 시 박스 강조 */
form[name="fm"] input[type="text"]:focus {
  outline: none;
  border-color: #567AF0;
  box-shadow: 0 0 4px rgba(86, 122, 240, 0.3);
}

/* 제출 버튼 */
form[name="fm"] input[type="submit"] {
  width: 120px;
  background-color: #567AF0;
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 10px 0;
  font-size: 14px;
  cursor: pointer;
  align-self: flex-end;
  transition: background-color 0.2s ease;
}

/* 버튼 호버 효과 */
form[name="fm"] input[type="submit"]:hover {
  background-color: #3f5ce0;
}

</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class = "all-title1">
<h2>강좌 평가하기</h2>
</div>
<section class="all-section1">
<article>
	<%
		LectureDTO sldto=sldao.studentMyLecture(mdto.getIdx());
	%>
	<form name="fm" action="studentEstiTeacher_ok.jsp">
	<label>강좌명:<%=sldto.getClassname() %></label>
	<label>강사:<%=sldto.getTname() %></label>
	<span>평점<input type="text" name="esti" placeholder="0~100사이의 숫자를 입력하세요."></span>
	<span>코멘트<input type="text" name="esti2" placeholder="강사평을 입력해주세요." ></span>
	<input type="submit" value="제출하기">
	</form>
</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>