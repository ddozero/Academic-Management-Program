<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="msdao" class="com.semi2.member.TstudentDAO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String memo = request.getParameter("memo");
String idx_s = request.getParameter("idx");
int idx = 0;
int result = 0;

try {
    idx = Integer.parseInt(idx_s);
    result = msdao.updateStudentMemo(idx, memo);
    System.out.println("[tStudentMemoUpdate_ok.jsp] idx: " + idx);
    System.out.println("[tStudentMemoUpdate_ok.jsp] memo: " + memo);
} catch(Exception e) {
    System.out.println("[tStudentMemoUpdate_ok.jsp] 예외 발생");
    e.printStackTrace();
}
%>

<script>
<% if(result > 0) { %>
    alert("메모가 성공적으로 저장되었습니다.");
    location.href = "tStudentMemo.jsp?idx=<%=idx %>";
<% } else { %>
    alert("메모 저장에 실패했습니다.");
    history.back();
<% } %>
</script>