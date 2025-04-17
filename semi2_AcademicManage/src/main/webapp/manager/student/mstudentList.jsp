<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "com.semi2.group.*" %>

<jsp:useBean id="mdao" class="com.semi2.member.MMemberDAO"></jsp:useBean>
<jsp:useBean id="mrdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
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
    font-size: 15px;
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

/* 검색창 디자인 */
.se-Find {
    float: right; 
    margin: 10px 0; 
}

form[name="mstudentFind"] {
    float: right;
}

.sebt{ 
    background: #d8d8d8;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}

.search-button:hover {
    color: #567AF0;
}

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 80px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}


.se-select:focus {
    outline: none; 
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

.total-count p{
	font-size: 14px;
	color : #666;
	margin-top:15px;
}


</style>

</head>

<%
int totalCount = 0;
//if (arr != null) {
//	totalCount = arr.size();
///} else {
//	totalCount = 0; 
//}
%>

<body>

<div class = "all-title1">
  <h2>수강생 정보 관리</h2>
</div>
 <section class= "all-section1">
  	<%@include file="/header/managerHeader.jsp"%>

    <article>
		<form class = "se-Find" name="mstudentFind" method="post" action="mstudentList.jsp">
			<select class= "se-select" name = "fkey">
				<option value = "">전체</option>
				<option value = "name">이름</option>
			</select>
			<input class = "setxt" type="text" name = "fvalue">
			<input class = "sebt" type="submit" value="검색">
		</form>
		<div class = "total-count">
			<p>총 <%=totalCount %>명</p>
		</div>
		<table class="table-info">
			<thead class="table-info-header">
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>반배정</th>
					<th>세부정보</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				String idx = request.getParameter("idx");
				
				String fkey = request.getParameter("fkey");
				String fvalue = request.getParameter("fvalue");
				
				ArrayList<MemberDTO> arr = null;
				
				if(fkey == null || fvalue == null || fkey.equals("") || fvalue.equals("")){
					arr = mdao.mstudentInfo(2);
				}else{
					arr = mdao.mstudentFind(fkey, fvalue);
				}
				
				if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan = "8"> 등록된 수강생이 없습니다.</td>
				</tr>					
				<%
				}else{
					for(int i = 0; i<arr.size(); i++){
				%>	
				<tr>
					<td><%=arr.get(i).getM2idx() %></td>
					<td><%=arr.get(i).getName() %></td>
					<td><%=arr.get(i).getSex() %></td>
					<td><%=arr.get(i).getBirth() %></td>
					<td><%=arr.get(i).getTel() %></td>
					<td><%=arr.get(i).getEmail() %></td>
					<td>
					<form class = "search" name = "selectList" method="post" action = "msgroupSelect_ok.jsp">
					<input type="hidden" name="m2idx" value="<%=arr.get(i).getM2idx()%>">
					<select class = "se-select" name = "groupidx">
					<option value = "" selected> 반 선택 </option>
				<%
					ArrayList<GroupDTO> arr2 = mrdao.groupSelect();
					if(arr2==null||arr2.size()==0){
				%>
						<option value = ""> 미정 </option>
				<%
					}else{
						for(int j = 0; j<arr2.size(); j++){
				%>		
						<option value="<%=arr2.get(j).getGroupidx()%>"><%=arr2.get(j).getGroupname()%></option>
				<%
						}
					}	
				%>	
					</select>
					<input class = "sebt" type="submit" value="배정">
					</form>
					
					</td>
					<td>
					<form name="managerstudentList" method="post" action="/semi2_AcademicManage/manager/student/mstudentList.jsp">
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
	<section class= "all-section2">
	
	 <%
    if(idx == null||idx.equals("")){
    %>
    	<p class= "list-alert">학생 세부정보를 확인하시려면 '보기' 버튼을 클릭하세요.</p>
    <%
    }else{
    %>
		<jsp:include page="mstudentList_ok.jsp">
			<jsp:param name="idx" value="<%=idx%>"/>
		</jsp:include>
	<%
    }
	%>	
	</section>

<%@include file="/header/footer.jsp"%>
</body>
</html>