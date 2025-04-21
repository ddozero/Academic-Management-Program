<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.member.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.semi2.member.MMemberDAO"></jsp:useBean>

<%
String groupidx = request.getParameter("groupidx");
String idx = request.getParameter("idx");


if(groupidx!=null && !groupidx.equals("") && idx!=null && !idx.equals("")){
	mdto.setGroupidx(Integer.parseInt(groupidx));
	mdto.setM2idx(Integer.parseInt(idx));
}

System.out.println("GroupIdx: " + groupidx); 
System.out.println("idx: " + idx); 


int result = mdao.msgroupSelect(mdto);
String msg = result>0? "반이 배정되었습니다.":"다시 확인해주세요.";

%>

<script>
window.alert('<%=msg%>')
location.href='/semi2_AcademicManage/manager/student/mstudentList.jsp'

</script>