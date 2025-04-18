<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.test.*" %>
<jsp:useBean id="tDAO" class="com.semi2.test.TTestDAO" />
<jsp:useBean id="dto" class="com.semi2.test.TestDTO" />

<%
request.setCharacterEncoding("utf-8");

int classidx = Integer.parseInt(request.getParameter("classidx"));
int numidx = Integer.parseInt(request.getParameter("numidx"));
String exam = request.getParameter("exam");
String rightanswer = request.getParameter("rightanswer").trim().toLowerCase();
int score = Integer.parseInt(request.getParameter("score"));

// DTO에 데이터 설정
dto.setClassidx(classidx);
dto.setNumidx(numidx);
dto.setExam(exam);
dto.setRightanswer(rightanswer);
dto.setScore(score);

// INSERT 수행
int result = tDAO.insertTest(dto);
%>

<script>
<% if (result > 0) { %>
    alert("시험 문제가 정상적으로 등록되었습니다.");
<% } else { %>
    alert("등록 실패했습니다.");
<% } %>
location.href = "tTestManagement.jsp?classidx=<%=classidx%>";
</script>