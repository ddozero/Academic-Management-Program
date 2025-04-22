<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
<jsp:useBean id="ldto" class="com.semi2.lecture.LectureDTO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 15px;
    text-align: left;
    height:80px;
}


.table-info-header th {
    background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
}

.table-info td {
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
}


.table-info td form input[type="submit"]{
	background: #fff;
	color: #777777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}

.table-info td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}

.all-section-smlecture{
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

</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp"%>
<div class = "all-title1">
<h2>내 강좌보기</h2>
</div>
<section class="all-section-smlecture">
	<article>
		<table class="table-info">
			
			<%
			ldto=sldao.studentMyLecture(mdto.getIdx());
			if(ldto==null||ldto.equals("")||ldto.getClassidx()==0){
		
				
			%>
			<tr>
				<td colspan="8">현재 신청중인 강좌가 존재하지 않습니다.</td>
			</tr>
				
			<%		
			}else{
			%>
				<thead class="table-info-header">
				<tr>
					<th>강좌 번호</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>현재신청인원</th>
					<th>총인원</th>
					<th>개강일</th>
					<th>종강일</th>
					<th>총수강일</th>
				</tr>		
				</thead>
			
			<tr>
				<td><%=ldto.getClassidx() %></td>
				<td><a href="studentLectureDetail.jsp?classidx=<%=ldto.getClassidx()%>&num=2"><%=ldto.getClassname() %></a></td>
				<td><%=ldto.getTname() %></td>
				<td><%=ldto.getReqscount() %></td>
				<td><%=ldto.getEntirescount() %></td>
				<td><%=ldto.getComingdate() %></td>
				<td><%=ldto.getEnddate() %></td>
				<td><%=ldto.getEntiredate() %></td>
			</tr>
			
			<%
				
			}
			%>
			
		</table>
	</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>