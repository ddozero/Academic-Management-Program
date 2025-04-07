<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<%
MemberDTO smdto=(MemberDTO)session.getAttribute("smdto");
%>
<body>

<%@ include file="/header/serverHeader.jsp" %>

	<h1><%=  smdto.getId()%>님, 메인 페이지에 오신 걸 환영합니다.</h1>
	<a href="logout.jsp">로그아웃</a>

</body>
</html>
