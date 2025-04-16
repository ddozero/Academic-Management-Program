<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.test.*" %>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<jsp:useBean id="stdao" class="com.semi2.test.STestDAO"></jsp:useBean>

<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	int count=1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
    text-align: left;
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

.list-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}

/* 검색창 디자인 */
.se-lectureFind {
    float: right; 
    margin: 10px 0; 
}

form[name="lectureFind"] {
    float: right;
}

.sebt{ 
    background: #d8d8d8;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}

.search-button:hover {
    color: #567AF0;
}

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 80px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}


.se-select:focus {
    outline: none; 
}

.setxt{
	width : 200px;
	height : 28px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 5pxl=l
}



</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class = "all-title1">
<h2>시험 문제 풀기</h2>
</div>
<section class="all-section1">
<article>
	<table class="table-info">
		<%
		ArrayList<TestDTO> arr=stdao.studentShowExam(classidx);
		if(arr==null||arr.size()==0){
		%>
		
		<tr>
			<td colspan="5">현재 등록된 시험이 존재하지 않습니다.</td>
		</tr>
		
		<%
		}else{
		%>
		<thead class="table-info-header">
			<tr>
				<th>No</th>
				<th>강좌명</th>
				<th>강사</th>
				<th>문제풀기</th>
				<th>제출상태</th>
			</tr>
		</thead>
		<%
			for(int i=0;i<arr.size();i++){
		%>
		<tbody>
			<tr>
				<td><%=count %></td>
				<td><%=arr.get(i).getClassname() %></td>
				<td><%=arr.get(i).getTname() %></td>
			<%
				count++;
				ArrayList<TestDTO> arr2=stdao.studentCheckSubmit(classidx,mdto.getIdx());
				Boolean sw=false;
				
				
				if(arr2!=null&&arr2.size()!=0){ 
				
					for(int j=0;j<arr2.size();j++){
						if(arr2.get(j).getSubmit()==0){
							sw=true;
							break;
						}else{
							sw=false;
						}
					}
				}
				
				if(arr2.size()==0||sw==true||arr2==null){
			%>
				<td><a href="studentTest.jsp?classidx=<%=classidx%>">문제풀기</a></td>
				<td>미제출</td>
			<%		
				}else{
			%>
				<td>-</td>
				<td>제출완료</td>
			<%		
				}
			%>	
				
			</tr>
		</tbody>
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