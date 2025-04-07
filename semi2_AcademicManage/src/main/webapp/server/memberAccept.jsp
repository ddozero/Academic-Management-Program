<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<meta charset="UTF-8">
<style>
	body {
		background-color : #E9ECF4;
		padding-top : 100px;
	}
	.inner {
		background-color : #ffffff;
		padding : 30px 20px;
		border-radius : 8px;
	}
	h2 {
		margin-bottom : 10px;
	}
	table {
		background-color : #EEEEEE;
		padding : 0 10px 10px 10px;
		width : 100%;
		border-collapse : collapse;
		margin-top : 10px;
		border-right : 4px solid #EEEEEE;
		border-left : 1px solid #EEEEEE;
	}
	thead th {
		background-color : #EEEEEE;
		padding : 8px;
		text-align : center;
	}
	tbody tr{
	}
	tbody td {
		background-color : #ffffff;
		border-bottom : 1px solid #ddd;
		padding : 8px;
		text-align : center;
	}
	input[type="submit"] {
		background-color : #D8D8D8;
		border : none;
		padding : 6px 18px;
		border-radius : 2px;
	}
	input[name="allselect"],
	input[name="delete"] {
		background-color : #567AF0;
		color : white;
		padding : 6px 18px;
		border-radius : 2px;
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
</style>

<title>회원 승인 목록</title>
</head>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<section>
		<article>
			<h2>회원 승인 목록</h2>
			<div class="inner">
				
				<div class="top">
					<div class="left">
						<span><b>승인 목록</b></span>
						<input type="submit" value="전체조회" name="allselect">
						<input type="submit" value="삭제" name="delete">
					</div>
					<div class="right">
						<select>
							<option>검색조건</option>
							<option>수강생</option>
							<option>강사</option>
							<option>매니저</option>
						</select>
						<input type="text" placeholder="조건을 선택해주세요.">
						<input type="submit" value="검색">
					</div>
				</div>

				<table>
					<thead>
						<tr>
							<th></th>
							<th>NO</th>
							<th>상태</th>
							<th>구분</th>
							<th>이름</th>
							<th>아이디</th>
							<th>처리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>대기</td>
							<td>학생</td>
							<td>김하니</td>
							<td>hani1234</td>
							<td><button>완료</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</article>
	</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>