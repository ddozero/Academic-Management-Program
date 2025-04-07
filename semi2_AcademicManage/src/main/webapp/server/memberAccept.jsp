<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.*" %>
<jsp:useBean id="mdao" class="com.semi2.member.MemberDAO"></jsp:useBean>
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
<script>
	function click(){
		
	}
</script>
<title>회원 승인 목록</title>
</head>
<%
	ArrayList<MemberDTO> arr = mdao.memSelect(sort);
%>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<section>
		<article>
			<h2>회원 승인 목록</h2>
			<div class="inner">
				<div class="top">
					<div class="left">
						<span><b>승인 목록</b></span>
						<select>
							<option>전체조회</option>
							<option>수강생</option>
							<option>강사</option>
							<option>매니저</option>
						</select>
						<input type="checkbox" name="ingAcc" onclick="click()">승인대기
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
						<%
							if(arr == null || arr.size()==0){
							%>
								<tr><td colspan="7">가입한 계정이 없습니다.</td></tr>
							<%
							}else {
								for(int i = 0; i < arr.size(); i++){
									MemberDTO dto = arr.get(i);
								%>
									<tr>
										<td><input type="checkbox"></td>
										<td><%=dto.getIdx() %></td>
										<%
											if(dto.getAppro()==1){
										%>
											<td>[승인]</td>
										<%
											}else{
										%>
											<td>[대기]</td>
										<%
											}
											switch(dto.getMidx()){
												case 1 :%><td>[관리자]</td><%break;
												case 2 :%><td>[수강생]</td><%break;
												case 3 :%><td>[강사]</td><%break;
												case 4 :%><td>[매니저]</td><%;
											}
												
										%>
										
										<td><%=dto.getName() %></td>
										<td><%=dto.getId() %></td>
										<% 
											if(dto.getAppro()==0){
										%>
										<td><a href="memberAccept_ok.jsp?idx=<%=dto.getIdx()%>">승인</a></td>
										<%
											}else{
										%>
										<td><button>완료</button></td>
										<%
											}
										%>
									</tr>
								<%
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="1"></td>
							<td colspan="5" style="text-align:center;">
								1 2 3 4 5
							</td>
							<td colspan="1" style="text-align:center;">
								<input type="button" value="삭제">
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