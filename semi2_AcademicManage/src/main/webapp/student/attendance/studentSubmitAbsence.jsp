<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>

<div class ="all-title1">
<h2>출결 인정 신청</h2>
</div>

<section class="all-section1">
<article>
	<form name="fileUpload" action="studentSubmitAbsence_ok.jsp" method="post"
		enctype="multipart/form-data">
		<ul>
			<li>
			<label>업로드파일:</label>
			<input type="file" name="upload">
			<select name="issuedivi">
				<option value="조퇴">조퇴</option>
				<option value="질병">질병</option>
				<option value="휴가">휴가</option>
				
			</select>
			
			</li>
		</ul>
		
		<div>
			<input type="submit" value="파일 올리기">
		</div>
	</form>
</article>
</section>

<%@include file="/header/footer.jsp" %>
</body>
</html>