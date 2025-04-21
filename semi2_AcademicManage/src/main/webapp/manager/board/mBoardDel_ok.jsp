<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.lecture.*" %>
<jsp:useBean id = "mbdto" class = "com.semi2.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="com.semi2.board.MBoardDAO"></jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");
%>

<%
int boardidx = Integer.parseInt(request.getParameter("boardidx"));
int result = mbdao.mboardDel(boardidx);

String category = request.getParameter("category");

if (category == null || category.trim().isEmpty()) {
    category = "공지사항"; // 기본값 설정
}

System.out.println("category: " + category); // 디버깅용

String msg = result>0? "삭제가 완료되었습니다.":"다시 확인해주세요.";

String categoryUrl = (category != null && category.equals("공지사항")) ? "mNoticeBoardList.jsp" : "mJobBoardList.jsp";

%>

<script>
    alert('<%= msg %>');
    location.href = '<%= categoryUrl %>';
</script>
   