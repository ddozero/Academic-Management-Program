<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.record.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>


<%
String groupidx_s = request.getParameter("groupidx");
String appro_s = request.getParameter("appro");
String issueidx_s = request.getParameter("issueidx");


if (groupidx_s == null || groupidx_s.equals("") || "null".equals(groupidx_s)){
	groupidx_s = "0";
}
if (appro_s == null || appro_s.equals("") || "null".equals(appro_s)){
	appro_s = "0";
}
if (issueidx_s == null || issueidx_s.equals("") || "null".equals(issueidx_s)){
	appro_s = "0";
}

int groupidx = Integer.parseInt(groupidx_s);
int appro = Integer.parseInt(appro_s);
int issueidx = Integer.parseInt(issueidx_s);

rdto.setGroupidx(groupidx);
rdto.setIssueidx(issueidx); 
rdto.setAppro(appro);


if (appro == 1) {
    rdto.setIssuestatus("승인");
} else {
    rdto.setIssuestatus("미승인");
}

int result = rdao.msAttendIssue(rdto);
String msg = result > 0 ? "처리되었습니다." : "다시 확인해주세요.";

%>

<script>
window.alert('<%= msg %>')
location.href = '/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp?issueidx=<%=issueidx_s%>&appro=<%=appro_s%>'
</script>