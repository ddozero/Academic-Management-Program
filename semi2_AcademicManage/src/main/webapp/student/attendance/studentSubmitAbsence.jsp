<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/* 조퇴 신청 페이지 전용 스타일 */
.all-title1 {
    margin-top: 100px;
    margin-left: 320px;
    margin-bottom: 20px;
    font-size: 18px;
    font-weight: bold;
    color: #333333;
}

.all-section1 {
    margin-left: 320px;
    background-color: #ffffff;
    padding: 30px 40px;
    border-radius: 10px;
    max-width: calc(100% - 360px);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    margin-bottom: 80px; /* 푸터와 간격 */
}

form ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

form li {
    margin-bottom: 20px;
    font-size: 14px;
}

form label {
    display: inline-block;
    width: 100px;
    font-weight: bold;
    color: #333;
}

input[type="file"] {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

select[name="issuedivi"] {
    margin-left: 10px;
    padding: 5px 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

input[type="submit"] {
    background-color: #567AF0;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #3e5ed0;
}

select[name="issuedivi"] {
    margin-left: 10px;
    margin-right: 12px; /* ✅ 버튼과의 간격 추가 */
    padding: 5px 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}
</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp"%>

<div class ="all-title1">
<h2>조퇴 신청</h2>
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
			</select>
			<input type="submit" value="파일 올리기">
			</li>
		</ul>
		
			
	</form>
</article>
</section>

<%@include file="/header/footer.jsp" %>
</body>
</html>