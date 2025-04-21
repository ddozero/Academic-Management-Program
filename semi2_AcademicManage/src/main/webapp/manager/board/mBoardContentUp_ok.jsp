<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="com.semi2.member.*" %>
<%
request.setCharacterEncoding("UTF-8");
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

System.out.println("title: " + bdto.getTitle());
System.out.println("content: " + bdto.getContent());
System.out.println("category: " + bdto.getCategory());
System.out.println("pwd: " + bdto.getPwd());
System.out.println("boardidx: " + bdto.getBoardidx());

String boardidx_s = request.getParameter("boardidx");
int boardidx = boardidx_s != null && !boardidx_s.equals("") ? Integer.parseInt(boardidx_s) : 0;
bdto.setBoardidx(boardidx);

String categoryUrl = (category != null && category.equals("공지사항")) 
                     ? "mNoticeBoardList.jsp" 
                     : "mJobBoardList.jsp";

int result = mbdao.mboardContentUp(bdto);
String msg = result > 0 ? "수정 완료 되었습니다." : "다시 입력해주세요.";
%>

<script>
    alert('<%= msg %>');
    location.href = '<%= categoryUrl %>';
</script>