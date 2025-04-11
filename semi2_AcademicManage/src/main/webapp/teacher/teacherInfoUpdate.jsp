<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.semi2.member.*"%>
<%

String id = "teacher";
int midx = 3;
int idx = 3;
TMemberDAO dao = new TMemberDAO();
MemberDTO dto = dao.getTeacherInfo(id, midx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>



.title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 25px;
}

.info-box {
	border: 1px solid #e0e0e0;
	padding: 20px;
}

.info-box h3 {
	margin-bottom: 20px;
}

.info-content {
	display: flex;
}

.image-box {
	width: 150px;
	height: 180px;
	background-color: #f0f0f0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.image-box img {
	max-width: 100%;
	max-height: 100%;
}

.info-table {
	flex-grow: 1;
	width: 100%;
	border-collapse: collapse;
}

.info-table td {
	border: 1px solid #ddd;
	padding: 10px;
	height: 45px;
}

.info-table td.label {
	background-color: #f9f9f9;
	font-weight: bold;
	width: 120px;
}

.button-box {
	margin-top: 20px;
	text-align: right;
}

.button-box button {
	background-color: #356ae6;
	color: white;
	padding: 8px 18px;
	border: none;
	border-radius: 5px;
	margin-left: 10px;
	cursor: pointer;
}

.button-box input.blue-btn {
	background-color: #356ae6;
	color: white;
	padding: 8px 18px;
	border: none;
	border-radius: 5px;
	margin-left: 10px;
	cursor: pointer;
}

.all-section-tinfoup{
		margin-left: 320px; 
		background-color: #ffffff;
		padding: 20px 40px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		max-height: 1000px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
}

</style>
</head>
<body>
	<%@include file="../header/teacherHeader.jsp"%>
	
	<div class = "all-title1">
  <h2>내정보 수정</h2>
  </div>
  <section class= "all-section-tinfoup">
	<form action="./teacherInfoUpdate_ok.jsp" method="post">
			<input type="hidden" name="idx" value="<%= dto.getIdx() %>">
			<div class="wrapper">
				<div class="title"><%=dto.getName() %>
					강사님 정보
				</div>
				<div class="info-box">
					<h3>강사 기본 정보</h3>

					<div class="info-content">
						<div class="image-box">
							<img src="img/test.jpg" alt="강사사진">
						</div>
						<table class="info-table">
							<tr>
								<td class="label">이름</td>
								<td><input type="text" name="name"
									value="<%= dto.getName() %>" readonly></td>
								<td class="label">성별</td>
								<td><input type="text" name="sex"
									value="<%= dto.getSex() %>" readonly></td>
							</tr>
							<tr>
								<td class="label">생년월일</td>
								<td><input type="text" name="birth"
									value="<%= dto.getBirth() %>" readonly></td>
								<td class="label">연락처</td>
								<td><input type="text" name="tel"
									value="<%=dto.getTel() %>" readonly></td>
							</tr>
							<tr>
								<td class="label">이메일</td>
								<td><input type="text" name="email"
									value="<%= dto.getEmail() %>" readonly></td>
								<td class="label">주소</td>
								<td><input type="text" name="addr"
									value="<%= dto.getAddr() %>" readonly></td>
							</tr>
							<tr>
								<td class="label">입사일</td>
								<td><input type="date" name="comingdate"></td>
								<td class="label">학력</td>
								<td><input type="text" name="edu2"></td>
							</tr>
							<tr>
								<td class="label">경력</td>
								<td><input type="text" name="career"></td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td class="label">반</td>
								<td><input type="text" name="groupname"
									value="<%= dto.getGroupname()%>"></td>
								<td class="label">담당강좌명</td>
								<td><input type="text" name="classidx"
									value="<%= dto.getClassidx()%>"></td>
							</tr>
							<tr>
								<td class="label">특이사항</td>
								<td><input type="text" name="memo"></td>
								<td colspan="3"></td>
							</tr>
						</table>
					</div>
					<div class="button-box">
						<input type="submit" value="수정하기" class="blue-btn"> <input
							type="button" value="취소하기"
							onclick="location.href='teacherInfo.jsp'" class="blue-btn">
					</div>
				</div>
			</div>
		</form>
	</section>
	<%@include file="../header/footer.jsp"%>
</body>
</html>