<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.semi2.test.*" %>
<jsp:useBean id="stdao" class="com.semi2.test.STestDAO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");

	
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);
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
<div class="all-title1">
<h2>답안 보기</h2>
</div>
<section class="all-section1">
<article>
	<table class="table-info">
	 	<thead class="table-info-header">
	 		<tr>
	 			<th>문제 번호</th>
	 			<th>정답</th>
	 			<th>나의 답</th>
	 			<th>정답 여부</th>
	 			<th>배점</th>
	 		</tr>
	 	</thead>
	 	<%
	 	ArrayList<TestDTO> arr=stdao.checkAnswer(classidx, mdto.getIdx());
	 	%>
		<tbody>
		<%
			if(arr==null&&arr.size()==0){
		%>
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		<%
			}else{
				for(int i=0;i<arr.size();i++){
		%>					
				<tr>
					<td><%=arr.get(i).getNumidx() %></td>
					<td><%=arr.get(i).getRightanswer() %></td>
					<td><%=arr.get(i).getSanswer() %></td>
		<%
					if(arr.get(i).getRightanswer().equals(arr.get(i).getSanswer())){		
		%>
						<td>O</td>		
		<%
					}else{
		%>
						<td>X</td>
		<%
					}
		%>
					<td><%=arr.get(i).getScore() %></td>
				</tr>
		<%			
				}
			}
		%>
			
		</tbody>
	</table>
</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>