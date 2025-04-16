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
	String boardidx_s = request.getParameter("boardidx");
	int boardidx = Integer.parseInt(boardidx_s);

	int result = bdao.bbsReWrite(bdto, boardidx);
	String msg = result > 0 ? "수정되었습니다.":"실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="freeBbsContent.jsp?boardidx=<%=boardidx%>";
</script>