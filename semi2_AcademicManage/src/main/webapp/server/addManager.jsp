<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
    <%@page import="com.semi2.member.*" %>
	<jsp:useBean id="mdao" class="com.semi2.member.MemberDAO"></jsp:useBean>
	<jsp:useBean id="smdao" class="com.semi2.member.SmanagerDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<style>
	body {
		background-color : #E9ECF4;
		padding-top : 50px;
	}
	.inner {
		background-color : #ffffff;
		padding : 30px 20px;
		border-radius : 8px;
	}
	h2 {
		margin-bottom : 15px;
	}
	.inner table {
		background-color : #EEEEEE;
		padding : 0 10px 10px 10px;
		width : 100%;
		border-collapse : collapse;
		margin-top : 10px;
		border-right : 4px solid #EEEEEE;
		border-left : 1px solid #EEEEEE;
	}
	.inner thead th {
		background-color : #EEEEEE;
		padding : 8px;
		text-align : center;
	}
	tbody tr{
		cursor: pointer;
	}
	.inner tbody td {
		background-color : #ffffff;
		border-bottom : 1px solid #ddd;
		padding : 8px;
		text-align : center;
	}
	.inner input[type="submit"] {
		background-color : #D8D8D8;
		border : none;
		padding : 6px 18px;
		border-radius : 2px;
	}
	.inner input[name="allselect"],
	input[name="delete"] {
		background-color : #567AF0;
		color : white;
		padding : 6px 18px;
		border-radius : 2px;
	}
	.inner button {
		background-color : #B5C6FF;
		border : none;
		padding : 2px 6px;
		border-radius : 20px;
	}
	.inner select, input[type="text"] {
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
	.left input[type="button"]{
	  background: #567AF0;
	  color: #fff;
	  border: none;
	  border-radius: 10px;
	  width: 80px;
	  height: 32px;
	  align-items: center;
	  cursor: pointer;
	}
	input[readonly]{
		background-color:#eeeeee;
	}
	input{
		text-align:center;
	}
</style>
<style>
	.inner2 {
		background-color : #ffffff;
		padding : 30px 20px;
		border-radius : 8px;
		overflow : hidden;
	}
	.left2{
		float:left;
		border:1px solid black;
		width:20%;
	}
	.left2 div{
		border:1px solid black;
		margin:40px;
		height:150px;
	}
	.right2{
		float:left;
		border:1px solid black;
	}
	.right2 input{
		border:none;
	}
	.right2 table {
		padding : 0 10px 10px 10px;
		width : 100%;
		border-collapse : collapse;
		margin-top : 10px;
	}
	.right2 th {
		background-color:#eeeeee;
	    border: 1px solid #ddd;
		padding : 8px;
		text-align : center;
	}
 	.right2 td {
		background-color : #ffffff;
		border: 1px solid #ddd;
		padding : 8px;
		text-align : center;
	}
/*	.inner2 input[type="submit"] {
		background-color : #D8D8D8;
		border : none;
		padding : 6px 18px;
		border-radius : 2px;
	}
	.inner2 input[name="allselect"],
	input[name="delete"] {
		background-color : #567AF0;
		color : white;
		padding : 6px 18px;
		border-radius : 2px;
	}
	.inner2 button {
		background-color : #B5C6FF;
		border : none;
		padding : 2px 6px;
		border-radius : 20px;
	}
	.inner2 select, input[type="text"] {
		padding : 6px;
		border : 1px solid #D8D8D8;
		border-radius : 4px;
	}
	.left2 button {
		margin-left: 6px;
	}
	.right2 select,
	.right2 input,
	.right2 button {
		margin-left: 6px;
	}
	.left2 input[type="button"]{
	  background: #567AF0;
	  color: #fff;
	  border: none;
	  border-radius: 10px;
	  width: 80px;
	  height: 32px;
	  align-items: center;
	  cursor: pointer; */
</style>
<script>
	function managerJoin(){
		location.href="memberJoin.jsp?mem=";
	}
	function showDetail(idx){
		location.href="addManager.jsp?sort=4&idx="+idx;
	}
	function deletee(idx){
		location.href="deleteManager_ok.jsp?idx="+idx;
	}
</script>
<title>Insert title here</title>
</head>
<%
	String sort = request.getParameter("sort");

	String idx_s = request.getParameter("idx");
	if(idx_s==null){
		idx_s = "1";
	}
	int idx = Integer.parseInt(idx_s);
	
	ArrayList<MemberDTO> arr = mdao.memSelect(sort);
	MemberDTO dto2 = smdao.managerFind(idx);
%>
<body>
<%@ include file="/header/serverHeader.jsp" %>
		<section class="all-section1">
			<h2>매니저 관리</h2>
			<article>
				<div class="inner">
					<div class="top">
						<div class="left">
							<span><b>매니저 목록</b></span>
							<input  type="button" value="계정 추가" onclick="managerJoin()">
							<input  type="button" value="삭제" onclick="deletee('<%=idx%>')">
						</div>
						<div class="right">
						</div>
					</div>
					<table>
						<thead>
							<tr>
								<th></th>
								<th>NO</th>
								<th>이름</th>
								<th>아이디</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>담당반</th>
							</tr>
						</thead>
						<tbody>
						<%
							if(arr == null || arr.size()==0){
								%>
							<tr>
								<td colspan="7">등록된 매니저 계정이 없습니다.</td>
							</tr>
								<%
							}else{
								for(int i = 0; i < arr.size(); i++){
									MemberDTO dto = arr.get(i);
								%>
									<tr  onclick="showDetail('<%=dto.getIdx()%>')">
										<td><input type="checkbox" <%= dto.getIdx() == idx ? "checked" : "" %>></td>
										<td><%=i+1%></td>
										<td><%=dto.getName() %></td>
										<td><%=dto.getId() %></td>
										<td><%=dto.getTel() %></td>
										<td><%=dto.getEmail() %></td>
										<%
										if(dto.getGroupname()==null){
										%>
										<td>[미정]</td>
										<%
											}else{
										%>
										<td><%=dto.getGroupname() %></td>
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
								<td colspan="1" style="text-align:center;"></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</article>
			<br>
	
			<article>
				<div class="inner2">
					<div class="left2">
						<div>
						</div>
							<input type="button" value="사진 등록">
					</div>
					<div class="right2">
						<table>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" readonly value=<%=dto2.getIdx()==1 ? "":dto2.getName() %>></td>
								<th>성별</th>
								<td><input type="text" name="sex" readonly value=<%=dto2.getIdx()==1 ? "":(dto2.getSex().equals("F") ? "여자" : "남자") %>></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="birth" readonly value=<%=dto2.getIdx()==1 ? "":dto2.getBirth() %>></td>
								<th>주소</th>
								<td><input type="text" name="addr" readonly value=<%=dto2.getIdx()==1 ? "":dto2.getAddr() %>></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name="tel" readonly value=<%=dto2.getIdx()==1 ? "":dto2.getTel() %>></td>
								<th>이메일</th>
								<td><input type="text" name="email" readonly value=<%=dto2.getIdx()==1 ? "":dto2.getEmail() %>></td>
							</tr>
							<tr>
								<th>입사일</th>
								<td><input type="text" name="comingdate" readonly></td>
								<th>경력</th>
								<td><input type="text" name="career"></td>
							</tr>
							<tr>
								<th>담당반</th>
								<td><input type="text" name="groupname"></td>
								<th>특이사항</th>
								<td><input type="text" name="memo"></td>
							</tr>
<!-- 							<tr>
								<th>특이사항</th>
								<td colspan="3"><textarea name="note" style="width: 100%; height: 60px;"></textarea></td>
							</tr> -->
							<tr>
								<td colspan="5" style="text-align: right;">
									<button>수정</button>
									<button>등록</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</article>
		</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>