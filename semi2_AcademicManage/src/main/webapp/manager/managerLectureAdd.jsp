<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.lecture.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@page import = "java.util.*" %>

<jsp:useBean id="gdto" class="com.semi2.group.GroupDTO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>

<section>
<form name = "mlectureAdd" action="managerLectureAdd_ok.jsp" method = "post">
	<table border = "1px">

			<tr>
				<th>강좌명</th>
				<td colspan= "3"><input type="text" name="classname"></td>
			</tr>
			
			<tr>
				<th>담당강사</th>
				<td>
				<select name = "tname">
				<%
				ArrayList<MemberDTO> tname = mldao.managerMemberPick(3);
				if(tname==null||tname.size()==0){
				%>
					<option value = "">강사 없음</option>
				<%
				}else{
					for(int i = 0; i<tname.size(); i++){
				%>
					<option value = "<%=tname.get(i).getName()%>"><%=tname.get(i).getName()%></option>
				<%
					}
				}
				%>
				
				</select>
				</td>
				
				<th>담당매니저</th>
				<td>
				<select name="chargemname">
				<%
				ArrayList<MemberDTO> mname = mldao.managerMemberPick(4);
				if(mname==null||mname.size()==0){
				%>
					<option value = "">매니저 없음</option>
				<%
				}else{
					for(int i =0; i<mname.size(); i++){
				%>					
					<option value = "<%=mname.get(i).getName() %>"><%=mname.get(i).getName() %></option>
				
				<%
					}
				}
				%>
				</select>
				</td>
			</tr>
			
			<% ArrayList<GroupDTO> arr = mldao.managerLecturePick(); %>
			<tr>
				<th>수강반명</th>
				<td><select name = "groupname">
				<%
				if(arr==null||arr.size()==0){
				%>
					<option value="">개설반 없음</option>
				<%
				}else{
					for(int i =0; i<arr.size(); i++){
				%>
					<option value = "<%=arr.get(i).getGroupname() %>"><%=arr.get(i).getGroupname() %></option>
				<%		
					}
				}
				%>
				
				
				</select></td>
				<th>총수업일</th>
				<%
				String comingDate = request.getParameter("comingdate");
				String endDate = request.getParameter("enddate");
				
				
				
				%>
				<td><input type="text" name="entiredate"></td>
			</tr>
			
			<tr>
				<th>개강일</th>
				<td><input type="date" name="comingdate"></td>
				<th>종강일</th>
				<td><input type="date" name="enddate"></td>
			</tr>

			<tr>
				<td colspan="4">
				<input type="submit" value="등록하기">
				<input type="button" value="수정하기">
				<input type="reset" value="초기화">
			</tr>
		</tbody>
	</table>
</form>	
<br>
<div>
	<jsp:include page="managerLectureInfo.jsp"></jsp:include>
</div>
</section>





<%@include file="/header/footer.jsp"%>
</body>
</html>