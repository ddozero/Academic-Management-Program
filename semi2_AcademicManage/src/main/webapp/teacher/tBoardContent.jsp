<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.board.*" %>
<%
    String boardidx_s = request.getParameter("boardidx");
    if (boardidx_s == null || boardidx_s.equals("")) {
%>
    <script>
        alert("잘못된 접근입니다.");
        history.back();
    </script>
<%
        return;
    }
    int boardidx = Integer.parseInt(boardidx_s);

    TBoardDAO bdao = TBoardDAO.getInstance();
 	
    bdao.increaseReadnum(boardidx);

    BoardDTO bdto = bdao.getBoardContent(boardidx);

    if (bdto == null) {
%>
    <script>
        alert("해당 게시글이 존재하지 않습니다.");
        history.back();
    </script>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.wrapper {
    max-width: 850px;
    margin: 40px auto;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}
h2 {
    margin-bottom: 20px;
}
.table-view {
    width: 100%;
    border-collapse: collapse;
}
.table-view th, .table-view td {
    border: 1px solid #ddd;
    padding: 10px 14px;
    vertical-align: top;
}
.table-view th {
    background-color: #f5f5f5;
    text-align: left;
    width: 120px;
}
.content-area {
    min-height: 200px;
    line-height: 1.6;
    white-space: pre-wrap;
}
.button-box {
    margin-top: 30px;
    text-align: right;
}
.button-box a {
    display: inline-block;
    background-color: #356ae6;
    color: white;
    padding: 8px 18px;
    border-radius: 5px;
    text-decoration: none;
    margin-left: 10px;
}
</style>
</head>
<body>

<div class="all-title1">
  <h2>강좌 자유 게시판</h2>
</div>

<section class="all-section1">
    <%@ include file="../header/teacherHeader.jsp" %>

    <div class="wrapper">
        <h2>게시글 상세 보기</h2>
        <table class="table-view">
            <tr>
                <th>번호</th>
                <td><%= bdto.getBoardidx() %></td>
                <th>작성일</th>
                <td><%= bdto.getWritedate() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= bdto.getName() %></td>
                <th>조회수</th>
                <td><%= bdto.getReadnum() %></td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3"><%= bdto.getTitle() %></td>
            </tr>
             <tr>
                <th>첨부파일</th>
    <td colspan="3">
        <%
            String fileaddr = bdto.getFileaddr(); // DTO에서 가져온 파일 경로
            if (fileaddr == null || fileaddr.trim().equals("")) {
        %>
            첨부파일 없음
        <%
            } else {
        %>
            <a href="files/<%= bdto.getFileaddr() %>"><%=fileaddr%></a>
        <%
            }
        %>
    </td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" class="content-area"><%= bdto.getContent() %></td>
            </tr>
        </table>

        <div class="button-box">
            <a href="tBoardList.jsp">목록으로</a>
            <a href="tBoardComment.jsp?title=<%= bdto.getTitle() %>&ref=<%= bdto.getRef() %>&lev=<%= bdto.getLev() %>&sunbun=<%= bdto.getSunbun() %>">답글쓰기</a>
			<a href="tBoardEdit.jsp?boardidx=<%= bdto.getBoardidx() %>">수정</a>
			<a href="tBoardDelete.jsp?boardidx=<%= bdto.getBoardidx() %>">삭제</a>

        </div>
    </div>

    <%@ include file="../header/footer.jsp" %>
</section>
</body>
</html>