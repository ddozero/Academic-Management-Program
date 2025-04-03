<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="mdto"/>
    <jsp:useBean id="mdao" class="com.semi2.member.MemberDAO"></jsp:useBean>
<%
	int result = mdao.memberJoin(mdto);

	String msg = result > 0 ? "회원가입되셨습니다.":"회원가입에 실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	window.self.close();
</script>