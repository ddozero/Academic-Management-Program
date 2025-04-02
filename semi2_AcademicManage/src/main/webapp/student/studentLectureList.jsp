<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.lecture.*" %>
<jsp:useBean id="ldao" class="com.semi2.lecture.LectureDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="../header/studentHeader.jsp"%>
<section>
	<article>
		<table>
			<tr>
				<td>강좌 번호</td>
				<td>강좌명</td>
				<td>강사이름</td>
				<td>현재신청인원</td>
				<td>총인원</td>
				<td>개강날짜</td>
				<td>종강날짜</td>
				<td>총수강일</td>
			</tr>		
			<%
			ArrayList<LectureDTO> arr=ldao.lectureList();
			for(int i=0;i<arr.size();i++){
				if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan="8">현재 개설중인 강좌가 존재하지 않습니다.</td>
			</tr>
				
			<%		
				}else{
			%>
			<tr>
				<td>강좌 번호</td>
				<td><a href="studentLectureDetail.jsp">강좌명</a></td>
				<td>강사이름</td>
				<td>현재신청인원</td>
				<td>총인원</td>
				<td>개강날짜</td>
				<td>종강날짜</td>
				<td>총수강일</td>
			</tr>
			
			<%
				}
			}
			%>
			
		</table>
	</article>
	<article>
	
	
	</article>
</section>
</body>
</html>