<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.semi2.member.*" %>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="mdto"/>
    <jsp:useBean id="mdao" class="com.semi2.member.MemberDAO"></jsp:useBean>
    <jsp:useBean id="smdao" class="com.semi2.member.SmanagerDAO"></jsp:useBean>
<%
	/* int result = mdao.memberJoin(mdto) + smdao.managerInfoAdd(mdto.getIdx()); */
	int result = mdao.memberJoin(mdto);
	String msg = result > 0 ? "회원가입되셨습니다.":"회원가입에 실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	location.href='login.jsp';
	window.self.close();
</script>