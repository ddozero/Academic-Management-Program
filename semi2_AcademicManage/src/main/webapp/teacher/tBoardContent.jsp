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

.all-section-board{
	margin-left: 320px;
  background-color: #ffffff;
  padding: 20px 40px;
  border-radius: 10px;
  max-width: calc(100% - 360px);
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
  overflow-y: auto;
  flex: 1;
  height: auto;
  height : 700px;
  margin-bottom : 100px;
}

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
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
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
    background-color: #567AF0; 
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
  <h2>강좌 자유게시판 상세 보기</h2>
</div>

<section class="all-section-board">
    <%@ include file="../header/teacherHeader.jsp" %>

        <table class="table-add">
            <tr>
                <th class="header-style">번호</th>
                <td class="cell-data"><%= bdto.getBoardidx() %></td>
                <th class="header-style">작성일</th>
                <td class="cell-data"><%= bdto.getWritedate() %></td>
            </tr>
            <tr>
                <th class="header-style">작성자</th>
                <td class="cell-data"><%= bdto.getName() %></td>
                <th class="header-style">조회수</th>
                <td class="cell-data"><%= bdto.getReadnum() %></td>
            </tr>
            <tr>
                <th class="header-style">제목</th>
                <td class="cell-data" colspan="3"><%= bdto.getTitle() %></td>
            </tr>
             <tr>
                <th class="header-style">첨부파일</th>
    <td class="cell-data" colspan="3">
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
                <th class="header-style">내용</th>
                <td class="cell-data" colspan="3" class="content-area"  style = "height : 400px; vertical-align: top;"><%= bdto.getContent() %></td>
            </tr>
        </table>

        <div class="button-box">
            <a href="tBoardList.jsp">목록으로</a>
            <a href="tBoardComment.jsp?title=<%= bdto.getTitle() %>&ref=<%= bdto.getRef() %>&lev=<%= bdto.getLev() %>&sunbun=<%= bdto.getSunbun() %>">답글쓰기</a>
			<a href="tBoardEdit.jsp?boardidx=<%= bdto.getBoardidx() %>">수정</a>
			<a href="tBoardDelete.jsp?boardidx=<%= bdto.getBoardidx() %>">삭제</a>

        </div>

    <%@ include file="../header/footer.jsp" %>
</section>
</body>
</html>