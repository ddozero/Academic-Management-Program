<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="smdao" class="com.semi2.member.SMemberDAO"></jsp:useBean>
<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);	
	
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int result=smdao.studentAddLecture(classidx,mdto.getIdx());//매개변수 2는 임의의값
	
	String msg=result>0?"신청이 완료되었습니다.":"신청이 실패했습니다.";

%>

<script>
	window.alert('<%=msg%>');
	window.self.close();
	opener.location.href='studentMyLecture.jsp';
</script>