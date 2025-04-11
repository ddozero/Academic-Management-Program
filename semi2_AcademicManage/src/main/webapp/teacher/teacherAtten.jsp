<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.semi2.record.*"%>
<%@ page import="com.semi2.member.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
String id = "teacher";
int midx = 3;
int idx = 3;

TMemberDAO mtdao = new TMemberDAO();
MemberDTO mdto = mtdao.getTeacherInfo(id, midx);
String name = mdto.getName();
TRecordDAO rdao = new TRecordDAO();
RecordDTO rdto = new RecordDTO();
rdao.getClassByName(rdto, name);
int classidx = rdto.getClassidx();
String classname = rdto.getClassname();
ArrayList<RecordDTO> arrdto = rdao.recordShow();
SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>강사 출퇴근 관리</title>
<link rel="stylesheet" type="text/css"
	href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.clock-box {
	background-color: #e4ecff;
	padding: 20px 30px;
	border-radius: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border: 1px solid #c7d9ff;
	margin-bottom: 30px;
	flex-wrap: wrap;
}

.clock-box .time {
	font-size: 16px;
}

.btn-box {
	display: flex;
	gap: 10px;
}

.btn {
	background-color: #356ae6;
	color: #fff;
	padding: 10px 24px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 15px;
	transition: background-color 0.2s ease;
}

.btn:hover {
	background-color: #2d5bd0;
}

.record-box h3 {
	font-size: 16px;
	margin-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 12px;
	text-align: center;
	font-size: 14px;
}

th {
	background-color: #f5f5f5;
}
</style>
<script>
    function noticeTime() {
      var now = new Date();

      var y = now.getFullYear();
      var mo = now.getMonth() + 1;
      var d = now.getDate();
      var h = now.getHours();
      var mi = now.getMinutes();
      var s = now.getSeconds();
      var str = y + '년 ' + mo + '월 ' + d + '일 ' + h + '시 ' + mi + '분 ' + s + '초';

      var timer = document.getElementById('timer');
      if (timer) {
        timer.innerHTML = str;
      }

      setTimeout(noticeTime, 1000);
    }
  </script>
</head>

<body onload="noticeTime()">
	<%@ include file="../header/teacherHeader.jsp"%>

	<div class="all-title1">
		<h2><%= mdto.getName() %>
			강사님 출/퇴근 관리
		</h2>
	</div>
	<section class="all-section1">
		<div class="clock-box">
			<div class="time">
				현재 시간: <span id="timer"></span>
			</div>
			<div class="btn-box">
				<!-- 출근 버튼 -->
				<form action="teacherAtten_ok.jsp" method="post">
					<input type="hidden" name="midx" value="<%= midx %>"> <input
						type="hidden" name="idx" value="<%= idx %>"> <input
						type="hidden" name="classidx" value="<%= classidx %>"> <input
						type="hidden" name="name" value="<%= name %>">
					<button class="btn" type="submit" name="action" value="in">출근</button>
				</form>

				<!-- 퇴근 버튼 -->
				<form action="teacherAtten_ok.jsp" method="post">
					<input type="hidden" name="midx" value="<%= midx %>"> <input
						type="hidden" name="idx" value="<%= idx %>"> <input
						type="hidden" name="classidx" value="<%= classidx %>"> <input
						type="hidden" name="name" value="<%= name %>">
					<button class="btn" type="submit" name="action" value="out">퇴근</button>
				</form>
			</div>
		</div>
		<div class="record-box">
			<h3>입퇴실 기록</h3>
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>담당강좌명</th>
						<th>날짜</th>
						<th>출근</th>
						<th>퇴근</th>
						<th>총 근무시간</th>
						<th>구분</th>
					</tr>
				</thead>
				<tbody>
					<% if (arrdto != null && !arrdto.isEmpty()) {
       for (int i = 0; i < arrdto.size(); i++) {
           RecordDTO r2dto = arrdto.get(i);
           String statusText;
           switch (r2dto.getStatus()) {
               case 1: statusText = "출근"; break;
               case 5: statusText = "결근"; break;
               default: statusText = "기타";
           }
  %>
					<tr>
						<td><%= i + 1 %></td>
						<td><%= rdto.getClassname() %></td>
						<td><%= r2dto.getattendate() %></td>
						<td><%= (r2dto.getIntime() != null) ? sdfDateTime.format(r2dto.getIntime()) : "-" %></td>
						<td><%= (r2dto.getOuttime() != null) ? sdfDateTime.format(r2dto.getOuttime()) : "-" %></td>
						<td><%= r2dto.getRecordtime() %>분</td>
						<td><%= statusText %></td>
					</tr>
					<%   }
     } else { %>
					<tr>
						<td colspan="7">출퇴근 기록이 없습니다.</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</section>
	<%@ include file="../header/footer.jsp"%>
</body>
</html>
