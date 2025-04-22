<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="msdao" class="com.semi2.member.TstudentDAO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s.equals(""))
	idx_s = "0";
int idx = Integer.parseInt(idx_s);
System.out.println("idx: " + idx);

MemberDTO dto = msdao.mstudentInfoDetail(idx);
if (dto == null) {
%>
<script>
	alert("학생 정보 등록 중입니다.");
	location.href = '/semi2_AcademicManage/teacher/tStudentMemo.jsp';
</script>
<%
return;
}

String teacherName = "채수림";
String now = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date());
String defaultMemo = teacherName + " 강사 (" + now + ")\n";
boolean isEdit = "edit".equals(request.getParameter("action"));
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
	border-radius: 10px;
}

.header-style {
	width: 10%;
	text-align: center;
	border: 1px solid #ddd;
	white-space: nowrap;
	background-color: #eee;
	font-size: 15px;
}

.cell-data {
	width: 25%;
	text-align: left;
	padding: 10px;
	border: 1px solid #ddd;
}

.info-box {
	display: flex;
	align-items: flex-start;
	gap: 20px;
	margin: 20px auto;
}

.image-placeholder img {
	width: 150px;
	height: 200px;
	object-fit: cover;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.memo-guide {
	font-size: 13px;
	color: #777;
	margin-bottom: 5px;
}

textarea.memo-clean {
	font-family: monospace;
	font-size: 14px;
	line-height: 1.5;
	padding: 6px;
	border: 1px solid #ccc;
	width: 100%;
	resize: none;
	box-sizing: border-box;
	white-space: pre-wrap;
}

.bt-container{
 	display: flex;
    justify-content: flex-end;
    width: 100%; 
    margin-top: 10px; 
}

.bt-ct1 {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    gap: 10px; /* 버튼 간 간격 */
    width: 100%; /* 부모 요소 너비 맞춤 */
    margin-top: 10px; /* 상단 간격 */
}

input.blue-btn {
   background: #567AF0;
	  color: #fff;
	  border: none;
	  border-radius: 10px;
	  width: 80px;
	  height: 32px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  cursor: pointer;

}

input.blue-btn:hover {
  background: #4569d6;
}


</style>
</head>

<body>
	<%@include file="../header/teacherHeader.jsp"%>

	<%
	if (isEdit) {
	%>
	<form method="post" action="tStudentMemoUpdate_ok.jsp">
		<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
		<%
		}
		%>
		<div class="all-title2">
		
		</div>
		<div class="info-box">
			<div class="image-placeholder">
				<img src="/semi2_AcademicManage/img/<%=dto.getImgaddr() %>" alt="이미지테스트">
			</div>
			
			<table class="table-add">
				<tr>
					<th class="header-style">이름</th>
					<td class="cell-data"><%=dto.getName()%></td>
					<th class="header-style">성별</th>
					<td class="cell-data"><%=dto.getSex()%></td>
				</tr>
				<tr>
					<th class="header-style">생년월일</th>
					<td class="cell-data"><%=dto.getBirth()%></td>
					<th class="header-style">주소</th>
					<td class="cell-data"><%=dto.getAddr()%></td>
				</tr>
				<tr>
					<th class="header-style">연락처</th>
					<td class="cell-data"><%=dto.getTel()%></td>
					<th class="header-style">이메일</th>
					<td class="cell-data"><%=dto.getEmail()%></td>
				</tr>
				<tr>
					<th class="header-style">학력</th>
					<td class="cell-data"><%=dto.getEdu()%></td>
					<th class="header-style">경력</th>
					<td class="cell-data"><%=dto.getLicen()%></td>
				</tr>
				<tr>
					<th class="header-style">수강반명</th>
					<td class="cell-data"><%=dto.getGroupname()%></td>
					<th class="header-style">강좌명</th>
					<td class="cell-data"><%=dto.getClassname()%></td>
				</tr>
				<tr>
					<th class="header-style">개강일</th>
					<td class="cell-data"><%=dto.getComingdate()%></td>
					<th class="header-style">종강일</th>
					<td class="cell-data"><%=dto.getEnddate()%></td>
				</tr>
				<tr>
					<th class="header-style">특이사항</th>
					<td class="cell-data" colspan="3">
						<%
						if (isEdit) {
						%>
						<div class="memo-guide">※ 특이사항을 입력해주세요. 작성자는 자동으로 기록됩니다.</div>
						<textarea class="memo-clean" name="memo" id="memoTextarea" rows="6"></textarea>
						<script>
						    document.getElementById("memoTextarea").value = `<%=defaultMemo.replace("\\", "\\\\").replace("\n", "\\n").replace("\"", "\\\"")%>`;
						</script>
						<%
						} else {
						%>
						<div style="white-space: pre-wrap;"><%=dto.getMemo() != null ? dto.getMemo() : "작성된 메모가 없습니다."%></div>
						<%
						}
						%>
					</td>
				</tr>
			</table>
		</div>

		<div class = "bt-ct1">
			<%
			if (isEdit) {
			%>
			<input type="submit" value="저장" class="blue-btn"> <input
				type="button" value="취소" class="blue-btn"
				onclick="location.href='tStudentMemo.jsp?idx=<%=dto.getIdx()%>'">
		</div>
		</form>
	<%
	} else {
	%>
	<form method="post" action="tStudentMemo.jsp">
	<div class="bt-ct2">
		<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
		<input type="hidden" name="action" value="edit">
		<input type="submit" value="수정하기" class="blue-btn">
	
	<% } %>
	</div>
</form>
	<%@include file="/header/footer.jsp"%>
</body>
</html>