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
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
/* 조퇴 신청 페이지 전용 스타일 */
.all-title-0 {
    margin-top: 100px;
    margin-left: 320px;
    margin-bottom: 20px;
    font-size: 15px;
    font-weight: bold;
    color: #333333;
}

.all-section-absen {
    margin-left: 320px;
    background-color: #ffffff;
    padding: 30px 40px;
    border-radius: 10px;
    max-width: calc(100% - 360px);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    margin-bottom: 80px; /* 푸터와 간격 */
    height: 650px;
    border-bottom: 100px
}

.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
  height: 80px;
}

.header-style {
  width: 10%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
}

.cell-data {
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
}


input[type="file"] {
    padding: 5px;

}

select[name="issuedivi"] {
    margin-left: 10px;
    padding: 5px 8px;

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
    text-align: center;
     align-items:center;
}

input[type="submit"]:hover {
    background-color: #3e5ed0;
}

select[name="issuedivi"] {
    margin-left: 10px;
    margin-right: 12px; 
    padding: 5px 8px;
    font-size: 14px;
}

.subabs-etc{
	background-color :  #CBD7FF;
	border: 1px solid #567AF0;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	border-radius: 10px;
	width : 100%;
	height : 120px;
	padding : 20px;
	font-size : 14px;
	font-weight: bold;
	display: flex;
    justify-content: center; 
    align-items: center; 
    text-align: center;
}

.file-up {
    display: flex;
    justify-content: center; 
    align-items: center; 
    margin-top: 20px; 
}

</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp"%>

<div class ="all-title-0">
<h2>조퇴 신청</h2>
</div>

<section class="all-section-absen">
	<div class="subabs-etc">
		담당 매니저 승인은 7일 이내로 이루어집니다.<br><br>
		병결 처리 인정 서류 : 질병코드가 기재된 진단서 또는 처방전<br>
		조퇴 처리 인정 서류 : 학원에서 제공 하는 서식에 작성 후 업로드 후 제출 바람<br>
		문의사항은 SYS Academy 담당 매니저에게 문의 주세요.<br>
	</div>

	<form name="fileUpload" action="studentSubmitAbsence_ok.jsp" method="post" enctype="multipart/form-data">
	<table class = "table-add">
		<tr>
			<th class="header-style"> 업로드 파일 </th>
			<td class="cell-data"> <input type="file" name="upload"></td>
		</tr>
		
		<tr>
			<th class="header-style"> 사유 선택 </th>
			<td class="cell-data">
				<select name="issuedivi">
					<option value="조퇴">조퇴</option>
					<option value="질병">질병</option>
				</select>
			</td>
		</tr>
		
		
	</table>
		<div class = "file-up">
			<input type="submit" value="파일 올리기">
		</div>
			
	</form>

</section>

<%@include file="/header/footer.jsp" %>
</body>
</html>