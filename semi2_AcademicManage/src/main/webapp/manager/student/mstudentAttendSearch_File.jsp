<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.record.*" %>

<jsp:useBean id="mrdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<style>

ul.sc-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.all-box {
   display: flex;
   justify-content: space-between;
   align-items: center;
   flex-wrap: wrap;      
   gap: 20px;
   width: 100%;            
   max-width: 1250px;      
   margin: 0 auto;
   box-sizing: border-box;
}

.search-group {
   display: flex;
   align-items: center;
   flex-wrap: wrap;
   gap: 20px; /* 요소 간 간격 */
}

.left-box, .right-box{
	display: flex;
    align-items: center;
    gap: 25px;
    flex-wrap: wrap;
}


.right-box{
	position: right;
}

.search {
    display: flex;
    align-items: center;
    gap: 5px;
}

.setxt{
	width : 200px;
	height : 28px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 5px;
}

.sebt{ 
    background: #567AF0;
    color: #fff;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}

.search label {
    font-weight: bold; /
    font-size: 13px; 
    color: #333; 
    margin-right: 5px;
}

</style>

</head>
<body>
<%@include file="/header/managerHeader.jsp"%>

<section class = "all-section0">
<div class = "all-box">

	<div class="left-box">
	  <div class="search-group">
		<form class = "search" name = "selectList" method="post" action = "mstudentAttendFile.jsp">
					<label> 담당 반 </label>	
					<select class = "se-select" name = "groupidx">
						<option value = "" selected> 반 선택 </option>
					
				<%
					ArrayList<GroupDTO> arr = mrdao.groupSelect();
					if(arr==null||arr.size()==0){
				%>	
					<option value = ""> 미정 </option>
				<%
					}else{
						for(int i = 0; i<arr.size(); i++){
				%>
					<option value = "<%=arr.get(i).getIdx() %>"><%=arr.get(i).getGroupname() %></option>
				<%
						}
					}
				%>
					
					</select>
					<input class = "setxt" type="date" name = "attendate" value = <%=new java.sql.Date(System.currentTimeMillis()).toString() %>>
					<input class = "sebt" type="submit" value="검색">
		</form>
		</div>
	</div>

	
	<div class="right-box">
		<div class="search-group">
			<form class="search" name="dateFind" method="post" action="/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp">
				<select class = "se-select" name = "fkey">
					<option value = "">전체</option>
					<option value = "name">수강생명</option>
				</select>
				<input class = "setxt" type="text" name = "fvalue">
				
				<input type="hidden" name="groupidx" value="<%=(request.getParameter("groupidx")!=null)?request.getParameter("groupidx"):"0" %>">
   				<input type="hidden" name="attendate" value="<%=(request.getParameter("attendate")!=null)?request.getParameter("attendate"):"" %>">
				
				<input class = "sebt" type="submit" value="검색">
			</form>
		</div>
	</div>
</div>
</section>

</body>
</html>