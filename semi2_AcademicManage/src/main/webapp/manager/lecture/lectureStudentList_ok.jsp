<%@page import="com.semi2.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "com.semi2.lecture.*" %>

<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.semi2.member.MMemberDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<style>
.table-info2 {
    width: 100%;
    border-collapse: collapse;
    margin: 10px 0;
    font-size: 15px;
    text-align: left;
}


.table-info-header2 th {
    background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
    width : 20%
}


.table-info2 td {
    padding: 10px; 
    border: 1px solid #ddd;
    text-align: center;

}



.table-info2 td form input[type="submit"]{
	background: #fff;
	color: #77777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}

.table-info2 td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}


.LectureList-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}

.total-count p{
	font-size: 14px;
	color : #666;
	margin-top:15px;
}

</style>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>
<%
String classidx_s = request.getParameter("classidx");

if(classidx_s==null||classidx_s.equals("")){
	classidx_s = "0";
}
int classidx = Integer.parseInt(classidx_s);
ArrayList<MemberDTO> arr = mdao.lectureStudentList(classidx);

//총 개수구하기
int totalCount = 0;
if (arr != null) {
	totalCount = arr.size();
} else {
	totalCount = 0; 
}

System.out.println("classidx: " + classidx);
%>
	<article>
		<div class = "total-count">
			<p>총 <%=totalCount %>명</p>
		</div>
		<table class="table-info2">
			<thead class="table-info-header2">
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>이메일</th>
				</tr>
			</thead>
			
			<tbody>
			<%
			if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan = "5" style="font-size:15px;"> 등록된 수강생이 없습니다. </td>
			</tr>
			<%
			}else{
				for(int i = 0; i<arr.size(); i++){
			%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=arr.get(i).getName() %></td>
					<td><%=arr.get(i).getSex() %></td>
					<td><%=arr.get(i).getBirth() %></td>
					<td><%=arr.get(i).getEmail() %></td>
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