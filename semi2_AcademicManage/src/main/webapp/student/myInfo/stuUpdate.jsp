<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
%>
    <%@ page import="com.semi2.member.*" %>
    <jsp:useBean id="smdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="smdto"/>
	<jsp:useBean id="smdao" class="com.semi2.member.SMemberDAO"></jsp:useBean>
	
<%
	System.out.println("내가 0이라는거야?"+smdto.getIdx());
	int result = smdao.memberUpdate(smdto);

	String msg = result > 0 ? "수정되었습니다." : "실패";
%>
	<script>
	window.alert('<%=msg%>');
	location.href="studentMyinfo.jsp";
	</script>