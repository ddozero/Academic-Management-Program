<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.semi2.board.*" %>
<jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>

<%
	String boardidx_s = request.getParameter("boardidx");
	int boardidx = Integer.parseInt(boardidx_s);
	
	String pwd = request.getParameter("pwd");
	
	BoardDTO bdto = bdao.bbsContent(boardidx);
	
	if(pwd.equals(bdto.getPwd())){
		%>
		<script>
			window.close();
			window.alert('일치합니다.')
			opener.location.href = "freeBbsReWrite.jsp?boardidx=<%=boardidx%>"
		</script>
		<%
	}else{
		%>
		<script>
			window.alert('일치하지 않습니다.');
			location.href="freeBbsPwd.jsp?boardidx=<%=boardidx%>";
		</script>
		<%
	}
%>
