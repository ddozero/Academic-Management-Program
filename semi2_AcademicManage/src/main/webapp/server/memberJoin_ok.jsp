<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.semi2.member.*" %>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="mdto"/>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	String appro_s = request.getParameter("appro");
	int appro = Integer.parseInt(appro_s);

	int result = mdao.memberJoin(mdto);
	String msg = result > 0 ? "회원가입되셨습니다.":"회원가입에 실패하였습니다.";
	if(appro==0){
%>
<script>
	window.alert('<%=msg%>');
	location.href='index.jsp';
	window.self.close();
</script>
<%
	}else{
%>
<script>
	window.alert('<%=msg%>');
	location.href='/semi2_AcademicManage/server/addManager.jsp?sort=4';
	window.self.close();
</script>		
<%	
	}
%>