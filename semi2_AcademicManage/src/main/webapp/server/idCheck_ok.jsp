<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.member.*" %>
<jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	boolean result = mdao.idCheck(id);
	if(result){
%>
		<script>
			window.alert('이미 사용중인 ID입니다.');
			location.href="idCheck.jsp";
		</script>
<%
	}else{
%>
		<script>
			window.alert('<%=id%>는 가능한 아이디입니다.');
			opener.document.mj.id.value = '<%=id%>';
			window.self.close();
		</script>
<%
	}
%>