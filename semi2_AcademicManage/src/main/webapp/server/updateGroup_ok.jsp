<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@page import="java.util.ArrayList"%>
    <%@page import="com.semi2.group.*" %>
    <%@page import="com.semi2.member.*" %>
    <jsp:useBean id="gdto" class="com.semi2.group.GroupDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="gdto"/>
    <jsp:useBean id="gdao" class="com.semi2.group.AGroupDAO"></jsp:useBean>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	int result = gdao.updateGroup(gdto);

	String msg = result > 0 ? "수정되었습니다." : "실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href="addGroup.jsp?gidx=0";
</script>