<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.member.*"%>
<%
	MemberDAO mdao = new MemberDAO();

	String idx_s = request.getParameter("idx");
	System.out.println("idx_s는"+idx_s);
	int idx = Integer.parseInt(idx_s);
	System.out.println("idx는"+idx);
	int result = mdao.updateAcc(idx);
	if(result==1){
%>
	<script>
		window.alert('승인처리 되었습니다.');
		location.href='memberAccept.jsp';
	</script>
<%		
	}else{
%>
	<script>
		window.alert('승인처리 실패하였습니다.');
		location.href='memberAccept.jsp';
	</script>			
<%
	}
%>