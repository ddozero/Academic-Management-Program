<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.group.*" %>
<%
	AGroupDAO gdao = new AGroupDAO();
	int result = gdao.groupJoin();
%>
<script>
	location.href="addGroup.jsp";
</script>