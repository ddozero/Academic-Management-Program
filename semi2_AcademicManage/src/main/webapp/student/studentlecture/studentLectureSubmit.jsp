<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO" ></jsp:useBean>
<jsp:useBean id="ldto" class="com.semi2.lecture.LectureDTO"></jsp:useBean>

<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);	
	ldto=sldao.lectureDetail(classidx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
  /* ul 스타일 수정 */
    ul.lecture-details {
        list-style-type: none;
        padding: 0;
        margin: 0;
        font-family: Arial, sans-serif;
    }

    ul.lecture-details li {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        border-bottom: 1px solid #ddd;
        margin-bottom: 10px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    ul.lecture-details li span {
        font-weight: bold;
        color: #333;
    }

    ul.lecture-details li p {
        margin: 0;
        color: #555;
    }
	.title {
	  
	  font-size: 15px;
	  color : #333333;
	}
   
</style>
</head>
<body>
<h2 class="title"> 선택하신 강의를 신청하시겠습니까? </h2>
<br>

<form name="fm" action="studentLectureSubmit_ok.jsp">
<ul class="lecture-details">
	<input type="hidden" name="classidx" value="<%=ldto.getClassidx() %>">
	<li>강좌번호:<%=ldto.getClassidx() %></li>
	<li>강좌명:<%=ldto.getClassname() %></li>
	<li>강사:<%=ldto.getTname() %></li>
	<li>개강일:<%=ldto.getComingdate() %></li>
	<li>종강일:<%=ldto.getEnddate() %></li>
	<li>총수강일:<%=ldto.getEntiredate() %></li>
</ul>
<div style="text-align:center;">
<input type="submit" value="신청">
<input type="button" value="닫기" onclick="window.self.close()">
</div>
</form>
</body>
</html>