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


.setxt{
	width : 200px;
	height : 28px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 5px;
}

.sebt{ 
    background: #567AF0;
    color: #fff;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}



.left-box, .right-box{
	display: flex;
    align-items: center;
    gap: 25px;
    flex-wrap: wrap;
}

.right-box{
	display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    align-items: center;

}

.search {
    display: flex;
    align-items: center;
    gap: 5px;
}

.search label {
    font-weight: bold; /
    font-size: 13px; 
    color: #333; 
    margin-right: 5px;
}

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 80px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}

.all-box {
   display: flex;
   justify-content: space-between;
   align-items: center;
   flex-wrap: wrap;      
   gap: 20px;
   width: 100%;            
   max-width: 1250px;      
   margin: 0 auto;
   box-sizing: border-box;
}
.table-wrap {
	overflow-x: auto;
}

.table-info {
	width: 100%;
	border-collapse: collapse;
	font-size: 15px;
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
	color: grey;
	font-size: 14px;
	text-align: left;
}

.all-section-lsatten{
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	height:550px;
  	max-height: 550px; 
  	margin-bottom: 100px

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
<section class="all-section0">
	<div class = "all-box">
	<div class = "notice">
	*특정 날짜 조회 또는 특정 이름으로 전체 검색, 전체 검색만 가능합니다.
	</div>
		<div class = "left-box">
			<form class = "search" method="get" action="LStudentAtten.jsp">
				<label>날짜</label>
				<input class = "setxt" type="date" name="attendate" value="<%=attendate_s%>">
				<input type="hidden" name="fkey" value="date">
				<input class = "sebt" type="submit" value="조회">
			</form>
		
		<div class="right-box">
				<form class = "search" method="get" action="LStudentAtten.jsp">
					<input type="hidden" name="attendate" value="<%=attendate_s%>">
					<label>검색조건</label> 
					<select class = "se-select" name="fkey" id="fkeySelect" onchange="toggleInputState()">
						<option value="all" <%="all".equals(fkey) ? "selected" : ""%>>전체</option>
						<option value="name" <%="name".equals(fkey) ? "selected" : ""%>>이름</option>
					</select> 
						<input class = "setxt" type="text" id="fvalueInput" name="fvalue" value="<%=fvalue%>" placeholder="이름을 입력해주세요"> 
						<input class = "sebt" type="submit" value="검색">
				</form>
		</div>
	</div>
</div>
</section>

<section class="all-section-lsatten">
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
</section>
<%@include file = "../header/footer.jsp" %>
</body>
</html>