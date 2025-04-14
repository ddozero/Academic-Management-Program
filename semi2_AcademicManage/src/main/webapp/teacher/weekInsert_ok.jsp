<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />
<jsp:useBean id="dto" class="com.semi2.lecture.ManagerLectureDTO" />

<%
request.setCharacterEncoding("utf-8");

// 📌 입력 파라미터 수신
int classidx = Integer.parseInt(request.getParameter("classidx"));
int weeknum = Integer.parseInt(request.getParameter("weeknum"));
String weekname = request.getParameter("weekname");
String weekcon = request.getParameter("weekcon");
String weekperiod = request.getParameter("weekperiod"); // varchar 타입 그대로 사용

//DTO 설정
dto.setClassidx(classidx);
dto.setWeeknum(weeknum);
dto.setWeekname(weekname);
dto.setWeekcon(weekcon);
dto.setWeekperiod(weekperiod);

//DB 등록 요청
int result = mldao.insertLectureWeek(dto);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>세부 강좌 등록 결과</title>
</head>
<body>
<script>
<% if (result > 0) { %>
    alert("세부 강좌가 성공적으로 등록되었습니다.");
    window.opener.location.reload();  // 부모창 새로고침
    window.close();                   // 현재 팝업 닫기
<% } else { %>
    alert("등록에 실패했습니다. 다시 시도해주세요.");
    history.back();
<% } %>
</script>
</body>
</html>
