<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@page import="java.util.ArrayList"%>
    <%@page import="com.semi2.group.*" %>
    <%@page import="com.semi2.member.*" %>
    <%@page import="com.semi2.lecture.*" %>
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
input[readonly] {
  background-color: #f0f0f0;
  color: #999;
  border: 1px solid #ccc;
  cursor: not-allowed;
}
</style>
<script>
	function addGroup(gidx){
		location.href="addGroup_ok.jsp?gidx"+gidx;
	}
	function updateGroup(gidx){
		location.href="updateGroup.jsp?gidx="+gidx;
	}
	function updateGroup2(gidx){
		location.href="updateGroup.jsp?gidx="+gidx+"&read=0";
	}
	function update(gidx){
		location.href="addGroup.jsp?gidx="+gidx;
	}
	function deleteGroup(gidx){
		location.href="deleteGroup.jsp?gidx="+gidx;
	}
	function showDetail(gidx,groupname){
		location.href="addGroup.jsp?gidx="+gidx+"&groupname="+groupname;
	}
</script>
<%
	String gidx_s = request.getParameter("gidx");
	if(gidx_s==null){
		gidx_s="0";
	}
	int gidx = Integer.parseInt(gidx_s);
	
	String groupname = request.getParameter("groupname");
	if(groupname==null){
		groupname="미지정";
	}
	
%>
</head>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>반 등록</h2>
	</div>
	<section class="all-section1">
		<article>
			<span><strong>반 목록</strong></span>
			<input type="button" value="반 생성" onclick="addGroup(<%=gidx%>)">
			<input type="button" value="수정" onclick="updateGroup2(<%=gidx %>)">
			<input type="button" value="삭제" onclick="deleteGroup(<%=gidx %>)">
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
						for (int i = 0; i < arr.size(); i++) {
						gdto = arr.get(i);
				%>
					<tr  onclick="showDetail('<%=gdto.getGroupidx()%>','<%=gdto.getGroupname() %>')">
						<td><input type="checkbox" onclick="update(<%=gdto.getGroupidx()%>)" <%=gdto.getGroupidx()== gidx ? "checked":"" %>></td>
						<td><%= gdto.getGroupidx()%></td>
						<td><input type="text" name="groupname" <%=gdto.getGroupname().equals("-") ? "":"readonly" %> value="<%= gdto.getGroupname()%>"></td>
						<%

						if(gdto.getMname().equals("")){

						%>
						<td>
							<select onchange="memberChangeUpdate()">
						<% 
							ArrayList<MemberDTO> mMarr = gdao.selectManager();
						%>
								<option value="N">매니저 선택</option>
						<%
							for(int j = 0; j < mMarr.size(); j++){
								mdto = mMarr.get(j);
						%>
								<option value="<%=mdto.getIdx()%>"><%=mdto.getName() %></option>
						<%
							}
						%>
							</select>
						</td>
						<%
						}else{
						%>
						<td><input type="text" name="mname" <%=gdto.getMname().equals("") ? "":"readonly" %> value="<%=gdto.getMname() %>"></td>
						<%
						}
						%>
						<%
							if(gdto.getTname().equals("")){
						%>
						<td>
							<select onchange="memberChangeUpdate()">
						<% 
							ArrayList<MemberDTO> mTarr = gdao.selectTeacher();
						%>
								<option value="N">강사 선택</option>
						<%
							for(int j = 0; j < mTarr.size(); j++){
								mdto = mTarr.get(j);
						%>
								<option value="<%=mdto.getIdx()%>"><%=mdto.getName() %></option>
						<%
							}
						%>
							</select>
						</td>
						<%
							}else{
						%>
						<td><input type="text" name="tname" <%=gdto.getTname().equals("") ? "":"readonly" %> value="<%=gdto.getTname() %>"></td>
								<%
							}
						%>
						<%
							if(gdto.getTname().equals("N")){
								gdto.setTname("미지정");
							}
						%>
						<td><input type="text" name="scount" <%=gdto.getScount()==1 ? "":"readonly" %> value="<%= gdto.getScount()%>"></td>
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
				<%
					ArrayList<MemberDTO> marr = gdao.inGroup(groupname);
					if(marr==null || marr.size()==0){
						%>
					<tr><td colspan="6">배정된 학생이 없습니다.</td></tr>
						<%
					}else{
						for(int i = 0; i < marr.size(); i++){
							mdto = marr.get(i);
							%>
					<tr>
						<td><%= i+1 %></td>
						<td><%= mdto.getName() %></td>
						<td><%= mdto.getId() %></td>
						<td><%= mdto.getTel() %></td>
						<td><%= mdto.getEmail() %></td>
						<td><%= mdto.getGroupname()%></td>
					</tr>
							<%
						}
					}
				%>

				</tbody>
			</table>
		</article>
	</section>

	<%@ include file="/header/footer.jsp" %>
</body>
</html>