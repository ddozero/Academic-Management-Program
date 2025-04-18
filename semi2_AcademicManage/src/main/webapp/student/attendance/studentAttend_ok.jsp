<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<%
	
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	
	String num_s=request.getParameter("num");
	int num=Integer.parseInt(num_s);
	
	int result=0;
	String msg=null;
	Boolean sw=false;
	
	if(num==1){
		result=srdao.studentCheckIn(mdto,classidx);
		msg=result>0?"입실 처리되었습니다.":"입실 실패:담당 매니저에게 연락해주세요.";
		sw=true;
	}else{
		result=srdao.studentCheckOut(mdto);
		msg=result>0?"퇴실 처리되었습니다.":"퇴실 실패:담당 매니저에게 연락해주세요.";
		sw=false;
	}
	
	
%>

<script>
	window.alert('<%=msg%>');
	location.href='studentAttend.jsp';

</script>
