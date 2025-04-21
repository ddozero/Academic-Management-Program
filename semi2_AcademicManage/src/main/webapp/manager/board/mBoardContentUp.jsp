<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.board.*" %>


<jsp:useBean id="bdao" class="com.semi2.board.MBoardDAO" scope="session"></jsp:useBean>
<jsp:useBean id="bdto" class="com.semi2.board.BoardDTO"></jsp:useBean> 
<%
request.setCharacterEncoding("utf-8");
%>

<%
//글작성자 이름 세션에서 가져오기
MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");
int midx = mdto.getMidx();
int idx = mdto.getIdx();
String writerName = mdto.getName();
%>

<%

String boardidx_s = request.getParameter("boardidx");
if(boardidx_s==null||boardidx_s.equals("")){
	boardidx_s="0";
}
int boardidx = Integer.parseInt(boardidx_s);

BoardDTO dto = bdao.mboardContent(boardidx);

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
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
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

/* Textarea 스타일 */
.textarea-custom {
    width: 100%; 
    height: 100%; 
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

.content-bt{
    background: #eeeeee;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 60px;
    height: 28px;
    font-size:14px;
    cursor: pointer;
    float : left;
    margin-top: 30px;
    margin-right: 5px;
}

.content-bt-list{
    background: #eee;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 60px;
    height: 28px;
    font-size:14px;
    cursor: pointer;
    float : right;
    margin-top: 30px;
    margin-right: 5px;
}

</style>
</head>

<script>
	function mBoardList(){
		location.href="mNoticeBoardList.jsp";
	}
</script>

<body>
<%@include file="/header/managerHeader.jsp"%>

 <div class = "all-title1">
  <h2>공지사항 글쓰기</h2>
  </div>
  
  
  <section class= "all-section-board">
  	<article>
  		<form name = "mBoardContentUp" action = "mBoardContentUp_ok.jsp" method="post">
		<input type="hidden" name="boardidx" value="<%=dto.getBoardidx()%>">
  		<input type="hidden" name = "midx" value = "<%=midx %>">
  		<input type="hidden" name = "idx" value = "<%=idx %>">
  		<input type="hidden" name="category" value="<%=dto.getCategory()%>">
  		<table class = "table-add">
  			<tr>
  				<th class="header-style">작성자</th>
  				<td class="cell-data"><input type="text" name="name" value="<%=writerName %>" readonly></td>
  				<th class="header-style">비밀번호</th>
  				<td class="cell-data"><input type="password" name="pwd" value="<%=dto.getPwd()%>"></td>
  				<th class="header-style">카테고리</th>
  				<td class="cell-data">
  					<select class = "se-select" name = "category">
  						<option value = "공지사항"<%= "공지사항".equals(dto.getCategory()) ? "selected" : "" %>>공지사항</option> 
  						<option value = "취업공고"<%= "취업공고".equals(dto.getCategory()) ? "selected" : "" %>>취업공고</option> 
  					</select>	
  				</td>
  			</tr>
  			
  			<tr>
  			</tr>
  		
  			<tr>
  				<th class="header-style">제목</th>
  				<td colspan = "5" class="cell-data"><input type="text" name = "title" size ="50" value="<%=dto.getTitle()%>"></td>
  			</tr>
  			
  			<tr>
  				<td colspan = "6" class="cell-data"  style = "height : 400px;">
  				<textarea class= "textarea-custom" rows = "8" cols ="45" name="content" ><%=dto.getContent() %></textarea>
  			</tr>
  		</table> 		
  			
				<div>
 					<input class = "content-bt" type="submit" value="등록">
  					<input class = "content-bt" type="reset" value="초기화">
  					<%
  						String category = bdto.getCategory();
	  					if (category == null || category.equals("")){ 
	  					    category = "공지사항"; // 기본 카테고리 설정
	  					}
  						String categoryUrl = category.equals("공지사항")?"mNoticeBoardList.jsp" : "mJobBoardList.jsp";
  					%>
  					<input class = "content-bt-list" type="button" value ="목록" onclick = "location.href='<%= categoryUrl %>'">
 				</div>
  		
  		</form>
  	</article>
  </section>

<%@include file="/header/footer.jsp"%>


</body>
</html>