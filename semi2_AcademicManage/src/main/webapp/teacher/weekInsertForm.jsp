<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />

<%
request.setCharacterEncoding("utf-8");
int classidx = Integer.parseInt(request.getParameter("classidx"));
ArrayList<Integer> usedWeeks = mldao.getUsedWeekNums(classidx); // ✅ 이미 등록된 주차들
int entireWeekCount = mldao.getCalculatedWeekCount(classidx);   // ✅ 전체 등록 가능 주차수 계산
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>세부 강좌 등록</title>
<style>
body {
	font-family: sans-serif;
	padding: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th {
	text-align: left;
	background-color: #f4f4f4;
	padding: 8px;
	width: 20%;
}

td {
	padding: 8px;
}

.input-box {
	width: 95%;
	padding: 6px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn-group {
	text-align: center;
}

.btn {
	margin: 5px;
	padding: 8px 20px;
	border: none;
	border-radius: 4px;
	background-color: #567AF0;
	color: white;
	cursor: pointer;
}

.btn:hover {
	background-color: #3457c0;
}
</style>
</head>
<body>
<h2>세부 강좌 등록</h2>
<form method="post" action="weekInsert_ok.jsp">
  <input type="hidden" name="classidx" value="<%=classidx%>">
  <table>
    <tr>
      <th>주차</th>
      <td>
        <select name="weeknum" class="input-box">
        <% for (int i = 1; i <= entireWeekCount; i++) {
             if (!usedWeeks.contains(i)) { %>
              <option value="<%=i%>"><%=i%>주차</option>
        <%   } } %>
        </select>
      </td>
    </tr>
    <tr>
      <th>주차명</th>
      <td><input type="text" name="weekname" class="input-box" required></td>
    </tr>
    <tr>
      <th>주차 내용</th>
      <td><textarea name="weekcon" class="input-box" rows="5" required></textarea></td>
    </tr>
    <tr>
      <th>상세 기간</th>
      <td><input type="text" name="weekperiod" class="input-box" required></td>
    </tr>
  </table>
  <div class="btn-group">
    <input type="submit" class="btn" value="등록">
    <input type="reset" class="btn" value="재작성">
    <input type="button" class="btn" value="닫기" onclick="window.close();">
  </div>
</form>
</body>
</html>