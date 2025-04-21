<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.member.*" %>

<jsp:useBean id="msdao" class="com.semi2.member.TstudentDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");
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

.table-info td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}

.list-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}
.all-section2-sub{
		margin-left: 320px; 
		margin-bottom: 100px;
		background-color: #ffffff;
		padding: 8px 30px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		height: 500; /* 추가 높이 설정 */
		max-height: 380px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
  		overflow-x: hidden;
  		margin-bottom : 20px;
}
</style>

</head>

<body>

<div class = "all-title1">
  <h2>수강생 정보 관리</h2>
</div>
 <section class= "all-section1">
  	<%@include file="../header/teacherHeader.jsp"%> 

    <article>
		<form name="mstudentFind" method="post" action="tStudentMemo.jsp">
			<select class= "se-Find" name = "fkey">
				<option value = "">전체</option>
				<option value = "classidx">이름</option>
				<option value = "tname">수강반명</option>
			</select>
			<input type="text" name = "fvalue">
			<input type="submit" value="검색">
		</form>
		
		<table class="table-info">
			<thead class="table-info-header">
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>세부정보</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
				String tname = mdto.getName();
				ArrayList<MemberDTO> arr = msdao.findStudentsByTeacher(tname);
				
				if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan = "7"> 등록된 수강생이 없습니다.</td>
				</tr>					
				<%
				}else{
					for(int i = 0; i<arr.size(); i++){
				%>	
				<tr>
					<td><%= i + 1 %></td> 
					<td><%=arr.get(i).getName() %></td>
					<td><%=arr.get(i).getSex() %></td>
					<td><%=arr.get(i).getBirth() %></td>
					<td><%=arr.get(i).getTel() %></td>
					<td><%=arr.get(i).getEmail() %></td>
					<td>
					<form name="managerstudentList" method="post" action="/semi2_AcademicManage/teacher/tStudentMemo.jsp">
					<input type="hidden" name="idx" value="<%=arr.get(i).getIdx()%>">
					<input type="submit" value="조회">
					</form>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</article>
</section>

  
<div class = "all-title2">
		<h2>수강생 정보</h2>
	</div>
	<section class= "all-section2-sub">
	
	 <%
    if(idx == null||idx.equals("")){
    %>
    	<p class= "list-alert">학생 세부정보를 확인하시려면 '보기' 버튼을 클릭하세요.</p>
    <%
    }else{
    %>
		<jsp:include page="tStudentMemo_ok.jsp"><jsp:param name="idx" value="<%=idx%>"/></jsp:include>
	<%
    }
	%>	
	</section>

<%@include file="../header/footer.jsp"%>
</body>
</html>