<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
textarea {
    width: 100%;
    height: 300px;
    padding: 10px;
    box-sizing: border-box;  /* padding과 border가 포함된 크기로 설정 */
}

</style>
<script>
	function moveList(){
		location.href="freeBbsList.jsp";
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>자유 게시판</h2>
	</div>
	<section class="all-section-ac">
		<article>
			<div class="table-inner">
				<form action="freeBbsWrite_ok.jsp" method="post">
					<table class="table-info">
						<thead class="table-info-header">
							<tr>
								<th>제목</th>
								<td colspan="3"><input type="text" name="title"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="name"></td>
								<th>비밀번호</th>
								<td><input type="password" name="pwd"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">
									<textarea name="content"></textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>
								  <input type="checkbox" name="secret" id="check" value="0">비밀글
								  <span id="targetArea"></span>
								</td>
								
								<script>
								  document.getElementById("check").addEventListener("change", function () {
								    const target = document.getElementById("targetArea");
								
								    if (this.checked) {
  								      const select = document.createElement("select");
									this.value = this.checked ? "1" : "0";
  								      select.name = "membersort";
								      select.innerHTML = `
								        <option value="1">선택</option>
								        <option value="2">학생</option>
								        <option value="3">강사</option>
								        <option value="4">매니저</option>
								      `;
								      target.appendChild(select); 
								    } else {
								      target.innerHTML = "";
								    }
								  });
								</script>
								<td colspan="3" style="text-align:right;">
									<input type="submit" value="등록하기">
									<input type="button" value="목록보기" onclick="moveList()">
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</article>
	</section>
<%@ include file="/header/footer.jsp" %>
</body>
</html>