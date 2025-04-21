<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.board.*" %>
<%@ page import = "com.semi2.member.*" %>
<jsp:useBean id="mbdao" class="com.semi2.board.MBoardDAO" scope="session"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");
%>
<%
	MemberDTO dto2=(MemberDTO)session.getAttribute("smdto");
	int midx = dto2.getMidx();
%>


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
    margin: 8px 0;
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
	height : 650px;
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	margin-bottom : 100px;
}

/* 검색창 디자인 */
.board-hd {
    display: flex; 
    align-items: center; 
    justify-content: space-between;
    margin-top:10px;
}

.se-find {
    margin: 0; /* 불필요한 간격 제거 */
}

.total-count {
    margin: 0; /* 같은 라인에 맞춰 간격 제거 */
    font-size: 14px;
    color: #666;
    float : left;
}

form[name="lectureFind"] {
    float: right;
}

.sebt{ 
    background: #d8d8d8;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}

.search-button:hover {
    color: #567AF0;
}

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 80px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}


.se-select:focus { 
    outline: none; 
}

.setxt{ 
	width : 200px;
	height : 28px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 5pxl=l
}

.baard-bottom {
    display: flex;
    justify-content: center; 
    align-items: center; 
    width: 100%;
    margin-top: 20px;

    
}

/* 글쓰기 버튼 */
.write-bt{
    background: #567AF0;
    color: #fff;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 60px;
    height: 28px;
    font-size:14px;
    cursor: pointer;
    float : right;
    margin : 0px;
}

/* 페이징*/

.board-pagenum {
    display: flex; 
	text-align:center;
}


.board-pagenum a{
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



</style>
</head>

<%
//총 게시물수
int totalCnt = mbdao.mboardTotalcnt("공지사항");

//보여줄 리스트수 
int listSize = 1;

//보여줄 페이지 수 (하단 출력 페이지 리스트)
int pageSize = 5;

//사용자의 현재 위치
String cp_s = request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//총 페이지 수(페이지 리스트)
int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup = cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>



<body>
<%
	if(midx==1){
		%>
<%@include file="/header/serverHeader.jsp" %>
		<%
	}else if(midx==4){
		%>
<%@include file="/header/managerHeader.jsp"%>
		<%
	}
%>


 <div class = "all-title1">
  	<h2>공지사항</h2>
  </div>
  <section class= "all-section-board">

  <article>
  	<div class = "board-hd">
			<div class = "total-count">
				<p>Total  <%=totalCnt %></p>
			</div>
  		<div class = "se-find">
		<form name="lectureFind" method="post" action="managerNoticebbs.jsp">
			<select class = "se-select" name = "fkey">
				<option value = "">전체</option>
				<option value = "title">제목</option>
				<option value = "tname">작성자</option>
			</select>
			<input class = "setxt" type="text" name = "fvalue">
			<input class = "sebt" type="submit" value="검색">
		</form>
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
				ArrayList<BoardDTO> arr = mbdao.mNoticeBoardList("공지사항", cp, listSize);
				if(arr==null||arr.size()==0){
				%>					
				<tr>
					<td colspan="5" align="center"> 등록된 게시물이 없습니다. </td>
				</tr>
				<tr>
				<%
				}else{
					for(int i =0; i<arr.size(); i++){
				%>
					<td><%=arr.get(i).getBoardidx() %></td>
					<td>
					<%
					for(int z = 0; z<arr.get(i).getLev(); z++){
						out.println("&nbsp;&nbsp;");
					}
					%>
					<a href ="mBoardContent.jsp?boardidx=<%=arr.get(i).getBoardidx()%>"><%=arr.get(i).getTitle() %></a></td>
					<td><%=arr.get(i).getName() %></td>
					<td><%=arr.get(i).getWritedate() %>
					<td><%=arr.get(i).getReadnum() %></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
			
		</table>
		
			<div class = "baard-bottom">
				<span class = "board-pagenum" style = "width : 200px;">
				<%
				if(userGroup!=0){
				%>
					<a href="mNoticeBoardList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a>
				<%
				}
				%>
				
				<% /** 페이지 번호 출력 */
				for(int i =(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
					%>&nbsp;&nbsp;<a href="mNoticeBoardList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
					if(i==totalPage){
						break;
					}
				}
				%>
				
				<%
				if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
					%>
					<a href = "mNoticeBoardList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
					<%
				}
				%>
				</span>
			</div>
				
				<span>
				<a href ="mBoardWrite.jsp">
				<input class = "write-bt" type= "button" value = "글쓰기"></a>
				</span>
  </article>
  </section>


<%@include file="/header/footer.jsp"%>
</body>
</html>