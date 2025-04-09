<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="mdao" class="com.semi2.member.MemberDAO" />

<%
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String saveid = request.getParameter("saveid");
	

	int result = mdao.loginCheck(userid,userpwd);
	
	if(result==mdao.NOT_ID){
		%>
			<script>
				window.alert('등록되지 않은 아이디입니다.');
				location.href="login.jsp";
			</script>
		<%
	}
	else if(result==mdao.NOT_PWD){
		%>
		<script>
			window.alert('비밀번호가 일치하지 않습니다.');
			location.href="login.jsp";
		</script>
	<%
	}

	else if(result==mdao.LOGIN_OK){
		MemberDTO mdto2 = mdao.getUserInfo(userid);
		
		   session.setAttribute("sid", userid);
		   session.setAttribute("smdto", mdto2);
		   %>
		   		<script>
		   			window.alert('<%=mdto2.getName()%>님 환영합니다.');
		   			location.href='serverMain.jsp';
		   		</script>
		   <%
	}
	else if(result==mdao.ERROR){
		   out.println("고객센터 연락바람");
	}

	%>
