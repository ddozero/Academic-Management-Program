<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi2.board.*" %>
	<%@page import="java.util.ArrayList"%>
	<jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
<%
	MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
	int midx = mdto.getMidx();
	int idx = mdto.getIdx();
	System.out.println("세션에 등록된 midx는 "+midx);
	System.out.println("세션에 등록된 idx는 "+idx);
%>
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
select, input[type="text"] {
	padding : 6px;
	border : 1px solid #D8D8D8;
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
</style>
<script>
	function moveWrite(){
		location.href="freeBbsWrite.jsp";
	}
</script>
<title>Insert title here</title>
</head>
<%
	
	
	int totalCnt = bdao.getTotalCnt();
	int listSize = 5;
	int pageSize = 5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")) cp_s = "1";
	int cp = Integer.parseInt(cp_s);
	
	int totalPage = (int)Math.ceil((double)totalCnt / listSize);
	
	int userGroup = cp / pageSize;
	if(cp % pageSize == 0) userGroup--;
	
	ArrayList<BoardDTO> arr = bdao.bbsList(cp, listSize);

	BoardDTO bdto = new BoardDTO();
%>
<body>
<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>자유 게시판</h2>
	</div>
	<section class="all-section-ac">
		<article>
			<div class="inner">
				<div class="top">
					<div class="left">
						<input type="button" value="글쓰기" onclick="moveWrite()">
					</div>
					<div class="right">
						<select>
							<option>구분</option>
						</select>
						<input type="text">
						<input type="button" value="검색">
					</div>
				</div>

				<table class="table-info">
					<thead class="table-info-header">
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
			        <tbody>
			        	<%
			        			if(arr==null || arr.size()==0){
			        				%>
            			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
			        				<%
			        			}else{
					        		for(int i = 0; i < arr.size(); i++){
					        			bdto = arr.get(i);
			        				%>
		            	<tr>
			                <td><%=bdto.getBoardidx() %></td>
			                <td>
			                <%
			                	for(int z = 0; z < bdto.getLev(); z++){
		                	%>
			                	    &nbsp;&nbsp;
		                	<%
			                	    }
			                	if(midx==bdto.getMidx() || idx==bdto.getIdx() || midx==1){
			                		%>
			                	<a href="freeBbsContent.jsp?boardidx=<%=bdto.getBoardidx() %>"><%=bdto.getTitle() %></a>
			                		<%
			                	}else{
			                		switch(bdto.getMidx()){
			                		case 1: 
			                			%>
			                			<strong>관리자만 열람이 가능한 글입니다.</strong>
			                			<%break;
			                		case 2:
			                			%>
			                			<strong>학생만 열람이 가능한 글입니다.</strong>
			                			<%break;
			                		case 3:
			                			%>
			                			<strong>강사만 열람이 가능한 글입니다.</strong>
			                			<%break;
			                		case 4:
			                			%>
			                			<strong>매니저만 열람이 가능한 글입니다.</strong>
			                			<%
			                		}
			                	}
		                	%>
			                </td>
			                <td><%=bdto.getName() %></td>
			                <td><%=bdto.getWritedate() %></td>
			                <td><%=bdto.getReadnum() %></td>
		            	</tr>
			        				<%
			        			}
			        		}
			        	%>
					</tbody>
			        <tfoot>
			            <tr>
			                <td colspan="5" style="text-align: center;">
			                <%
			                    if(userGroup != 0){
			                %>
			                    <a href="freeBbsList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
			                <%
			                    }
			
			                    for(int i = userGroup * pageSize + 1; i <= userGroup * pageSize + pageSize; i++){
			                        if(i > totalPage) break;
			                        if(i == cp){
			                %>
			                        <strong>[<%= i %>]</strong>
			                <%
			                        } else {
			                %>
			                        <a href="freeBbsList.jsp?cp=<%= i %>">[<%= i %>]</a>
			                <%
			                        }
			                    }
			
			                    int totalGroup = (int)Math.ceil((double)totalPage / pageSize);
			                    if(userGroup < totalGroup - 1){
			                %>
			                    <a href="bbsList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
			                <%
			                    }
			                %>
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