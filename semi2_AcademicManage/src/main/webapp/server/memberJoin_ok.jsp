<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@page import="com.semi2.member.*" %>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="mdto"/>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	System.out.println("idx "+mdto.getIdx());
	System.out.println("midx "+mdto.getMidx());
	System.out.println("name "+mdto.getName());
	System.out.println("sex "+mdto.getSex());
	System.out.println("id "+mdto.getId());
	System.out.println("pwd "+mdto.getPwd());
	System.out.println("tel "+mdto.getTel());
	System.out.println("email "+mdto.getEmail());
	System.out.println("addr "+mdto.getAddr());
	System.out.println("birth "+mdto.getBirth());
	System.out.println("appro "+mdto.getAppro());
	

	String appro_s = request.getParameter("appro");
	int appro = Integer.parseInt(appro_s);
	
	String midx_s = request.getParameter("midx");
	int midx = Integer.parseInt(midx_s);
	
	int result = mdao.memberJoin(mdto);
	
	int maxIdx = mdao.maxIdx();
	
	if(midx==3 || midx==4){
		result += mdao.addMember3(maxIdx);
	}else if(midx==2){
		result += mdao.addMember2(maxIdx);
	}
	
	
	String msg = result > 0 ? "회원가입되셨습니다.":"회원가입에 실패하였습니다.";
	if(appro==0){
%>
<script>
	window.alert('<%=msg%>');
	location.href='index.jsp';
	window.self.close();
</script>
<%
	}else{
%>
<script>
	window.alert('<%=msg%>');
	location.href='/semi2_AcademicManage/server/addManager.jsp?sort=4';
	window.self.close();
</script>		
<%	
	}
%>