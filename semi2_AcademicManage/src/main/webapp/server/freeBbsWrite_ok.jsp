<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
    <%@page import="com.semi2.board.*" %>
    <jsp:useBean id="bdto" class="com.semi2.board.BoardDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="bdto"/>
    <jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
<%
	int result = bdao.bbsWrite(bdto);
	String msg = result > 0 ? "등록되었습니다.":"실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="freeBbsList.jsp";
</script>