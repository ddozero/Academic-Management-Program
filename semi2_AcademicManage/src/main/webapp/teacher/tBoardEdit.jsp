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
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>

.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
}

.header-style {
  width: 15%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
}

.cell-data {
  width : auto;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
}


input[type="text"], input[type="password"], input[type="file"], input[type="date"] {
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
.p2 {
	color:grey;
	font-size: 10px;
}

.all-section-tbwrite{
	margin-left: 320px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; /* 높이 설정 */
	height : 1000px;
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	margin-bottom : 100px;
}

input[type="text"],[type="password"],select {
  border : none;
  background-color:transparent;
  outline:none;
  width: calc(100% - 20px);
  padding: 5px;
  box-sizing: border-box;
  font-size : 15px;
}

.textarea-custom {
    width: 100%; 
    height:250px; 
    resize: none; 
    border: none; 
    padding: 10px; 
    box-sizing: border-box; 
    overflow: hidden;
    font-size: 15px; 
    vertical-align: top; 
    background-color: transparent; 
    outline: none; 
}
</style>
</head>
<body>
<div class="all-title1">
  <h1>게시글 수정</h1>
</div>

<section class= "all-section-tbwrite">
<%@ include file="../header/teacherHeader.jsp" %>

<form action="tBoardEdit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="boardidx" value="<%= boardidx %>">
    <input type="hidden" name="midx" value="<%= midx %>">
    <input type="hidden" name="idx" value="<%= idx %>">
    <input type="hidden" name="name" value="<%= loginName %>">

    <table class = "table-add">
        <tr>
            <th class="header-style">제목</th>
            <td colspan="3" class="cell-data"><input type="text" name="title" value="<%= bdto.getTitle() %>" required></td>
        </tr>
        <tr>
            <th class="header-style">작성자</th>
            <td class="cell-data"><%= loginName %></td>
            <th class="header-style">비밀번호</th>
            <td class="cell-data"><input type="password" name="pwd" required></td>
        </tr>
        <tr>
            <th class="header-style">작성일</th>
            <td class="cell-data"><%= bdto.getWritedate() %></td>
            <th class="header-style">첨부파일</th>
            <td class="cell-data"><input type="file" name="fileaddr"> 기존파일: <%= bdto.getFileaddr() == null ? "없음" : bdto.getFileaddr() %></td>
        </tr>
        <tr>
            <th class="header-style">카테고리</th>
            <td class="cell-data" colspan = "3" ><%= bdto.getCategory() %></td>
        </tr>
        <tr>
            <td colspan="4" class="cell-data">
                <textarea class="textarea-custom" name="content" required><%= bdto.getContent() %></textarea>
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