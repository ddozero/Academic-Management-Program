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
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
/* 시험 문제 전체 폼 스타일 */
form[name="fm"] {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

/* 각 문제 묶음 스타일 */
form[name="fm"] ul {
  background-color: #f7f9fc;
  padding: 20px;
  border-radius: 10px;
  list-style: none;
  border: 1px solid #d8d8d8;
  margin-bottom: 10px;
}

/* 문제 번호 및 텍스트 */
form[name="fm"] ul li:first-child {
  font-weight: bold;
  margin-bottom: 10px;
  font-size: 15px;
  color: #333;
}

/* 답안 입력 필드 */
form[name="fm"] ul li input[type="text"] {
  width: 100%;
  max-width: 400px;
  height: 32px;
  padding: 6px 10px;
  font-size: 14px;
  border: 1px solid #d6d6d6;
  border-radius: 6px;
  background-color: #fff;
  color: #333;
}

form[name="fm"] ul li input[type="text"]:focus {
  outline: none;
  border-color: #567AF0;
  box-shadow: 0 0 4px rgba(86, 122, 240, 0.2);
}

/* 제출 버튼 */
form[name="fm"] input[type="submit"] {
  background-color: #567AF0;
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 10px 20px;
  font-size: 14px;
  cursor: pointer;
  align-self: flex-end;
  margin-top: 10px;
  transition: background-color 0.2s ease;
}

form[name="fm"] input[type="submit"]:hover {
  background-color: #3f5ce0;
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
		<li>문제<%=arr.get(i).getNumidx() %>) <%=arr.get(i).getExam() %></li>
	
		<li>답:<input type="text" name="answer<%=i %>" ></li>
	</ul>
	<input type="hidden" name="testidx<%=i %>" value="<%=arr.get(i).getTestidx() %>">
	<input type="hidden" name="numidx<%=i %>" value="<%=arr.get(i).getNumidx() %>">
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