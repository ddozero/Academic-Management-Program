<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.record.*" %>

<jsp:useBean id="mtdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
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
				<form class = "search" name = "selectGroub" method="post" action = "mteacherAttendList.jsp">
					<label> 담당 반 </label>	
					<select class = "se-select">
				<%
					ArrayList<GroupDTO> arr = mtdao.groupSelect();
					if(arr==null||arr.size()==0){
				%>
						<option value = ""> 미정 </option>
				<%
					}else{
						for(int i = 0; i<arr.size(); i++){
				%>		
						<option value="<%=arr.get(i).getIdx()%>"><%=arr.get(i).getGroupname()%></option>
				<%
						}
					}
				%>
					</select>
						<input class = "sebt" type="submit" value="선택"> 
				</form>
		</div>
					
		<div class = "search-group">
				<form class="search" name="dateFind" method="post" action="mteacherAttendList.jsp">
					<select class = "se-select" name = "fkey">
						<option value = "">전체</option>
					</select>
					<input class = "setxt" type="date" name = "fvalue">
					<input class = "sebt" type="submit" value="검색">
				</form>
		</div>
		
		 <div class="search-group">
				<form class="search" name="attendFind" method="post" action="mteacherAttendList.jsp">
					<label>상태</label>
					<select class = "se-select" name = "fkey">
						<option value = "">전체</option>
						<option value = "attend1">출근</option>
						<option value = "attend2">결근</option>
						<option value = "attend3">지각</option>
						<option value = "attend4">휴가</option>
						<option value = "attend5">병가</option>
					</select>
					<input class = "sebt" type="submit" value="검색">
				</form>
		</div>
	</div>

	
	<div class="right-box">
		<div class="search-group">
			<form class="search" name="dateFind" method="post" action="mteacherAttendList.jsp">
				<select class = "se-select" name = "fkey">
					<option value = "">전체</option>
					<option value = "date">수강반명</option>
					<option value = "name">강사명</option>
				</select>
				<input class = "setxt" type="text" name = "fvalue">
				<input class = "sebt" type="submit" value="검색">
			</form>
		</div>
	</div>
</div>
</section>

</body>
</html>