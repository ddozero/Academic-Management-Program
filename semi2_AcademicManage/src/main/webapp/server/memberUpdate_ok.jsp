<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
<jsp:setProperty name="mdto" property="name"/>
<jsp:setProperty name="mdto" property="sex"/>
<jsp:setProperty name="mdto" property="birth"/>
<jsp:setProperty name="mdto" property="addr"/>
<jsp:setProperty name="mdto" property="tel"/>
<jsp:setProperty name="mdto" property="email"/>
<jsp:setProperty name="mdto" property="career"/>
<jsp:setProperty name="mdto" property="groupname"/>
<jsp:setProperty name="mdto" property="memo"/>
<jsp:setProperty name="mdto" property="idx"/>

<jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO" ></jsp:useBean>

<%
    int result = mdao.memUpdate(mdto);
	String  msg = result > 0 ? "정보가 수정되었습니다." : "실패되었습니다." ;

    if(result > 0){
%>
        <script>
            alert("<%=msg%>");
            location.href = "addManager.jsp?sort=4&idx=<%=mdto.getIdx()%>";
        </script>
<%
    } else {
%>
        <script>
            alert("<%=msg%>");
            location.href = "addManager.jsp?sort=4";
        </script>
<%
    }
%>
