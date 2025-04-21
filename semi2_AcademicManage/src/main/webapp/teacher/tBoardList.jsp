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
        .container {
            width: 800px;
            margin: 30px auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f1f1f1;
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

    </style>
</head>
<body>

<div class="all-title1">
    <h2>강좌 공지사항</h2>
</div>

<section class="all-section1">
    <%@ include file="../header/teacherHeader.jsp" %> 

        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>첨부파일</th>
                <th>조회수</th>
            </tr>

            <%
                TBoardDAO bdao = TBoardDAO.getInstance();
                List<BoardDTO> list = bdao.getBoardList();
                for (BoardDTO dto : list) {
            %>
            <tr>
                <td><%= dto.getBoardidx() %></td>
                <td style="text-align:left;">
                    <a href="tBoardContent.jsp?boardidx=<%=dto.getBoardidx()%>"><%= dto.getTitle() %></a>
                </td>
                <td><%= dto.getName() %></td>
                <td><%= dto.getWritedate() != null ? dto.getWritedate().toString() : "" %></td>
                <td><%= (dto.getFileaddr() != null && !dto.getFileaddr().trim().equals("")) ? "O" : "X" %></td>
                <td><%= dto.getReadnum() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <div class="button-area">
            <input type="button" value="글쓰기" onclick="location.href='tBoardWrite.jsp'">
        </div>
   
</section>

<%@ include file="../header/footer.jsp" %>

</body>
</html>