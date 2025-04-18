<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.semi2.test.*"%>
<%@ page import="com.semi2.member.*"%>
<jsp:useBean id="tDAO" class="com.semi2.test.TTestDAO" />

<%
request.setCharacterEncoding("utf-8");
MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
String tname = mdto.getName().trim();

// 강의 목록과 시험 목록
ArrayList<Map<String, Object>> classList = tDAO.getClassListByTname(tname);
int selectedClassidx = (request.getParameter("classidx") != null)
    ? Integer.parseInt(request.getParameter("classidx"))
    : (classList.size() > 0 ? (Integer)classList.get(0).get("classidx") : 0);

ArrayList<TestDTO> testList = tDAO.getTestListByClassidx(selectedClassidx);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">

<style>
.section-box {
	background-color: #fff;
	border-radius: 10px;
	padding: 20px;
	margin: 30px auto;
	width: 90%;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.input-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.input-table th, .input-table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.input-table th {
	width: 15%;
	background-color: #f5f5f5;
}

.button-blue {
	padding: 8px 16px;
	background-color: #4b73f1;
	color: white;
	border: none;
	border-radius: 5px;
	margin-right: 10px;
	cursor: pointer;
}

.button-blue:hover {
	background-color: #3457c0;
}

.exam-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.exam-table th, .exam-table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.exam-table th {
	background-color: #f0f0f0;
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
	margin-bottom: 20px;
}

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
</style>
</head>

<body>
	<%@ include file="../header/teacherHeader.jsp"%>

	<div class="all-title1">
		<h2>담당강좌별 시험등록</h2>
	</div>

	<section class="all-section1">
		<form method="post" action="testInsert_ok.jsp">
			<input type="hidden" name="classidx" value="<%=selectedClassidx%>">
			<table class="table-add">
				<tr>
					<th class="header-style">강좌 선택</th>
					<td class="cell-data" colspan="3"><select name="classidx"
						onchange="this.form.submit()">
							<% for (Map<String, Object> map : classList) {
                 int classidx = (Integer) map.get("classidx");
                 String cname = (String) map.get("classname");
            %>
							<option value="<%=classidx%>"
								<%= (classidx == selectedClassidx ? "selected" : "") %>><%=cname%></option>
							<% } %>
					</select></td>
				</tr>
				<%
				ArrayList<Integer> usedNumidxList = tDAO.getUsedNumidxList(selectedClassidx);
				%>
				<tr>
					<th class="header-style">항목번호</th>
					<td class="cell-data"><select name="numidx">
							<%
							for (int i = 1; i <= 50; i++) {
								if (!usedNumidxList.contains(i)) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							}
							%>
					</select></td>
				</tr>
				<tr>
					<th class="header-style">문제내용</th>
					<td class="cell-data"><textarea name="exam" rows="6"
							style="width: 60%; resize: none;"></textarea></td>
				</tr>
				<tr>
					<th class="header-style">정답</th>
					<td class="cell-data"><input type="text" name="rightanswer"></td>
				</tr>
				<tr>
					<th class="header-style">배점</th>
					<td class="cell-data"><input type="number" name="score"></td>
				</tr>
			</table>
			<div style="text-align: right; margin-top: 10px;">
				<input type="submit" class="button-blue" value="등록"> <input
					type="reset" class="button-blue" value="다시입력">
			</div>
		</form>
	</section>

	<div class="all-title2">
		<h2>시험문제 목록</h2>
	</div>
	<section class="all-section2-sub">
		<table class="exam-table" border="1">
			<tr>
				<th>NO</th>
				<th>문제</th>
				<th>정답</th>
				<th>배점</th>
				<th>삭제</th>
			</tr>
			<%
    int no = 1;
    for (TestDTO dto : testList) {
  %>
			<tr>
				<td><%= no++ %></td>
				<td><%= dto.getExam().replaceAll("(\r\n|\r|\n)", "<br>") %></td>
				<td><%= dto.getRightanswer() %></td>
				<td><%= dto.getScore() %></td>
				<td>
					<form method="post" action="testDelete_ok.jsp"
						onsubmit="return confirm('삭제하시겠습니까?');">
						<input type="hidden" name="testidx" value="<%=dto.getTestidx()%>">
						<input type="hidden" name="classidx" value="<%=selectedClassidx%>">
						<input type="submit" class="button-blue" value="삭제">
					</form>
				</td>
			</tr>
			<% } %>
		</table>
	</section>

	<%@ include file="../header/footer.jsp"%>
</body>
</html>