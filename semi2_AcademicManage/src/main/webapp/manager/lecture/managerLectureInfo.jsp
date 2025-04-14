<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.MLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
    text-align: left;
    font-size : 15px;
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

.table-info td:nth-child(8), .table-info th:nth-child(8) { /*삭제 너비 조정*/
	width: 80px; 
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

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>

	<article>
		<table class="table-info">
			<thead class="table-info-header">
				<tr>
					<th>NO</th>
					<th>강좌명</th>
					<th>강사명</th>
					<th>수강반명</th>
					<th>개강날짜</th>
					<th>종강날짜</th>
					<th>총수강일</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
			<%
			ArrayList<ManagerLectureDTO> arr = mldao.managerLectureInfo();
			if(arr==null||arr.size()==0){
			%>
				<tr>
					<td colspan = "9">개설된 강좌가 없습니다.</td>
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
						<td><%=arr.get(i).getComingdate() %></td>
						<td><%=arr.get(i).getEnddate() %></td>
						<td><%=arr.get(i).getEntiredate() %></td>				
						<td>
				
						<form name = "managerLectureDel" action="/semi2_AcademicManage/manager/lecture/managerLectureDel_ok.jsp" method="post">
						<input type="hidden" name="classidx" value="<%=arr.get(i).getClassidx() %>">
						<input type="submit" value ="삭제">
						
						</form>
						</td>
						
						<td>
						<form name="managerLectureUp" action="/semi2_AcademicManage/manager/lecture/managerLectureUp.jsp" method="post">
						<input type="hidden" name="classidx" value="<%=arr.get(i).getClassidx()%>">
						<input type="submit" value="수정">
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





<%@include file="/header/footer.jsp"%>
</body>
</html>