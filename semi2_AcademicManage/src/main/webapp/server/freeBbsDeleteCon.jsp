<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.board.*" %>
    <jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
<%
	String boardidx_s = request.getParameter("boardidx");
	int boardidx = Integer.parseInt(boardidx_s);
	
	int result = bdao.deleteCon(boardidx);
	String msg = result > 0 ? "삭제되었습니다.":"실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="freeBbsList.jsp";
</script>