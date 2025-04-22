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
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>

.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
  height : 100px;
  font-size : 16px;
}

.header-style {
  width: 10%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
}

.cell-data0 {
  width : 25%;
  text-align: center;
  padding: 10px;
  border: 1px solid #ddd;
  font-weight: bold;
}


.cell-data {
  width : 25%;
  padding: 10px;
  border: 1px solid #ddd;
}



/* 입력 필드 공통 스타일 */
form[name="fm"] input[type="text"] {
   width: 100%;
    max-width: 400px;
    height: 36px;
    padding: 6px 12px;
    font-size: 14px;
    border: none; /* 테두리 제거 */
    border-radius: 8px; /* 둥근 모서리는 유지 */
    background-color: #fff; /* 배경색 */
    color: #333; /* 텍스트 색상 */
    outline: none; /* 클릭 시 테두리 제거 */

}

/* 클릭 시 박스 강조 */
form[name="fm"] input[type="text"]:focus {
  outline: none;
  border-color: #567AF0;
  font-size:15px;
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

.all-section-sesti{
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
	height: 650px;
}

.estibt{
 	display: flex;
    justify-content: center; 
    align-items: center; 
    margin-top: 20px; 
}
</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class = "all-title1">
<h2>강좌 평가하기</h2>
</div>
<section class="all-section-sesti">

	<%
		LectureDTO sldto=sldao.studentMyLecture(mdto.getIdx());
	%>
<form name="fm" action="studentEstiTeacher_ok.jsp">
	<table class = "table-add">
		<tr>
			<th class="header-style">강좌명</th>
			<td class="cell-data0"><%=sldto.getClassname() %></td>
		</tr>
		
		<tr>
			<th class="header-style">강사</th>
			<td class="cell-data0"><%=sldto.getTname() %></td>
		</tr>
		
		<tr>
			<th class="header-style">평점</th>
			<td class="cell-data"><input type="text" name="esti" placeholder="0~100사이의 숫자를 입력하세요."></td>
		</tr>
		
		<tr>
			<th class="header-style">코멘트</th>
			<td class="cell-data"><input type="text" name="esti2" placeholder="강사평을 입력해주세요." ></td>
		</tr>
	
	</table>
	
		<div class = "estibt">
			<input type="submit" value="제출하기">
		</div>
</form>

</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>