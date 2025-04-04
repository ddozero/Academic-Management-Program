<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="mdao" class="com.semi2.member.MemberDAO" />

<%
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String saveid = request.getParameter("saveid");
	
	MemberDTO mdto=new MemberDTO();
	mdto.setId(userid);
	mdto.setPwd(userpwd);
	System.out.println(mdto.getId()+"/"+mdto.getPwd());
	int result = mdao.loginCheck(mdto.getId(),mdto.getPwd());
	
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
		System.out.println(userid);
		System.out.println(mdto2.getIdx());
		System.out.println(mdto2.getMidx());
		System.out.println(mdto2.getName());
		System.out.println(userid);
		   session.setAttribute("sid", userid);
		   session.setAttribute("sidx", mdto2.getIdx());
		   session.setAttribute("smidx", mdto2.getMidx());
		   session.setAttribute("sbane", mdto2.getName());
		   %>
		   		<script>
		   			window.alert('<%=mdto2.getName()%>님 환영합니다.');
		   			location.href='main.jsp';
		   		</script>
		   <%
	}
	else if(result==mdao.ERROR){
		   out.println("고객센터 연락바람");
	}

	%>
