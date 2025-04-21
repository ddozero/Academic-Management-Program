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
    BoardDTO bdto = bdao.getBoardContent(boardidx);

    MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");
    if (mdto == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "/semi2_AcademicManage/server/index.jsp";
    </script>
<%
        return;
    }

    String loginName = mdto.getName();
    int midx = mdto.getMidx();
    int idx = mdto.getIdx();

    if (!loginName.equals(bdto.getName())) {
%>
    <script>
        alert("작성자만 수정할 수 있습니다.");
        history.back();
    </script>
<%
        return;
    }

    String role = (midx == 2) ? "학생" : (midx == 3) ? "강사" : "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
h2 {
    font-size: 24px;
    color: #333;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}
th, td {
    padding: 8px;
    border: 1px solid #ddd;
}
textarea {
    width: 100%;
    height: 200px;
    resize: none;
}
input[type="text"], input[type="password"], input[type="date"], input[type="file"] {
    width: 95%;
    padding: 6px;
    box-sizing: border-box;
}
.button-area {
    text-align: right;
    margin-top: 20px;
}
.button-area input {
    padding: 8px 16px;
    border: none;
    background-color: #4A90E2;
    color: white;
    border-radius: 4px;
    cursor: pointer;
}
.button-area input:hover {
    background-color: #357ABD;
}
</style>
</head>
<body>
<div class="all-title1">
  <h1>게시글 수정</h1>
</div>

<section class="all-section1">
<%@ include file="../header/teacherHeader.jsp" %>

<form action="tBoardEdit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="boardidx" value="<%= boardidx %>">
    <input type="hidden" name="midx" value="<%= midx %>">
    <input type="hidden" name="idx" value="<%= idx %>">
    <input type="hidden" name="name" value="<%= loginName %>">

    <table>
        <tr>
            <th>제목</th>
            <td colspan="3"><input type="text" name="title" value="<%= bdto.getTitle() %>" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%= loginName %></td>
            <th>비밀번호</th>
            <td><input type="password" name="pwd" required></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%= bdto.getWritedate() %></td>
            <th>첨부파일</th>
            <td><input type="file" name="fileaddr"> 기존파일: <%= bdto.getFileaddr() == null ? "없음" : bdto.getFileaddr() %></td>
        </tr>
        <tr>
            <th>카테고리</th>
            <td><%= bdto.getCategory() %></td>
        </tr>
        <tr>
            <td colspan="4">
                <textarea name="content" required><%= bdto.getContent() %></textarea>
            </td>
        </tr>
    </table>

    <div class="button-area">
        <input type="submit" value="수정 완료">
        <input type="button" value="취소" onclick="location.href='tBoardList.jsp'">
    </div>
</form>

</section>
<%@ include file="../header/footer.jsp" %>
</body>
</html>