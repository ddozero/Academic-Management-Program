<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.board.*" %>

<%
TBoardDAO bdao = TBoardDAO.getInstance();

MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
if (mdto == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "/semi2_AcademicManage/server/index.jsp";
    </script>
<%
    return;
}

int midx = mdto.getMidx();
int idx = mdto.getIdx();
System.out.println("넘어온 midx: " + midx);
System.out.println("넘어온 idx: " + idx);
String name = mdto.getName();

String classname = bdao.findClassNameByIdx(idx);

String role = (midx == 2) ? "학생" : (midx == 3) ? "강사" : "";
String fullName = name + " (" + role + ")";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
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
th {
    text-align: left;
    padding: 8px;
    background-color: #f1f1f1;
    width: 120px;
}
td {
    padding: 8px;
}
textarea {
    width: 100%;
    height: 200px;
    resize: none;
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
</style>
</head>
<%
String title = request.getParameter("title");
String ref = request.getParameter("ref");
String lev = request.getParameter("lev");
String sunbun = request.getParameter("sunbun");
%>
<body>
<div class = "all-title1">
  <h1>강좌 자유 게시판</h1>
</div>

 <section class= "all-section1">
  	<%@include file="../header/teacherHeader.jsp"%>
  	
	<article>
		<h2>자유게시판 답글쓰기</h2>
		<form name = "tBoardComment" action="tBoardComment_ok.jsp" method="post" enctype="multipart/form-data">
		<input type = "hidden" name = "ref" value = "<%=ref%>">
		<input type = "hidden" name = "lev" value = "<%=lev%>">
		<input type = "hidden" name = "sunbun" value = "<%=sunbun%>">
		
		<h2>답글쓰기 등록</h2>
   		 <p>글 작성 시에는 비방 또는 글 도배를 삼가해주시길 바랍니다.</p>
   		 
        <table>
            <tr>
                <th>제목</th>
                <td colspan="3"><input type="text" name="title" value = "RE: <%=title%>" required></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>
                    <input type="text" value="<%= fullName %>" readonly>
                    <input type="hidden" name="name" value="<%= name %>">
                </td>
                <th>비밀번호</th>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td><input type="date" name="writedate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required></td>
                <th>첨부파일</th>
                <td><input type="file" name="fileaddr"></td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td colspan="3">
                    <select name="category" required>
                        <option value="" disabled <%= (role.equals("")) ? "selected" : "" %>>카테고리를 선택해주세요</option>
                        <option value="학생" <%= (role.equals("학생") ? "selected" : "") %>>학생</option>
                        <option value="강사" <%= (role.equals("강사") ? "selected" : "") %>>강사</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <textarea name="content" placeholder="내용을 입력하세요." required></textarea>
                </td>
            </tr>
        </table>
        
        <div class="button-area">
            <input type="submit" value="답글 등록하기">
            <input type="reset" value="재작성">
            <input type="button" value="취소하기" onclick="location.href='tBoardList.jsp'">
        </div>
    </form>
    <div>
</section>

<%@include file="../header/footer.jsp"%>
</body>
</html>