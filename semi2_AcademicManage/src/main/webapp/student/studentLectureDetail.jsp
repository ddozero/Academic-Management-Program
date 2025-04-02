<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function showpopup(){
	window.open('studentLectureSubmit.jsp','popup','width=350,height=200');
}

</script>
</head>
<body>
여기는 강좌 상세 페이지 입니다.
<%@include file="../header/studentHeader.jsp"%>
<section>
	<article>
		<table>
			<tr>
				<td>강좌번호</td>
				<td>강좌제목</td>
				<td>강사이름</td>
				<td>현재신청인원/총인원</td>
			</tr>		
			<tr>
				<td></td>
				<td></td>
				<td>개강날짜/종강날짜</td>
				<td>총 수강일</td>
			</tr>
			<tr>
				<td>강좌목차</td>
			</tr>
			<tr>
				<td>1주차</td>
				<td>1주차 내용</td>
			</tr>
			<tr>
				<td>강좌세부내용</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" value="신청하기" onclick="showpopup()"><input type="button" value="뒤로가기"></td>
			</tr>
		</table>
		
	</article>
</section>
</body>
</html>