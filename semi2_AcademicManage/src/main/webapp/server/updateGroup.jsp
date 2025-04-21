<%@page import="com.semi2.lecture.LectureDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@page import="java.util.ArrayList"%>
    <%@page import="com.semi2.group.*" %>
    <%@page import="com.semi2.member.*" %>
    <jsp:useBean id="gdto" class="com.semi2.group.GroupDTO"></jsp:useBean>
    <jsp:useBean id="gdao" class="com.semi2.group.AGroupDAO"></jsp:useBean>
    <jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.table-info td input[type="text"]{
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
}
input[readonly] {
  background-color: #f0f0f0;
  color: #999;
  border: 1px solid #ccc;
  cursor: not-allowed;
}
.inner {
  display: flex;
  gap: 20px;
  align-items: flex-start;
}
input[type="submit"],input[type="button"] {
    background-color: #4c6ef5;
    color: white;
    padding: 4px 10px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}
</style>
<script>
	function addGroup(){
		location.href="addGroup_ok.jsp";
	}
	function updateGroup(gidx){
		location.href="updateGroup.jsp?gidx="+gidx;
	}
	var mName = "";
	var tName = "";
	var sCount = 0;
	
	function groupName(input){
		groupname = input.value;
	}
	
	function managerName(select){
		mName = select.value;
	}
	function teacherName(select){
		tName = select.value;
	}
	function scount(input){
		sCount = input.value;
	}
	
	function saveGroup(gidx){
		const name = document.getElementById("groupID_" + gidx).value;
		url="updateGroup_ok.jsp";
		location.href=url+"?groupidx="+gidx+"&groupname="+name+"&mname="+mName+"&tname="+tName+"&scount="+sCount;
	}
</script>
</head>
<%
	String gidx_s = request.getParameter("gidx");
	if(gidx_s.equals(null)){
		gidx_s="0";
	}
	int gidx = Integer.parseInt(gidx_s);
	
	String read = request.getParameter("read");
%>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>반 등록</h2>
	</div>
	<section class="all-section1">
		<article>
			<span><strong>반 목록</strong></span>
				<input type="button" value="반 생성" onclick="addGroup()">
				<input type="button" value="저장" onclick="saveGroup(<%=gidx%>)">
				<table class="table-info">
					<thead class="table-info-header">
						<tr>
							<th></th>
							<th>NO</th>
							<th>반</th>
							<th>매니저</th>
							<th>강사</th>
							<th>총원</th>
						</tr>
					</thead>
					<tbody>
					<%
						ArrayList<GroupDTO> arr = gdao.selectGroup();
						if(arr == null || arr.size() == 0){
					%>
						<tr>
							<td colspan="7">등록된 반이 없습니다.</td>
						</tr>
					<%
						}else{
							for (int i = 1; i < arr.size(); i++) {
							gdto = arr.get(i);
					%>
						<tr>
							<td><input type="checkbox" <%=gdto.getGroupidx()==gidx ? "checked":"" %>></td>
							<td><%= gdto.getGroupidx()%></td>
							<td><input type="text" name="groupname" id="groupID_<%=gdto.getGroupidx()%>" <%=gdto.getGroupname().equals("N") ? "":gdto.getGroupidx()==gidx ? "":"readonly" %> value="<%= gdto.getGroupname()%>"></td>
							<%
	
							
							if(gdto.getMname().equals("N")){
	
							%>
							<td>
								<select onchange="managerName(this)">
							<% 
								ArrayList<MemberDTO> mMarr = gdao.selectManager();
							%>
									<option value="N">매니저 선택</option>
							<%
								for(int j = 0; j < mMarr.size(); j++){
									mdto = mMarr.get(j);
							%>
									<option value="<%=mdto.getName() %>"><%=mdto.getName() %></option>
							<%
								}
							%>
								</select>
							</td>
							<%
							}else if (gdto.getGroupidx() == gidx && "0".equals(read)) { %>
							  <td>
							    <select onchange="managerName(this)">
							      <option value="N">매니저 선택</option>
							      <%
							        ArrayList<MemberDTO> mMarr = gdao.selectManager();
							        for (int j = 0; j < mMarr.size(); j++) {
							          mdto = mMarr.get(j);
							      %>
							        <option value="<%=mdto.getName() %>">
							          <%=mdto.getName() %>
							        </option>
							      <% } %>
							    </select>
							  </td>
							<% } else{
							%>
							<td><input type="text" name="tname" <%=gdto.getMname().equals("N") ? "":"readonly" %> value="<%=gdto.getMname() %>"></td>
							<%
							}
							%>
							<%
								if(gdto.getTname().equals("N")){
							%>
							<td>
								<select onchange="teacherName(this)">
							<% 
								ArrayList<MemberDTO> mTarr = gdao.selectTeacher();
							%>
									<option value="N">강사 선택</option>
							<%
								for(int j = 0; j < mTarr.size(); j++){
									mdto = mTarr.get(j);
							%>
								<option value="<%=mdto.getName() %>">
									<%=mdto.getName() %>
								</option>
							<%
								}
							%>
								</select>
							</td>
							<%
								}else if (gdto.getGroupidx() == gidx && "0".equals(read)) { %>
								  <td>
								    <select onchange="teacherName(this)">
								      <option value="N">강사 선택</option>
								      <%
								        ArrayList<MemberDTO> mTarr = gdao.selectTeacher();
								        for (int j = 0; j < mTarr.size(); j++) {
								          mdto = mTarr.get(j);
								      %>
								        <option value="<%=mdto.getName() %>">
								          <%=mdto.getName() %>
								        </option>
								      <% } %>
								    </select>
								  </td>
								<% } else {
							%>
							<td><input type="text" name="tname" <%=gdto.getTname().equals("N") ? "":"readonly" %> value="<%=gdto.getTname() %>"></td>
							<%
								}
							%>
							<%
							%>
							<td><input type="text" name="scount" <%=gdto.getScount()==0 ? "":"readonly" %> value="<%= gdto.getScount()%>"oninput="scount(this)"></td>
						</tr>
					<%
							}
						}
					
					%>
					</tbody>
				</table>
		</article>
	</section>
	
	<br>

		<section class="all-section2">
		<article>
			<span><strong>반 상세조회</strong></span>
			<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th>NO</th>
						<th>이름</th>
						<th>아이디</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>담당반</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
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

	<%@ include file="/header/footer.jsp" %>
</body>
</html>