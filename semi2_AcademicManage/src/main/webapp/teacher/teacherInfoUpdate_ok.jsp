<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*"%>
<%@ page import="java.sql.Date"%>
<%
request.setCharacterEncoding("UTF-8");
System.out.println("teacherInfoUpdate_ok.jsp 진입");
%>

<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO" />
<jsp:setProperty name="mdto" property="idx" />
<jsp:setProperty name="mdto" property="edu2" />
<jsp:setProperty name="mdto" property="career" />
<jsp:setProperty name="mdto" property="memo" />
<jsp:useBean id="mdao" class="com.semi2.member.TMemberDAO" />

<%
String comingdateStr = request.getParameter("comingdate");
System.out.println("입력받은 날짜: " + comingdateStr);

if (comingdateStr != null && !comingdateStr.trim().isEmpty()) {
	try {
		java.sql.Date sqlDate = java.sql.Date.valueOf(comingdateStr);
		mdto.setComingdate(sqlDate);
		System.out.println("Date 변환 성공: " + sqlDate);
	} catch (Exception e) {
		System.out.println("Date 변환 실패: " + comingdateStr);
		mdto.setComingdate(null);
	}
}

int result = -1;
try {
	result = mdao.updateTeacherInfo(mdto);
	System.out.println("DAO 실행 결과: " + result);
} catch (Exception e) {
	System.out.println("DAO 오류 발생");
	e.printStackTrace();
}

String msg = (result > 0) ? "회원정보 수정 완료" : "회원정보 수정 오류";
%>
<script>
window.alert('<%=msg%>');
	location.href = 'teacherInfo.jsp';
</script>
