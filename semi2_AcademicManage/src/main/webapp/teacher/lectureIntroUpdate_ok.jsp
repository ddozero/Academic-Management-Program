<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />
<jsp:useBean id="dto" class="com.semi2.lecture.ManagerLectureDTO" />

<%
request.setCharacterEncoding("utf-8");

int classidx = Integer.parseInt(request.getParameter("classidx"));
String classintro = request.getParameter("classintro");

dto.setClassidx(classidx);
dto.setClassintro(classintro);

int result = mldao.updateClassIntro(dto);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>강좌 개요 수정 결과</title>
</head>
<body>
<script>
<% if (result > 0) { %>
    alert("강좌 개요가 성공적으로 수정되었습니다.");
    location.href = "teacherLectureList.jsp";
<% } else { %>
    alert("수정에 실패했습니다. 다시 시도해주세요.");
    history.back();
<% } %>
</script>
</body>
</html>