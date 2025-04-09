<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="../css/mainLayout3.css">
	<script>
		function click1(){
			location.href="memberJoin.jsp?mem=0";
		}
		function click2(){
			location.href="memberJoin.jsp?mem=1";
		}
	</script>
</head>
<body>
<%@include file="/header/serverHeader.jsp"%>
<section>
	<article>
		<input type="button" value="회원가입" onclick="click1()">
		<input type="button" value="회원가입" onclick="click2()">
	</article>
</section>
<%@include file="/header/footer.jsp"%>
</body>
</html>
