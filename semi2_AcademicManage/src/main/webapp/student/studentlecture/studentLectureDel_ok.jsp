<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<jsp:useBean id="smdao" class="com.semi2.member.SMemberDAO"></jsp:useBean>
<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);	
	
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int result=smdao.studentDelLecture(mdto.getIdx());
	int result2=smdao.studentDelLecture2(classidx);
	String msg=null;
	
	if(result>0&&result2>0){
		msg="취소가 완료되었습니다.";
	}else if(result<=0||result2<=0){
		msg="취소가 실패했습니다. 관리자에게 문의해주세요";
	}

%>

<script>
	window.alert('<%=msg%>');
	window.self.close();
	opener.location.href='studentMyLecture.jsp';
	
</script>