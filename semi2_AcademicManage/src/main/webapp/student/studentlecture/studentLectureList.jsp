<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.lecture.*" %>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
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
    height:200px;
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

.all-section-slectur{
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; /* 높이 설정 */
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	height : 650px;
}

.td-lecture-text a{
	text-decoration: none;
	color : #333;
}

.td-lecture-text a:hover {
    color: #567AF0;
}


</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp"%>
<div class = "all-title1">
<h2>현재 개설 강좌</h2>
</div>
 <section class="all-section-slectur" >
	<article>
		<table class="table-info">
			
			<%
			ArrayList<LectureDTO> arr=sldao.lectureList();
			if(arr==null||arr.size()==0){
		
				
			%>
			<tr>
				<td colspan="8">현재 개설중인 강좌가 존재하지 않습니다.</td>
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
			<%	
				for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getClassidx() %></td>
				<td class = "td-lecture-text"><a href="studentLectureDetail.jsp?classidx=<%=arr.get(i).getClassidx()%>&num=1"><%=arr.get(i).getClassname() %></a></td>
				<td><%=arr.get(i).getTname() %></td>
				<td><%=arr.get(i).getReqscount() %></td>
				<td><%=arr.get(i).getEntirescount() %></td>
				<td><%=arr.get(i).getComingdate() %></td>
				<td><%=arr.get(i).getEnddate() %></td>
				<td><%=arr.get(i).getEntiredate() %></td>
			</tr>
			
			<%
				}
			}
			%>
			
		</table>
	</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>