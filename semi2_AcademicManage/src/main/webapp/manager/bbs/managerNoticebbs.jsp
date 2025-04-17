<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.table-info td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}

/* 검색창 디자인 */
.se-Find {
    float: right; 
    margin: 10px 0; 
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

.total-count p{
	margin-bottom : 0px;
	font-size: 14px;
	color : #666;
	margin-top:15px;
}
</style>
</head>

<%
int totalCount = 0;
//if (arr != null) {
//	totalCount = arr.size();
//} else {
//	totalCount = 0; 
//}
%>
<body>
<%@include file="/header/managerHeader.jsp"%>


 <div class = "all-title1">
  	<h2>공지사항</h2>
  </div>
  <section class= "all-section1">

  <article>
		<form class="se-Find" name="lectureFind" method="post" action="managerNoticebbs.jsp">
			<select class = "se-select" name = "fkey">
				<option value = "">전체</option>
				<option value = "title">제목</option>
				<option value = "tname">작성자</option>
			</select>
			<input class = "setxt" type="text" name = "fvalue">
			<input class = "sebt" type="submit" value="검색">
		</form>

		<div class = "total-count">
			<p>총 : <%=totalCount %>개</p>
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
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
			</tbody>
		</table>
  </article>
  </section>


<%@include file="/header/footer.jsp"%>
</body>
</html>