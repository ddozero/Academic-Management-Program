 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.semi2.lecture.*" %>    
<%@ page import="com.semi2.record.*" %>    
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	
	if(classidx==0){
%>
	<script>
	window.alert('현재 신청하신 강좌가 존재 하지않습니다. 강좌를 먼저 신청해주세요.');
	location.href='/semi2_AcademicManage/student/studentlecture/studentLectureList.jsp';
	</script>
<%		
		return;
	}
		
	
	LectureDTO sldto=sldao.studentMyLecture(mdto.getIdx());
	
	int currate=srdao.studentAttendRate3(mdto.getIdx(), classidx);
	ArrayList<RecordDTO> arr=srdao.studentShowAttend2(mdto.getIdx());
	
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
    height:100px;
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

.all-section2 {
		margin-left: 320px; 
		margin-bottom: 50px;
		background-color: #ffffff;
		padding: 8px 30px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		max-height: 400px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
  		overflow-x: hidden;
  		height: 400px;
  		border-bottom: 100px;
	}
    
</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp"%>
<div class = "all-title1">
<h2>나의 출석부</h2>
</div>
<section class="all-section1">
	<article>
		<table class="table-info">
			<thead  class="table-info-header">
				<tr>
					<th>강좌명</th>
					<th>강사</th>
					<th>개강일</th>
					<th>종강일</th>
					<th>총수강일</th>
					<th>현재출석률</th>
				</tr>
			</thead>
			<tbody>
				<%
				
				if(sldto==null||sldto.equals("")){
				%>
				<tr>
					<td colspan="6">출석정보가 존재하지 않습니다.</td>
				</tr>
				<%
				}else{
				%>	
				<tr>
					<td><%=sldto.getClassname() %></td>
					<td><%=sldto.getTname() %></td>
					<td><%=sldto.getComingdate() %></td>
					<td><%=sldto.getEnddate() %></td>
					<td><%=sldto.getEntiredate() %></td>
					<td><%=currate %>%</td>
					
				</tr>
				<%	
				}
				%>
				
			</tbody>

			
		</table>
	</article>
</section>

<div class = "all-title2">
<h2>날짜별 출석</h2>
</div>
<section class="all-section2">
	<article>
		<%
		ArrayList<RecordDTO> arr2=srdao.studentShowAttend2(mdto.getIdx());
		if(arr2==null||arr2.size()==0){
		%>	
			<h2>출석정보가 존재하지않습니다.</h2>
				
		<%	
		}else{
		%>	
			<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th>날짜</th>
						<th>입실시간</th>
						<th>퇴실시간</th>
						<th>상태</th>
					</tr>				
				</thead>
			
		<%	
			for(int i=0;i<arr2.size();i++){
				
				SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss");
				
				String timeOnly="";
				String timeOnly2="";

				String temp="";
				if(arr.get(i).getIntime()!=null&&arr.get(i).getOuttime()!=null){
					timeOnly=sdf.format(arr.get(i).getIntime());
					timeOnly2=sdf.format(arr.get(i).getOuttime());
				}
				
				
				switch(arr.get(i).getStatus()){
					case 1:temp="출석";break;
					case 3:temp="지각";break;
					case 4:temp="조퇴";break;
					case 5:temp="결석";break;
					case 6:temp="질병";break;
				}
		%>	
				<tr>
					<td><%=arr2.get(i).getattendate() %></td>
					<td><%=timeOnly %></td>
					<td><%=timeOnly2 %></td>
					<td><%=temp%></td>
				</tr>
		<%	
			}
		%>
			</table>
			
		<%	
		}
		%>
		
	</article>
	
</section>
<div style="height: 30px;"></div>
<%@include file="/header/footer.jsp" %>
</body>
</html>