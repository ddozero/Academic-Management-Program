<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.test.*" %>
<jsp:useBean id="stdao" class="com.semi2.test.STestDAO"></jsp:useBean>
<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
<%@include file="/header/studentHeader.jsp" %>
<div class = "all-title1">
<h2>문제 풀기</h2>
</div>
<section class="all-section1">
<article>
	<%
	ArrayList<TestDTO> arr=stdao.studentShowExam2(classidx);
	if(arr==null||arr.size()==0){
	%>
	<h2>현재 등록된 문제가 존재하지 않습니다.</h2>
	<%	
	}else{
	%>
	<form name=fm action="studentTest_ok.jsp">
	<%
		for(int i=0;i<arr.size();i++){
	%>
	<ul>
		<li>문제<%=arr.get(i).getNum() %>) <%=arr.get(i).getExam() %></li>
	
		<li>답:<input type="text" name="answer<%=arr.get(i).getNum() %>" ></li>
	</ul>
	<input type="hidden" name="testidx<%=arr.get(i).getNum() %>" value="<%=arr.get(i).getTestidx() %>">
	<%
		}
	%>
	
	<input type="hidden" name="count" value="<%=arr.size() %>">
	<input type="hidden" name="classidx" value="<%=classidx %>">
	<input type="submit" value="제출하기">
	</form>
	<%
	}
	
	
	%>
</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>