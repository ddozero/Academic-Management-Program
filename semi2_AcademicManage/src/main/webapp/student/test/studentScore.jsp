<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.test.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>>
<jsp:useBean id="stdao" class="com.semi2.test.STestDAO"></jsp:useBean>>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
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

.table-info td:nth-child(2), .table-info th:nth-child(2) { /*강좌명 너비 조정*/
	width: 350px; 
	word-break: break-word;
}


.table-info td:nth-child(9), .table-info th:nth-child(9) { /*수정 너비 조정*/
	width: 80px; 
	word-break: break-word;
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


</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class = "all-title1">
<h2>성적표</h2>
</div>
<section class="all-section1">
<article>
	<table class="table-info">
		<%
		ArrayList<TestDTO> arr=stdao.studentShowExam(classidx);
		ArrayList<TestDTO> arr2=stdao.studentCheckSubmit(classidx, mdto.getIdx());
		
		int totalscore=stdao.studentTestScore(classidx,mdto.getIdx());
		int count=1;
		boolean sw=false;
		%>
		<thead class="table-info-header">
			<tr>
				<th>No</th>
				<th>강좌명</th>
				<th>강사</th>
				<th>점수</th>
				<th>답안보기</th>
			</tr>
		</thead>
		<tbody>	
		<%
		if(arr==null&&arr.size()==0){
		%>
			<tr>
				<td colspan="5">성적이 존재하지 않습니다.</td>
			</tr>
		<%
		}else{
			for(int i=0;i<arr.size();i++){
		%>
			<tr>
				<td><%=count %></td>
				<td><%=arr.get(i).getClassname()%></td>
				<td><%=arr.get(i).getTname()%></td>
		<%
				if(arr2!=null||arr2.size()!=0){
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
				<td>-</td>
				<td>-</td>		
		<%
				}else{
		%>
				<td><%=totalscore %></td>
				<td><a href="studentScoreDetail.jsp?classidx=<%=classidx%>">이동</a></td>
		<%			
				}
			}
		}	
		%>
			</tr>
		</tbody>
	</table>
</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>