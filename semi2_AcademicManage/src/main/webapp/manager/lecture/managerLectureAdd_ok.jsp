<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ldto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:setProperty property ="*" name = "ldto"/>
<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>


<%
int result = mldao.managerLectureAdd(ldto);

String msg = result>0?"강좌 등록에 성공하였습니다.":"강좌 등록에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
location.href='managerLectureAdd.jsp';
</script>