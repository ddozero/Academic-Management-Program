<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.semi2.record.*"%>
<%@ page import="com.semi2.member.*"%>

<jsp:useBean id="dao" class="com.semi2.record.TRecordDAO" />
<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO" />
<%
MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
String id = mdto.getId();
int midx = mdto.getMidx();
int idx = mdto.getIdx();
String name = mdto.getName();

String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String attendate_s = request.getParameter("attendate");
if (attendate_s == null || attendate_s.equals("")) attendate_s = today;

String fkey = request.getParameter("fkey") == null ? "" : request.getParameter("fkey");
String fvalue = request.getParameter("fvalue") == null ? "" : request.getParameter("fvalue");

java.sql.Date attendate = java.sql.Date.valueOf(attendate_s);
ArrayList<RecordDTO> list = null;

int classidx = dao.findClassidxByTname(name); // tname으로 classidx 조회

if ("name".equals(fkey) && !fvalue.equals("")) {
    list = dao.selectStudentRecordByClassidxAndName(classidx, fvalue); // 이름으로 검색
} else if ("all".equals(fkey)) {
    list = dao.selectAllStudentRecordByClassidx(classidx); // 전체 검색 (날짜 무관)
} else {
    list = dao.selectStudentRecordByClassidx(classidx, attendate); // 기본: 날짜 기준 조회
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
body {
	font-family: '맑은 고딕', sans-serif;
	background-color: #f2f4f8;
	margin: 0;
	padding: 0;
}

h2 {
	margin: 20px 30px;
	font-size: 30px;
}

.search-bar {
	background-color: #e8f0ff;
	border-radius: 10px;
	padding: 15px 20px;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
}

.search-bar form {
	display: flex;
	align-items: center;
	gap: 10px;
}

input[type="date"], input[type="text"], select {
	height: 32px;
	border: 1px solid #ccc;
	border-radius: 6px;
	padding: 0 10px;
}

input[type="submit"] {
	background-color: #fff;
	border: 1px solid #567af0;
	color: #567af0;
	border-radius: 6px;
	height: 32px;
	padding: 0 15px;
	font-weight: bold;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #567af0;
	color: white;
}

.table-wrap {
	overflow-x: auto;
}

.table-info {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
}

.table-info th, .table-info td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
}

.table-info th {
	background-color: #f7f7f7;
}

.notice {
	font-family: '맑은 고딕', sans-serif;
	color: grey;
	font-size: 12px;
}

</style>
</head>
<script>
function toggleInputState() {
    var select = document.getElementById("fkeySelect");
    var input = document.getElementById("fvalueInput");

    if (select.value === "all") {
        input.disabled = true;
        input.value = "";
    } else {
        input.disabled = false;
        input.placeholder = "이름을 입력해주세요";
    }
}

// 페이지 로드 시 초기 상태 적용
window.onload = function() {
    toggleInputState();
};
</script>
<body>
<%@include file = "../header/teacherHeader.jsp" %>
<%
    dao.getClassByName(rdto, name); // 제목에 출력할 데이터 미리 dto에 세팅
%>
<div class="all-title1">
	<h2><%= rdto.getClassname() %>강좌 수강생 출결 조회</h2>
</div>
<section class="all-section1">
	<div>
	<div class = "notice">
	*특정 날짜 조회 또는 특정 이름으로 전체 검색, 전체 검색만 가능합니다.
	</div>
		<div class="search-bar">
		
			<form method="get" action="LStudentAtten.jsp">
				<label>날짜</label>
				<input type="date" name="attendate" value="<%=attendate_s%>">
				<input type="hidden" name="fkey" value="date">
				<input type="submit" value="조회">
			</form>

				<form method="get" action="LStudentAtten.jsp">
					<input type="hidden" name="attendate" value="<%=attendate_s%>">
					<label>검색조건</label> <select name="fkey" id="fkeySelect"
						onchange="toggleInputState()">
						<option value="all" <%="all".equals(fkey) ? "selected" : ""%>>전체</option>
						<option value="name" <%="name".equals(fkey) ? "selected" : ""%>>이름</option>
					</select> <input type="text" id="fvalueInput" name="fvalue"
						value="<%=fvalue%>" placeholder="이름을 입력해주세요"> <input
						type="submit" value="검색">
				</form>
				
			</div>

		<div class="table-wrap">
			<table class="table-info">
				<thead>
					<tr>
						<th>NO</th>
						<th>이름</th>
						<th>수강 반명</th>
						<th>수강 강좌명</th>
						<th>날짜</th>
						<th>입실시간</th>
						<th>퇴실시간</th>
						<th>총 수업시간</th>
						<th>상태</th>
						<th>현재 출석률</th>
						<th>전체 출석률</th>
					</tr>
				</thead>
	<%
	int totalCount = (list != null) ? list.size() : 0;
	%>

	<tbody>
	<%
	if (totalCount == 0) {
	%>
		<tr><td colspan="11">출결 정보가 없습니다.</td></tr>
	<%
	} else {
		for (int i = 0; i < totalCount; i++) {
		    rdto = list.get(i);
		    String statusText = "";
		    switch (rdto.getStatus()) {
		        case 1: statusText = "출석"; break;
		        case 3: statusText = "지각"; break;
		        case 4: statusText = "조퇴"; break;
		        case 5: statusText = "결석"; break;
		        case 6: statusText = "질병"; break;
		        default: statusText = "매니저연락바람"; break;
		    }
	%>
		<tr>
			<td><%= i + 1 %></td>
			<td><%= rdto.getName() %></td>
			<td><%= rdto.getGroupname() %></td>
			<td><%= rdto.getClassname() %></td>
			<td><%= rdto.getattendate() %></td>
			<td><%= rdto.getIntime() != null ? new java.text.SimpleDateFormat("HH:mm:ss").format(rdto.getIntime()) : "" %></td>
			<td><%= rdto.getOuttime() != null ? new java.text.SimpleDateFormat("HH:mm:ss").format(rdto.getOuttime()) : "" %></td>
			<td><%= rdto.getRecordtime() %> 분</td>
			<td><%= statusText %></td>
			<td><%= rdto.getCurrate() %>%</td>
			<td><%= rdto.getEntirate() %>%</td>
		</tr>
	<%
		}
	}
	%>
</tbody>
</table>
<div style="margin-top: 10px;">
	총 <%= totalCount %>명
</div>
		</div>
	</div>
</section>
<%@include file = "../header/footer.jsp" %>
</body>
</html>