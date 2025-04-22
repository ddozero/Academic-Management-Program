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

.all-section-sscore{
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height:650px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
	height:650px;
	border-bottom: 100px;
}

.all-title0 {
	  margin-top:80px;
	  margin-left: 320px;
	  margin-bottom: 20px;
	  font-size: 15px;
	  color : #333333;
}

</style>
</head>

<body>
<%@include file="/header/studentHeader.jsp" %>

<div class = "all-title0">
<h2>성적표</h2>
</div>

<section class="all-section-sscore">
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
				}else{
					sw=true;
					
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
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>