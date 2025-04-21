<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.record.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "java.text.*" %>

<jsp:useBean id="mrdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat sdfDateTime = new SimpleDateFormat("HH:mm:ss");
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

/* 1번 열: NO */
.table-info th:nth-child(1),
.table-info td:nth-child(1) {
  width: 5%;
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
    width: 80px;
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

/**section0부분 디자인*/
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

<script>
function recordTimeUp(recordidx, recordtime, tname){
    var Width = 500; 
    var Height = 300; 

    // 화면 중앙 설정
    var xPos = (screen.width - Width) / 2; //가로이동
    var yPos = (screen.height - Height) / 2 - 50; //-50은 위쪽이동

    // 팝업 열기
    var url = '/semi2_AcademicManage/manager/recordTimeUp.jsp?recordidx=' + recordidx + '&recordtime=' + recordtime + '&tname=' + tname;
    window.open(
        url,
        'recordTimeUp',
        'width=' + Width + ',height=' + Height + ',left=' + xPos + ',top=' + yPos + ',toolbars=no,resizable=no,scrollbars=no'
    );
}
</script>

<body>
<%@include file="/header/managerHeader.jsp"%>

	<div class = "all-title1">
 	 <h2>수강생 출결 관리</h2>
	</div>

<section class = "all-section0">
<div class = "all-box">
	<div class="left-box">
	  <div class="search-group">
		<form class = "search" name = "selectList" method="post" action = "mstudentAttendList.jsp">
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
					<option value = "<%=arr.get(i).getGroupidx() %>"><%=arr.get(i).getGroupname() %></option>
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

<!-- 	<div class="right-box">
		<div class="search-group">
			<form class="search" name="dateFind" method="post" action="mstudentAttendList.jsp">
				<select class = "se-select" name = "fkey">
					<option value = "">전체</option>
					<option value = "name">수강생명</option>
				</select>
				<input class = "setxt" type="text" name = "fvalue">
				
				<input type="hidden" name="groupidx" value="<%=request.getParameter("groupidx")%>">
   				<input type="hidden" name="attendate" value="<%=request.getParameter("attendate")%>">
				
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
					<th>일자</th>
					<th>입실시간</th>
					<th>퇴실시간</th>
					<th>총 수업시간</th>
					<th>시간 수정</th>
					<th>상태</th>
					<th>변경처리</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				String fkey = request.getParameter("fkey");
				String fvalue = request.getParameter("fvalue");
				String groupidx_s = request.getParameter("groupidx");
				String attendate_s = request.getParameter("attendate");
				
				int groupidx = 0;
				if(groupidx_s==null||groupidx_s.equals("")||groupidx_s.equals("null")){
					groupidx_s="0";
				}
				groupidx = Integer.parseInt(groupidx_s);
				System.out.println("학생 groupidx값" + groupidx);
				
				int midx = 2;
				
				java.sql.Date attendate = null;
				if(attendate_s!=null&&!attendate_s.equals("")){
					attendate = java.sql.Date.valueOf(attendate_s);
				}
				System.out.println("학생 attendate :" + attendate);
				
				ArrayList<RecordDTO> arr2 = null;
				if("name".equals(fkey) && fvalue !=null && !fvalue.equals("")){
					arr2 = mrdao.msAttendFind(fkey, fvalue);
				}else{
					arr2 = mrdao.msrecordSelectList(midx, groupidx, attendate);	
				}
				
				if(arr2==null||arr2.size()==0){
					if("name".equals(fkey) && fvalue != null && !fvalue.equals("")){
				%>
				<tr>
					<td colspan = "11" style="font-size:16px; padding:5px;"> 등록된 학생이 아닙니다. </td>
				</tr>
				<%
					}else{
				%>	
				<tr>
					<td colspan = "11" style="font-size:16px; padding:5px;"> 담당 반과 날짜를 선택해주세요. </td>
				</tr>
				<%
					}
				}else{
					for(int i =0; i<arr2.size(); i++){
						
						RecordDTO r2dto = arr2.get(i);
						String statusText = "";
						
						//status값 문자로 출력하기
						 switch (r2dto.getStatus()) {
			               case 1: statusText = "출석"; break;
			               case 3: statusText = "지각"; break;
			               case 4: statusText = "조퇴"; break;
			               case 5: statusText = "결석"; break;
			               case 6: statusText = "질병"; break;
			               default: statusText = "기타";
			           }	
				%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=arr2.get(i).getName() %></td>
					<td><%=arr2.get(i).getGroupname() %></td>
					<td><%=arr2.get(i).getClassname() %></td>
					<td><%=arr2.get(i).getattendate() %></td>
					<td><%=sdfDateTime.format(arr2.get(i).getIntime()) %></td>
					<td><%=sdfDateTime.format(arr2.get(i).getOuttime()) %></td>
					<td><%=arr2.get(i).getRecordtime() %>분</td>
					<td><input class = "upbt" type ="button" value="수정" onclick = "recordTimeUp('<%=arr2.get(i).getRecordidx()%>','<%=arr2.get(i).getRecordtime()%>','<%=arr2.get(i).getName()%>');"></td>
					<td><%=statusText%></td>		
					<td>
									
					<form class= "form-sclist" name="mteacherAttendList" method="post" action="/semi2_AcademicManage/manager/student/mrecordStatusUp_ok.jsp">
						<select class = "se-select" name = "status">
							<option value = "1" <%=r2dto.getStatus()==1?"selected":"" %>>출석</option>
							<option value = "3" <%=r2dto.getStatus()==3?"selected":"" %>>지각</option>
							<option value = "4" <%=r2dto.getStatus()==4?"selected":"" %>>조퇴</option>
							<option value = "5" <%=r2dto.getStatus()==5?"selected":"" %>>결석</option>
							<option value = "6" <%=r2dto.getStatus()==6?"selected":"" %>>질병</option>
						</select>
						<input type="hidden" name="groupidx" value="<%= groupidx_s %>">
						<input type="hidden" name="attendate" value="<%= attendate_s %>">
						<input type="hidden" name="recordidx" value="<%=arr2.get(i).getRecordidx()%>">
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