<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
		
	String savepath=request.getRealPath("/recordimg");
	
	int filesize=1024*1024*10;

	MultipartRequest mr= new MultipartRequest(request,savepath,filesize,"utf-8");
	String issuedivi=mr.getParameter("issuedivi");

	
	int result=srdao.studentSubmitAbs(mr, mdto.getIdx(), issuedivi);
	String msg=result>0?"제출에 성공하였습니다.":"제출에 실패하였습니다.";
	
	
	
	
%>

<script>

	window.alert('<%=msg%>');
	location.href='studentSubmitAbsence.jsp';
	
</script>