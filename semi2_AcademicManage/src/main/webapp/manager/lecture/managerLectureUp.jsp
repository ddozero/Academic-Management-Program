<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*"%>
<%@ page import="com.semi2.group.*"%>
<%@ page import="com.semi2.member.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>
	<%
	
	String idx_s = request.getParameter("classidx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int classidx = Integer.parseInt(idx_s);
	ManagerLectureDTO dto = mldao.managerLectureUpSh(classidx);
	if (dto == null) {
	%>
	<script>
		window.alert("잘못된 접근입니다.")
		location.href = '/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp';
	</script>
	<%
	return;
	}
	%>

	<section>
		<form name="managerLectureUp" action="/semi2_AcademicManage/manager/lecture/managerLectureUp_ok.jsp" method="post">
			<input type="hidden" name="classidx" value="<%=dto.getClassidx()%>">
			<table border="1px">

				<tr>
					<th>강좌명</th>
					<td colspan="3"><input type="text" name="classname" value = "<%=dto.getClassname()%>"></td>
				</tr>

				<tr>
					<th>담당강사</th>
					<td><select name="tname">
					
							<%
							ArrayList<MemberDTO> tarr = mldao.managerMemberPick(3);
							if (tarr == null || tarr.size() == 0) {
							%>
							<option value="">강사 없음</option>
							<%
							} else {
							for (int i = 0; i < tarr.size(); i++) {
								String ctname = tarr.get(i).getName();
								String selected = ctname.equals(dto.getTname())?"selected":"";
							%>
							<option value="<%=ctname%>"<%=selected%>><%=ctname%></option>
							<%
							}
							}
							%>

							

					</select></td>

					<th>담당매니저</th>
					<td><select name="chargemname">
							<%
							ArrayList<MemberDTO> marr = mldao.managerMemberPick(4);
							if (marr == null || marr.size() == 0) {
							%>
							<option value="">매니저 없음</option>
							<%
							} else {
							for (int i = 0; i < marr.size(); i++) {
								String cmname = marr.get(i).getName();
								String selected = cmname.equals(dto.getChargemname())?"selected":"";
							%>
							<option value="<%=cmname%>"<%=selected%>><%=cmname%></option>

							<%
							}
							}
							%>
					</select></td>
				</tr>

				<%
				ArrayList<GroupDTO> garr = mldao.managerLecturePick();
				%>
				<tr>
					<th>수강반명</th>
					<td><select name="groupname">
							<%
							if (garr == null || garr.size() == 0) {
							%>
							<option value="">개설반 없음</option>
							<%
							} else {
							for (int i = 0; i < garr.size(); i++) {
								String cgname = garr.get(i).getGroupname();
								String selected = cgname.equals(dto.getGroupname())?"selected":"";
							%>
							<option value="<%=cgname%>"<%=selected%>><%=cgname%></option>
							<%
							}
							}
							%>


					</select></td>
					<th>총수강일</th>
					<td><input type="text" name="entiredate" value = "<%=dto.getEntiredate()%>"></td>
				</tr>

				<tr>
					<th>개강일</th>
					<td><input type="date" name="comingdate" value="<%=dto.getComingdate()%>"></td>
					<th>종강일</th>
					<td><input type="date" name="enddate" value="<%=dto.getEnddate() %>"></td>
				</tr>

				<tr>
					<td colspan="4"><input type="submit" value="수정하기"> 
					<input type="button" value="취소하기" onclick="location.href='/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp'">
				</tr>
				</tbody>
			</table>
		</form>
	</section>

<%@include file="/header/footer.jsp"%>
</body>
</html>