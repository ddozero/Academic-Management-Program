<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.semi2.member.*"%>
<%@ page import="com.semi2.lecture.*"%>
<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />

<%
request.setCharacterEncoding("utf-8");

MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
String name = mdto.getName().trim();
ArrayList<ManagerLectureDTO> list = mldao.findLectureByTname(name);
ManagerLectureDTO dto = null;
if (list != null && list.size() > 0) {
    dto = list.get(0);
} else {
%>
<script>alert("해당 강사의 강좌가 없습니다."); history.back();</script>
<%
    return;
}
ArrayList<ManagerLectureDTO> weekList = mldao.getWeekList(dto.getClassidx());
weekList.sort(Comparator.comparingInt(ManagerLectureDTO::getWeeknum));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.table-add {
	width: 100%;
	border-collapse: collapse;
	margin: 20px auto;
	border-radius: 10px;
}

.header-style {
	width: 15%;
	text-align: center;
	border: 1px solid #ddd;
	background-color: #eee;
	font-size: 15px;
}

.cell-data {
	width: 25%;
	text-align: left;
	padding: 10px;
	border: 1px solid #ddd;
}

.right-align {
	text-align: right;
	padding: 10px;
}

.button-add {
	padding: 6px 12px;
	background-color: #567AF0;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button-add:hover {
	background-color: #3457c0;
}

.all-section2-sub {
		margin-left: 320px; 
		margin-bottom: 50px;
		background-color: #ffffff;
		padding: 8px 30px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		height: 600px; /* 추가 높이 설정 */
		max-height: 400px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
  		overflow-x: hidden;
  		margin-bottom : 20px;
}

</style>
<script>
    function enableEdit() {
      document.getElementById("classintroText").style.display = "none";
      document.getElementById("classintroInput").style.display = "block";
      document.getElementById("saveBtn").style.display = "inline-block";
      document.getElementById("cancelBtn").style.display = "inline-block";
      document.getElementById("editBtn").style.display = "none";
    }
    function cancelEdit() {
      location.reload();
    }
  </script>
</head>
<body>
	<%@include file="../header/teacherHeader.jsp"%>
	<div class="all-title1">
		<h2>담당 강좌 세부 정보</h2>
	</div>
	<section class="all-section1">
		<form method="post" action="lectureIntroUpdate_ok.jsp">
			<input type="hidden" name="classidx" value="<%=dto.getClassidx()%>">
			<table class="table-add">
				<tr>
					<th class="header-style">강좌명</th>
					<td class="cell-data" colspan="3"><%=dto.getClassname()%></td>
				</tr>
				<tr>
					<th class="header-style">담당강사</th>
					<td class="cell-data"><%=dto.getTname()%></td>
					<th class="header-style">담당매니저</th>
					<td class="cell-data"><%=dto.getChargemname()%></td>
				</tr>
				<tr>
					<th class="header-style">수강반명</th>
					<td class="cell-data"><%=dto.getGroupname()%></td>
					<th class="header-style">총 수강일</th>
					<td class="cell-data"><%=dto.getEntiredate()%></td>
				</tr>
				<tr>
					<th class="header-style">개강일</th>
					<td class="cell-data"><%=dto.getComingdate()%></td>
					<th class="header-style">종강일</th>
					<td class="cell-data"><%=dto.getEnddate()%></td>
				</tr>
				<tr>
					<th class="header-style">강좌 개요</th>
					<td class="cell-data" colspan="3">
						<div id="classintroText"><%= (dto.getClassintro() == null || dto.getClassintro().trim().equals("")) ? "등록된 개요가 없습니다." : dto.getClassintro() %></div>
						<textarea id="classintroInput" name="classintro" rows="4"
							style="width: 100%; resize: none; display: none;"><%=dto.getClassintro()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="right-align">
						<button type="button" id="editBtn" class="button-add"
							onclick="enableEdit()">개요 수정</button> <input type="submit"
						id="saveBtn" class="button-add" style="display: none;" value="저장">
						<button type="button" id="cancelBtn" class="button-add"
							style="display: none;" onclick="cancelEdit()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>

	<div class="all-title2">
		<h2>세부 목차 목록</h2>
	</div>
	<section class="all-section2-sub">
		<div class="right-align">
			<button class="button-add"
				onclick="window.open('weekInsertForm.jsp?classidx=<%=dto.getClassidx()%>', 'popup', 'width=600,height=500')">세부강좌
				등록</button>
		</div>
		<table class="table-add">
			<tr>
				<th class="header-style">주차</th>
				<th class="header-style">주차명</th>
				<th class="header-style">내용</th>
				<th class="header-style">기간</th>
				<th class="header-style">삭제</th>
			</tr>
			<% if (weekList != null && weekList.size() > 0) {
         for (ManagerLectureDTO w : weekList) { %>
			<tr>
				<td class="cell-data"><%=w.getWeeknum()%></td>
				<td class="cell-data"><%=w.getWeekname()%></td>
				<td class="cell-data"><%=w.getWeekcon()%></td>
				<td class="cell-data"><%=w.getWeekperiod()%></td>
				<td class="cell-data">
					<form method="post" action="weekDelete_ok.jsp"
						onsubmit="return confirm('정말 삭제하시겠습니까?');">
						<input type="hidden" name="classidx"
							value="<%=dto.getClassidx()%>"> <input type="hidden"
							name="weeknum" value="<%=w.getWeeknum()%>"> <input
							type="submit" value="삭제" class="button-add">
					</form>
				</td>
			</tr>
			<% } } else { %>
			<tr>
				<td colspan="5" class="cell-data" style="text-align: center;">등록된 담당 강좌의 세부목차가 없습니다.</td>
			</tr>
			<% } %>
		</table>
	</section>
	<%@include file="../header/footer.jsp"%>
</body>
</html>
