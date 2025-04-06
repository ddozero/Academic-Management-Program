<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
   

<%@ page import = "com.semi2.lecture.*"%>
<jsp:useBean id="mldto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mldto"/>
<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>

<%
int classidx = Integer.parseInt(request.getParameter("classidx"));
int result = mldao.managerLectureDel(classidx);

String msg = result>0? "삭제가 완료되었습니다.":"삭제에 실패하였습니다.";

%>
<script>
window.alert('<%=msg %>')
location.href='/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp';
</script>