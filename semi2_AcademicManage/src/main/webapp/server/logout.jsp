<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("/semi2_AcademicManage/server/login.jsp");
%>
<script>
	window.alert('ss');
	location.href='/semi2_AcademicManage';
</script>






