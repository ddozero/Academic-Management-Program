<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
    

<jsp:useBean id="ldto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto"/>
<jsp:useBean id="ldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>

<%
int result = ldao.managerLectureUp(ldto);
String msg = result>0?"수정 완료 되었습니다":"수정에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>')
location.href='/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp'
</script>