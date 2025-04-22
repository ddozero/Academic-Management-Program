<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.board.*" %>
<%@ page import = "com.semi2.member.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SYS Academy</title>
    <link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">

    <style>

.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 15px;
    text-align: left;
    
}

.table-info-header th {
    background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
    width : auto;
}

.table-info td {
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
    height : 30px;
    width : auto;
}

.table-info td a {
    text-decoration: none;
    color: inherit; /* 기존 색상 유지 */
}

.table-info td a:hover {
    color: #567AF0; /* 호버 시 원하는 색상 지정 */
}


.table-info td form input[type="submit"]{
	background: #fff;
	color: #777777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}

.table-info td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}

.all-section-board{
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
        .btn-write {
            float: right;
            margin: 10px 0;
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
        .board-pagenum {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 20px;
        }
        .board-pagenum a {
            text-decoration: none;
            font-size: 14px;
            color: #333;
            padding: 5px 10px;
            background-color: #fff;
            cursor: pointer;
        }
        .board-pagenum a:hover {
            color: #567AF0;
        }

        }
    </style>
</head>
<body>

<div class="all-title1">
    <h2>강좌 공지사항</h2>
</div>

<section class="all-section-board">
    <%@ include file="../header/teacherHeader.jsp" %>

    <%
        int listSize = 15; // 한 페이지에 보이는 글의 수
        String cp_s = request.getParameter("cp");
        if (cp_s == null || cp_s.equals("")) {
            cp_s = "1"; // 기본값 1페이지
        }
        int cp = Integer.parseInt(cp_s);

        // TBoardDAO 인스턴스를 통해 글 목록을 가져옵니다.
        TBoardDAO bdao = TBoardDAO.getInstance();
        List<BoardDTO> list = bdao.getBoardList(cp, listSize);
    %>

    <table class="table-info">
			<thead class="table-info-header">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>첨부파일</th>
            <th>조회수</th>
        </tr>
        </thead>

        <%
            for (BoardDTO dto : list) {
        %>
        <tr>
            <td><%= dto.getBoardidx() %></td>
            <td style="text-align:left;">
    <% for (int z = 0; z < dto.getLev(); z++) { out.print("&nbsp;&nbsp;"); } %>
    <a href="tBoardContent.jsp?boardidx=<%=dto.getBoardidx()%>"><%= dto.getTitle() %></a>
</td>
            <td><%= dto.getName() %></td>
            <td><%= dto.getWritedate() != null ? dto.getWritedate().toString() : "" %></td>
            <td><%= (dto.getFileaddr() != null && !dto.getFileaddr().trim().equals("")) ? "O" : "X" %></td>
            <td><%= dto.getReadnum() %></td>
        </tr>
        <% } %>
    </table>

    <div class="button-area">
        <input type="button" value="글쓰기" onclick="location.href='tBoardWrite.jsp'">
    </div>

    <%-- 페이징 처리 --%>
    <div class="board-pagenum">
        <%
            int totalCnt = bdao.getTotalCnt();
            int totalPage = (totalCnt / listSize) + 1;
            if (totalCnt % listSize == 0) totalPage--;
        %>
        <% if (cp > 1) { %>
            <a href="tBoardList.jsp?cp=<%= cp - 1 %>">&lt;&lt; 이전</a>
        <% } %>

        <% for (int i = 1; i <= totalPage; i++) { %>
            <a href="tBoardList.jsp?cp=<%= i %>"><%= i %></a>
        <% } %>

        <% if (cp < totalPage) { %>
            <a href="tBoardList.jsp?cp=<%= cp + 1 %>">다음 &gt;&gt;</a>
        <% } %>
    </div>

</section>

<%@ include file="../header/footer.jsp" %>

</body>
</html>