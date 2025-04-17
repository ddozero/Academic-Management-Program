<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />

<%
request.setCharacterEncoding("utf-8");
int classidx = Integer.parseInt(request.getParameter("classidx"));
int weeknum = Integer.parseInt(request.getParameter("weeknum"));

int result = mldao.deleteWeekByNum(classidx, weeknum);
%>
<script>
<% if (result > 0) { %>
    alert("해당 주차 정보가 삭제되었습니다.");
<% } else { %>
    alert("삭제 실패했습니다.");
<% } %>
location.href = "teacherLectureList.jsp";
</script>
