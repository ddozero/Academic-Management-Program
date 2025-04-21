<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.semi2.record.*"%>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mrdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<jsp:useBean id ="mrdto" class="com.semi2.record.RecordDTO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>

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

.table-info td form input[type="submit"]{  /* submit 버튼 - 변경 */
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

.upbt{  /*총 근무시간 수정 버튼 */
	background: #fff;
	color: #777777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}

.upbt:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}


.table-info th {
    width: auto; /* 기본 설정 */
}

/* 4번 열: 강좌명 */
.table-info th:nth-child(4),
.table-info td:nth-child(4) {
  width: 25%;
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

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 100px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}


.se-select:focus {
    outline: none; 
}

.table-info td form{ 
	display: flex; 
    justify-content: center; 
    align-items: center; 
    gap: 10px; 
    margin: 0; 
}

/**all-section 0 부분 디자인*/
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

<body>
<%@include file="/header/managerHeader.jsp"%>


 <div class = "all-title1">
  <h2>수강생 출결 인정 서류</h2>
  </div>
  
  <section class = "all-section0">
	<div class = "all-box">
		<div class="left-box">
		  <div class="search-group">
			<form class = "search" name = "selectList" method="post" action = "/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp">
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
							int crtGroupidx = arr.get(i).getGroupidx();
				%>
					<option value = "<%=arr.get(i).getGroupidx() %>"><%=arr.get(i).getGroupname() %></option>
					
				<%
						}
					}
				%>
					</select>
			
					<input type="hidden" name="idx" value="<%=mrdto.getIdx()%>">
					<input class = "sebt" type="submit" value="검색">
			</form>
		</div>
	</div>

<!-- <div class="right-box">
		<div class="search-group">
			<form class="search" name="dateFind" method="post" action="/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp">
				<select class = "se-select" name = "fkey">
					<option value = "">전체</option>
					<option value = "name">수강생명</option>
				</select>
				<input class = "setxt" type="text" name = "fvalue">
				
				<input type="hidden" name="groupidx" value="<%=(request.getParameter("groupidx")!=null)?request.getParameter("groupidx"):"0" %>">
   				
				
				<input class = "sebt" type="submit" value="검색">
			</form>
		</div>
	</div>
 -->
	</div>
</section>

  <section class= "all-section1">
  	<table class="table-info">
		<thead class="table-info-header">
			<tr>
				<th>NO</th>
				<th>이름</th>
				<th>수강반명</th>
				<th>강좌명</th>
				<th>신청일자</th>
				<th>구분</th>
				<th>인정서류</th>
				<th>승인상태</th>
				<th>변경처리</th>
			</tr>
		</thead>
		
		<tbody>
		
			<%
			String groupidx_s = request.getParameter("groupidx");
			String appro_s = request.getParameter("appro");
			String issueidx_s = request.getParameter("issueidx");

			if (groupidx_s == null || groupidx_s.isEmpty()) {
			    groupidx_s = "0"; 
			}

			if (appro_s == null || appro_s.isEmpty()) {
			    appro_s = "0"; 
			}

			if (issueidx_s == null || issueidx_s.isEmpty()) {
			    issueidx_s = "0"; 
			}

			int groupidx = Integer.parseInt(groupidx_s);
			int appro = Integer.parseInt(appro_s);
			int issueidx = Integer.parseInt(issueidx_s);

			
			System.out.println("groupidx + appro + issueidx :" + groupidx + appro + issueidx);

			ArrayList<RecordDTO> arr2 =null;
			
			arr2=mrdao.msRecordFile(groupidx);
			
			if(arr2==null||arr2.size()==0){
	        %>
				<tr>
				<td colspan = "9" style="font-size:16px; padding:5px;"> 담당 반을 선택해주세요. </td>
			</tr>
			<%
				}else{
				for(int i = 0; i<arr2.size(); i++){
					RecordDTO r2dto = arr2.get(i);
					String approText = "";
					
					//status값 문자 출력
					switch(r2dto.getAppro()){
					case 1 : approText = "승인"; break;
					case 0 : approText = "미승인"; break;
					}
					
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=arr2.get(i).getName()%></td>
				<td><%=arr2.get(i).getGroupname()%></td>
				<td><%=arr2.get(i).getClassname() %></td>
				<td><%=arr2.get(i).getReqdate() %></td>
				<td><%=arr2.get(i).getIssuedivi() %></td>
				<td><a href = "<%=arr2.get(i).getFilename() %>" download>서류확인</a></td>
				<td><%=arr2.get(i).getIssuestatus() %></td>
				<td>
					<form class= "form-sclist" name="mteacherAttendFile" method="post" action="/semi2_AcademicManage/manager/student/mrecordStatusFileUp_ok.jsp">
						<select class = "se-select" name = "appro">
							<option value = "1" <%=r2dto.getAppro()==1?"selected":"" %>>승인</option>
							<option value = "0" <%=r2dto.getAppro()==0?"selected":"" %>>미승인</option>
						</select>
						<input type="hidden" name = "issueidx" value = "<%=arr2.get(i).getIssueidx() %>">

						<input type="submit" value="변경">
					</form>
				</td>
			</tr>
			<%
			
				}
			}
			%>
		</tbody>
	</table>
  
  </section>



<%@include file="/header/footer.jsp"%>
</body>
</html>