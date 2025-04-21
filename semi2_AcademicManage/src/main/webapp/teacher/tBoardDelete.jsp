<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.semi2.board.*" %>
<%@ page import="com.semi2.member.*" %>

<%
    int boardidx = Integer.parseInt(request.getParameter("boardidx"));
    MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");

    if (mdto == null) {
%>
    <script>
        alert("로그인 후 삭제할 수 있습니다.");
        location.href = "/semi2_AcademicManage/server/index.jsp";
    </script>
<%
        return;
    }

    // 로그인된 사용자의 정보
    String loggedInName = mdto.getName();  // 로그인된 사용자의 이름
    int midx = mdto.getMidx();  // 로그인된 사용자의 ID

    // 게시물 삭제 처리
    TBoardDAO bdao = TBoardDAO.getInstance();
    boolean deleteResult = bdao.deletePost(boardidx, midx, loggedInName);

    if (deleteResult) {
%>
    <script>
        alert("게시물이 삭제되었습니다.");
        location.href = "tBoardList.jsp";  // 삭제 후 게시물 목록으로 리다이렉트
    </script>
<%
    } else {
%>
    <script>
        alert("삭제 권한이 없습니다.");
        history.back();
    </script>
<%
    }
%>