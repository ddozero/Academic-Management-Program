<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.board.*" %>


<jsp:useBean id="bdao" class="com.semi2.board.MBoardDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>

<%

String boardidx_s = request.getParameter("boardidx");
if(boardidx_s==null||boardidx_s.equals("")){
	boardidx_s="0";
}
int boardidx = Integer.parseInt(boardidx_s);

int result = bdao.getReadnum(boardidx);
BoardDTO dto = bdao.mboardContent(boardidx);

if(dto==null){
	%>
	<script>
	window.alert('잘못된 접근입니다.')
	location.href="mNoticeBoardList.jsp"
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
  <h2><%=dto.getCategory() %></h2>
  </div>
  
  
  <section class= "all-section-board">
  	<article>
  		<form name = "mBoardContentWrite">
  		<table class = "table-add">
  			
  			<tr>
  				<th class="header-style">NO</th>
  				<td class="cell-data"><%=dto.getBoardidx() %></td>
  				<th class="header-style">카테고리</th>
  				<td class="cell-data"><%=dto.getCategory() %></td>
  			</tr>
  			
  			<tr>
  			 	<th class="header-style">작성자</th>
  				<td class="cell-data"><%=dto.getName() %></td>
  				<th class="header-style">조회수</th>
  				<td class="cell-data"><%=dto.getReadnum() %></td>	
  			</tr>
  		
  			<tr>
  				<th class="header-style">제목</th>
  				<td class="cell-data" colspan = "3"><%=dto.getTitle() %></td>
  			</tr>
  			
  			<tr>
  				<td colspan = "6" class="cell-data"  style = "height : 400px; vertical-align: top;">
  				<%=dto.getContent().replaceAll("\n","<br>") %></td>
  			</tr>
  		</table> 		
  	</form>
  				<div>
  				<form name = "mboardContentUp" action = "mBoardContentUp.jsp" style="display:inline;">
  					<input type = "hidden" name = "boardidx" value="<%=dto.getBoardidx() %>">
  					<input class = "content-bt" type="submit" value="수정">
  				</form>
  				
  				<form name = "mboardContentDel" action = "mBoardDel_ok.jsp" style="display:inline;">
  					<input type = "hidden" name = "boardidx" value="<%=dto.getBoardidx() %>">
  					<input type = "hidden" name = "category" value="<%=dto.getCategory() %>">
  					<input class = "content-bt" type="submit" value="삭제">
  				</form>
  					<%
  						String category = dto.getCategory();
  						String categoryUrl = category.equals("공지사항")?"mNoticeBoardList.jsp" : "mJobBoardList.jsp";
  					%>
  					<input class = "content-bt-list" type="button" value ="목록" onclick = "location.href='<%= categoryUrl %>'">
 				</div>
  	</article>
  </section>

<%@include file="/header/footer.jsp"%>


</body>
</html>