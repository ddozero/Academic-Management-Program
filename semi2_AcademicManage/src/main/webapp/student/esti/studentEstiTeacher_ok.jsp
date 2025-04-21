<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	String estinum_s=request.getParameter("esti");
	String esticon=request.getParameter("esti2");
	
	
	int estinum=Integer.parseInt(estinum_s);
	
	int result=sldao.studentEstiTeacher(classidx, mdto.getIdx(), estinum, esticon);
	String msg=null;
	
	msg=result>0?"제출이 완료되었습니다.":"제출을 실패하였습니다.";
	
%>

<script>
	window.alert('<%=msg%>');
	location.href='studentEstiTeacher.jsp';
	
</script>