<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.record.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>

<%
String status_s = request.getParameter("status");
String recordidx_s = request.getParameter("recordidx");
String groupidx_s = request.getParameter("groupidx");
String attendate_s = request.getParameter("attendate");

if (status_s != null && !status_s.equals("") && !"null".equals(status_s)) {
    rdto.setStatus(Integer.parseInt(status_s));
}

if (recordidx_s != null && !recordidx_s.equals("") & !"null".equals(recordidx_s)) {
    rdto.setRecordidx(Integer.parseInt(recordidx_s));
}

if (groupidx_s != null && !groupidx_s.equals("") & !"null".equals(groupidx_s)) {
    rdto.setGroupidx(Integer.parseInt(groupidx_s));
}

java.sql.Date attendate = null;
String attendateUrl = "";
if (attendate_s != null && !attendate_s.equals("") & !"null".equals(attendate_s)) {
    attendate = java.sql.Date.valueOf(attendate_s);
    rdto.setattendate(attendate);
    attendateUrl = attendate.toString();
}

int result = rdao.lectureStatusUp(rdto);
String msg = result > 0 ? "출결 상태가 변경되었습니다." : "다시 확인해주세요.";
%>

<script>
window.alert('<%=msg%>');
location.href='/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp?groupidx=<%=groupidx_s %>&attendate=<%=attendateUrl%>';
</script>
