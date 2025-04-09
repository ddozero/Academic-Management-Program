<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "com.semi2.lecture.*" %>

<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

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

.LectureList-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}

</style>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>



<body>
<%@include file="/header/managerHeader.jsp"%>
<div class = "all-title1">
<h2>강좌 목록</h2>
</div>
<section class="all-section1">
	<article>
		<form name="lectureFind" method="post" action="managerLectureList.jsp">
			<select class= "se-lectureFind" name = "fkey">
				<option value = "">전체</option>
				<option value = "classidx">강좌번호</option>
				<option value = "tname">강사명</option>
			</select>
			<input type="text" name = "fvalue">
			<input type="submit" value="검색">
		</form>
		
		<table class="table-info">
			<thead class="table-info-header">
				<tr>
					<th>NO</th>
					<th>강좌명</th>
					<th>강사명</th>
					<th>수강반명</th>
					<th>담당매니저</th>
					<th>개강날짜</th>
					<th>종강날짜</th>
					<th>총수강일</th>
					<th>세부정보</th>
				</tr>
			</thead>
			
			<tbody>
			<%
			String classidx = request.getParameter("classidx");

			String fkey = request.getParameter("fkey");
			String fvalue = request.getParameter("fvalue");
			
			
			ArrayList<ManagerLectureDTO> arr = null;
			
			if(fkey == null || fvalue == null || fkey.equals("") || fvalue.equals("")){
				arr = mldao.managerLectureInfo();
			}else{
				arr = mldao.lectureFind(fkey, fvalue);
			}
			
			if(arr==null||arr.size()==0){
			%>
				<tr>
					<td colspan = "9">개설된 강좌가 없습니다.</td>
				</tr>
				
			<%
			}else{
				for(int i = 0; i<arr.size(); i++){
			%>
					<tr>
						<td><%=arr.get(i).getClassidx() %></td>
						<td><%=arr.get(i).getClassname() %></td>
						<td><%=arr.get(i).getTname() %></td>
						<td><%=arr.get(i).getGroupname() %></td>
						<td><%=arr.get(i).getChargemname() %></td>
						<td><%=arr.get(i).getComingdate() %>
						<td><%=arr.get(i).getEnddate() %></td>
						<td><%=arr.get(i).getEntiredate() %></td>				
						<td>	
						<form name="managerLectureList" method="post" action="/semi2_AcademicManage/manager/lecture/managerLectureList.jsp">
						<input type="hidden" name="classidx" value="<%=arr.get(i).getClassidx()%>">
						<input type="submit" value="보기">
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
  		<h2>개설 강좌 세부 정보</h2>
 	</div>
 	
<section class = "all-section2">
    <%
    if(classidx == null||classidx.equals("")){
    %>
    	<p class= "LectureList-alert">강좌 세부정보를 확인하시려면 '보기' 버튼을 클릭하세요.</p>
    <%
    }else{
    %>
    
		<jsp:include page="managerLectureList_ok.jsp">
			<jsp:param name="classidx" value="<%=classidx%>"/>
		</jsp:include>
   	<%
    }
    %>
</section>
<%@include file="/header/footer.jsp"%>


</body>
</html>