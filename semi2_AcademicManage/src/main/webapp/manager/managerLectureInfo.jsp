<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>

<section style = "border:1px solid; width: 700px; height:300px;">
	<article>
		<form name = "menagerLectureInfo" method = "post" action = "memberUpdate_ok.jsp">
		<table border = "1px">
			<thead>
				<tr>
					<td>NO</td>
					<td>강좌명</td>
					<td>강사이름</td>
					<td>현재신청인원</td>
					<td>총인원</td>
					<td>개강날짜</td>
					<td>종강날짜</td>
					<td>총수강일</td>
				</tr>
			</thead>
			
			<tbody>
			<%
			ArrayList<LectureDTO> arr = mldao.managerLectureInfo();
			if(arr==null||arr.size()==0){
			%>
				<tr>
					<td colspan = "8">개설된 강좌가 없습니다.</td>
				</tr>
				
			<%
			}else{
				for(int i = 0; i<arr.size(); i++){
			%>
					<tr onclick = "location.href=''">
						<td><%=arr.get(i).getClassidx() %></td>
						<td><%=arr.get(i).getClassname() %></td>
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
				<tr>
				<td colspan = "8">
				<input type = "submit" value = "수정하기">
				<input type =  "button" value = "취소하기">
				</td>
				
				</tr>
			</tbody>
		</table>
		</form>
	</article>
</section>




<%@include file="/header/footer.jsp"%>
</body>
</html>