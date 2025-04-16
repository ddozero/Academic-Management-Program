<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.group.*" %>
    
<%
	AGroupDAO gdao = new AGroupDAO();
	String gidx_s = request.getParameter("gidx");
	int gidx = Integer.parseInt(gidx_s);
	
	int result = gdao.deleteGroup(gidx);
	
	String msg = result > 0 ? "삭제되었습니다." : "실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="addGroup.jsp";
</script>
	