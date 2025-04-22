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


 .all-section-scabs {
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; 
  	overflow-y: auto; 
  	height : 650px;
}

.scabs-etc{
	background-color :  #CBD7FF;
	border: 1px solid #567AF0;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	border-radius: 10px;
	width : 100%;
	height : 50px;
	padding : 10px;
	font-size : 14px;
	font-weight: bold;
	display: flex;
    justify-content: center; 
    align-items: center; 
    text-align: center;
}

</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class="all-title1">
<h2>조퇴 신청 내역</h2>
</div>
<section class="all-section-scabs">
<article>
	<div class="scabs-etc">
		담당 매니저 승인은 7일 이내로 이루어집니다. 승인 시 출결 인정이 완료 됩니다.
		확인이 필요하시면 SYS Academy로 문의 주세요.
	</div>
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
		<td colspan="5">신청하신 내역이 존재하지 않습니다.</td>
		</tr>
	<%		
		}else{
			for(int i=0;i<arr.size();i++){
				String status=null;
				if(arr.get(i).getAppro()==0){
					status="미승인";
				}else if(arr.get(i).getAppro()==1){
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