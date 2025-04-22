<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.board.*" %>

<%
    TBoardDAO bdao = TBoardDAO.getInstance();

    // 세션에서 로그인된 사용자 정보 가져오기
    MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");

    // 세션에 로그인 정보가 없으면 로그인 페이지로 리디렉션
    if (mdto == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "/semi2_AcademicManage/server/index.jsp"; // 로그인 페이지로 이동
    </script>
<%
        return;
    }

    // 세션에서 midx, idx 값 추출
    int midx = mdto.getMidx();
    int idx = mdto.getIdx();

    // 디버깅을 위해 출력
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
<div class = "all-title1">
  <h1>강좌 자유 게시판</h1>
</div>

 <section class= "all-section-tbwrite">
  	<%@include file="../header/teacherHeader.jsp"%> 
  	
    <form name="noticeForm" action="tBoardWrite_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="midx" value="<%=midx%>">
    <input type="hidden" name="idx" value="<%=idx%>">
    <input type="hidden" name="name" value="<%= name %>">
    
    <h2>게시판 글 등록</h2>
    <p class = "p2">게시판 글 작성 시에는 비방 또는 글 도배를 삼가해주시길 바랍니다.</p>
    
        <table class = "table-add">
            <tr>
                <th class="header-style">제목</th>
                <td td colspan="3" class="cell-data"><input type="text" name="title" required></td>
            </tr>
            <tr>
               <th class="header-style">작성자</th>
               <td class="cell-data">
                    <input type="text" value="<%= fullName %>" readonly>
                    <input type="hidden" name="name" value="<%= name %>">
                </td>
                <th class="header-style">비밀번호</th>
                <td class="cell-data"><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <th class="header-style">작성일</th>
                <td class="cell-data"><input type="date" name="writedate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required></td>
                <th class="header-style">첨부파일</th>
                <td class="cell-data"><input type="file" name="fileaddr"></td>
            </tr>
            <tr>
                <th class="header-style">카테고리</th>
                <td colspan="3" class="cell-data">
                    <select name="category" required>
                        <option value="" disabled <%= (role.equals("")) ? "selected" : "" %>>카테고리를 선택해주세요</option>
                        <option value="학생" <%= (role.equals("학생") ? "selected" : "") %>>학생</option>
                        <option value="강사" <%= (role.equals("강사") ? "selected" : "") %>>강사</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="cell-data">
                    <textarea class="textarea-custom" name="content" placeholder="내용을 입력하세요." required></textarea>
                </td>
            </tr>
        </table>
        
        <div class="button-area">
            <input type="submit" value="등록하기">
            <input type="reset" value="재작성">
            <input type="button" value="취소하기" onclick="location.href='tBoardList.jsp'">
        </div>
    </form>
    <div>
</section>

<%@include file="../header/footer.jsp"%>
</body>
</html>