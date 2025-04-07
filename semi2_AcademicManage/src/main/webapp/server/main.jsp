<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%
//String name = (String)session.getAttribute("sname");
//Integer midx = (Integer)session.getAttribute("smidx");
MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
String name=mdto.getName();
Integer midx=mdto.getMidx();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
	<style>
		body{
			background-color:#E9ECF4;
			padding-top:100px;
		}
		div{
			background-color:#ffffff;
		}
	</style>
</head>
<body>
<%
	if(midx==1){
%>
		<%@ include file="/header/serverHeader.jsp" %>
<%
	}else if(midx==2){
%>
		<%@ include file="/header/studentHeader.jsp" %>
<%
	}else if(midx==3){
%>
		<%@ include file="/header/teacherHeader.jsp" %>
<%
	}else if(midx==4){
%>
		<%@ include file="/header/managerHeader.jsp" %>
<%
	}
%>
<section>
	<article>
		<h2><%=  name%>님, 메인 페이지에 오신 걸 환영합니다.</h2>
		<div>
		</div>
	</article>
</section>
</body>
</html>
