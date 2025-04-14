<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.record.*" %>

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
    var url = 'recordTimeUp.jsp?recordidx=' + recordidx + '&recordtime=' + recordtime + '&tname=' + tname;
    window.open(
        url,
        'recordTimeUp',
        'width=' + Width + ',height=' + Height + ',left=' + xPos + ',top=' + yPos + ',toolbars=no,resizable=no,scrollbars=no'
    );
}
</script>

<body>
	<div class = "all-title1">
 	 <h2>강사 근태 관리</h2>
	</div>

	<jsp:include page="mteacherAttendSearch.jsp"></jsp:include>
	
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
					<th>총 근무시간</th>
					<th>시간 수정</th>
					<th>상태</th>
					<th>변경처리</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				String fkey = request.getParameter("fkey"); //이름검색 : name
				String fvalue = request.getParameter("fvalue");
				String groupidx_s = request.getParameter("groupidx");
				String attendate_s = request.getParameter("attendate");

				int groupidx = 0;
				
				if(groupidx_s==null||groupidx_s.equals("")){
					groupidx_s = "0";
				}
				groupidx = Integer.parseInt(groupidx_s);
				System.out.println("groupidx값 :" + groupidx); //반번호 결과값 출력
				int midx = 3; //선생님 3값만 조회
				
				java.sql.Date attendate = null;
				if(attendate_s!=null&&!attendate_s.equals("")){
					attendate = java.sql.Date.valueOf(attendate_s);
				}
				System.out.println("attendate :" + attendate); //날짜 결과 값 출력
				
				ArrayList<RecordDTO> arr = null;
				if("name".equals(fkey) && fvalue != null && !fvalue.equals("")){
					arr = mrdao.attendFind(fvalue, groupidx, attendate);
				}else{
					arr = mrdao.recordSelectList(midx, groupidx, attendate);
				}
				
				
				if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan = "11" style="font-size:16px; padding:5px;"> 담당 반과 날짜를 선택해주세요. </td>
				</tr>
				<%
				}else{
					for(int i =0; i<arr.size(); i++){
				%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=arr.get(i).getName()%></td>
					<td><%=arr.get(i).getGroupname() %></td>
					<td><%=arr.get(i).getClassname() %></td>
					<td><%=arr.get(i).getattendate() %>
					<td><%=arr.get(i).getIntime() %></td>
					<td><%=arr.get(i).getOuttime() %></td>
					<td><%=arr.get(i).getRecordtime() %>분</td>
					<td><input class = "upbt" type ="button" value="수정" onclick = "recordTimeUp('<%=arr.get(i).getRecordidx()%>','<%=arr.get(i).getRecordtime()%>','<%=arr.get(i).getName()%>');"></td>
					<td><%=arr.get(i).getStatus() %></td>		
					<td>
									
					<form class= "form-sclist" name="mteacherAttendList" method="post" action="/semi2_AcademicManage/manager/teacher/mteacherAttendList.jsp">
						<select class = "se-select" name = "fkey">
							<option value = "attend1">출근</option>
							<option value = "attend2">결근</option>
							<option value = "attend3">지각</option>
							<option value = "attend4">반차</option>
							<option value = "attend5">휴가</option>
							<option value = "attend6">병가</option>
						</select>
						<input type="hidden" name="groupidx" value="<%=arr.get(i).getGroupidx()%>">
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