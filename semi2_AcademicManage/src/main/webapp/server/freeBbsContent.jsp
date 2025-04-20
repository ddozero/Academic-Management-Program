<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.board.*" %>
    <jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
    text-align: left;
}


.table-info-header th {
    background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
}

.table-info td {
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
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
button {
	background-color : #B5C6FF;
	border : none;
	padding : 2px 6px;
	border-radius : 20px;
}
select, input[type="text"],input[type="password"] {
	padding : 6px;
	border : 1px solid #fff;
	border-radius : 4px;
}
.top {
	overflow : hidden;
	margin-bottom : 10px;
}
.left {
	float: left;
}
.right{
	float: right;
}
.left button {
	margin-left: 6px;
}
.right select,
.right input,
.right button {
	margin-left: 6px;
}
   .all-section-ac {
	margin-left: 320px; 
	margin-bottom: 10px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 1000px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
}
    textarea {
        width: 100%;
        height: 300px;
        padding: 10px;
        box-sizing: border-box;  /* padding과 border가 포함된 크기로 설정 */
    }
    input[type="submit"],input[type="button"] {
    background-color: #4c6ef5;
    color: white;
    padding: 5px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}
</style>
<script>
	function movePwd(bidx){
		window.open("freeBbsPwd.jsp?boardidx="+bidx,"freeBbsPwd","width=420px,height=250px");
	}
	function bbsList(){
		location.href="freeBbsList.jsp";
	}
	function deleteCon(bidx){
		location.href="freeBbsDeleteCon.jsp?boardidx="+bidx;
	}
</script>
<title>Insert title here</title>
</head>
<%
	int boardidx = Integer.parseInt(request.getParameter("boardidx"));
	bdao.updateReadnum(boardidx);
	BoardDTO bdto = bdao.bbsContent(boardidx);
%>
<body>
<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>자유 게시판</h2>
	</div>
	<section class="all-section-ac">
		<article>
				<div class="table-inner">
	          <table class="table-info">
	            <thead class="table-info-header">
		              <tr>
		                <th>제목</th>
		                <td colspan="3"><input type="text" name="name" readonly value="<%=bdto.getTitle() %>"></td>
		              </tr>
	              </thead>
	              <tbody>
	              	<tr>
	              	<td colspan="4">
	              	<textarea readonly ><%=bdto.getContent() %></textarea>
	              	</td>
	              	</tr>
	              </tbody>
	              <tfoot>
	              	<tr>
	              		<td colspan="4" style="text-align:right;">
	              			<input type="button" value="삭제하기" onclick="deleteCon(<%=bdto.getBoardidx()%>)">
	              			<input type="button" value="수정하기" onclick="movePwd(<%=bdto.getBoardidx()%>)">
	              			<input type="button" value="목록" onclick="bbsList()">
	              		</td>
	              	</tr>
	              </tfoot>
	              </table>
	              </div>
		</article>
	</section>
<%@ include file="/header/footer.jsp" %>
</body>
</html>