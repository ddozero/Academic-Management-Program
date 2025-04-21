<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.semi2.member.*" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="bdto" class="com.semi2.board.BoardDTO"></jsp:useBean> 
<jsp:useBean id="mbdao" class="com.semi2.board.MBoardDAO" scope="session"></jsp:useBean>

<%
MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");

bdto.setMidx(mdto.getMidx());
bdto.setIdx(mdto.getIdx());
bdto.setName(mdto.getName());

String category = request.getParameter("category");
System.out.println("category: " + category); // 디버깅용

bdto.setTitle(request.getParameter("title"));
bdto.setContent(request.getParameter("content"));
bdto.setCategory(request.getParameter("category"));
bdto.setPwd(request.getParameter("pwd"));



String categoryUrl = (category != null && category.equals("공지사항")) 
                     ? "mNoticeBoardList.jsp" 
                     : "mJobBoardList.jsp";

int result = mbdao.mBoardWrite(bdto);
String msg = result>0?"글이 등록되었습니다.":"글이 등록되지 않았습니다.";
%>

<script>
    alert('<%= msg %>');
    location.href = '<%= categoryUrl %>';
</script>