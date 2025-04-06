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
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>
<section>
	<article>
		<table border = "1px">
			<thead>
				<tr>
					<td>NO</td>
					<td>강좌명</td>
					<td>강사이름</td>
					<td>수강반명</td>
					<td>현재신청인원</td>
					<td>총인원</td>
					<td>개강날짜</td>
					<td>종강날짜</td>
					<td>총수강일</td>
					<td>세부정보</td>
				</tr>
			</thead>
			
			<tbody>
			<%
			ArrayList<ManagerLectureDTO> arr = mldao.managerLectureInfo();
			if(arr==null||arr.size()==0){
			%>
				<tr>
					<td colspan = "8">개설된 강좌가 없습니다.</td>
				</tr>
				
			<%
			}else{
				for(int i = 0; i<arr.size(); i++){
			%>
					<tr>
						<td><%=arr.get(i).getClassidx() %></td>
						<td><%=arr.get(i).getClassname() %></td>
						<td><%=arr.get(i).getTname() %></td>
						<td><%=arr.get(i).getGroupname() %></td>
						<td><%=arr.get(i).getReqscount() %></td>
						<td><%=arr.get(i).getEntirescount() %></td>
						<td><%=arr.get(i).getComingdate() %></td>
						<td><%=arr.get(i).getEnddate() %></td>
						<td><%=arr.get(i).getEntiredate() %></td>				
						<td>
						<form name="managerLectureDetail" action="#" method="post">
						<input type="hidden" name="classidx" value="<%=arr.get(i).getClassidx()%>">
						<input type="submit" value="보기">
						</form>
						</td>
					</tr>
			<%
				}
			}
			
			%>

			</tbody>
		</table>
	</article>
</section>
<%@include file="/header/footer.jsp"%>
</body>
</html>