<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.record.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
 

<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class = "com.semi2.record.MRecordDAO"></jsp:useBean>

<%
int result = rdao.recordTimeUp(rdto);
String msg = result>0?"근무시간이 변경되었습니다.":"근무시간을 다시 확인해주세요.";

System.out.println("RecordDTO 값: " + rdto.toString());
%>

<script>
window.alert('<%=msg%>')
window.opener.location.reload(); 

window.self.close();
</script>