<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.test.*" %>
<jsp:useBean id="tDAO" class="com.semi2.test.TTestDAO" />

<%
request.setCharacterEncoding("utf-8");
int testidx = Integer.parseInt(request.getParameter("testidx"));
int classidx = Integer.parseInt(request.getParameter("classidx"));

int result = tDAO.deleteTest(testidx);
%>

<script>
<% if (result > 0) { %>
    alert("시험 문제가 정상적으로 삭제되었습니다.");
<% } else { %>
    alert("삭제 실패했습니다.");
<% } %>
location.href = "tTestManagement.jsp?classidx=<%=classidx%>";
</script>