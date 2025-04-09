<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	int result = mdao.managerDelete(idx);
	String msg = result > 0 ? "삭제되었습니다." : "실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	location.href="addManager.jsp?sort=4&idx=1";
</script>