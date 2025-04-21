<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.record.*" %>
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
<div class="all-title1">
<h2>조퇴 신청 내역</h2>
</div>
<section class="all-section1">
<article>
	<table class="table-info">
		<thead class="table-info-header">
			<tr>
				<th>신청일</th>
				<th>강좌명</th>
				<th>신청구분</th>
				<th>업로드 파일</th>
				<th>승인상태</th>
			</tr>
		</thead>
		<tbody>
	<%
		ArrayList<RecordDTO> arr=srdao.studentAbsList(mdto.getIdx());
		String classname=srdao.studentAbsList2(mdto.getIdx());
	
		if(arr==null||arr.size()==0){
	%>		
		<tr>
		<td colspan="4">신청하신 내역이 존재하지 않습니다.</td>
		</tr>
	<%		
		}else{
			for(int i=0;i<arr.size();i++){
				String status=null;
				if(arr.get(i).getStatus()==0){
					status="미승인";
				}else if(arr.get(i).getStatus()==1){
					status="승인";
				}
	%>		
		<tr>	
			<td><%=arr.get(i).getReqdate() %></td>
			<td><%=classname %></td>
			<td><%=arr.get(i).getIssuedivi() %></td>
			<td><a href="/semi2_AcademicManage/recordimg/<%=arr.get(i).getFilename()%>">다운로드</a></td>
			<td><%=status%></td>
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