<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO" scope="session" />
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.semi2.member.MemberDAO" />

<%
	System.out.println("왜 안돼");
	int result = mdao.loginCheck(mdto);
	System.out.println("왜 안돼"+result);
	if(result == 3){
/* 		session.setAttribute("id", mdto.getId());
		session.setAttribute("name", mdto.getName());
		session.setAttribute("idx", mdto.getIdx());
		session.setAttribute("midx", mdto.getMidx()); */

		String ctx = request.getContextPath();

		switch(mdto.getMidx()){
			case 1:
				response.sendRedirect(ctx + "/server/main.jsp"); break;
			case 2:
				response.sendRedirect(ctx + "/manager/main.jsp"); break;
			case 3:
				response.sendRedirect(ctx + "/teacher/main.jsp"); break;
			case 4:
				response.sendRedirect(ctx + "/student/main.jsp");

		}
		return;
	}

	switch(result){
		case 1:
%>
	<script>
		alert("등록되어 있지 않은 아이디입니다.");
		location.href = "login.jsp";
	</script>
<%
			break;
		case 2:
%>
	<script>
		alert("비밀번호가 틀립니다.");
		location.href = "login.jsp";
	</script>
<%
			break;
		default:
%>
	<script>
		alert("오류가 발생했습니다. 고객센터에 문의하세요.");
		location.href = "login.jsp";
	</script>
<%
	}
%>
