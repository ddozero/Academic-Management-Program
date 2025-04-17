<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.semi2.record.*"%>
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
</style>

<body>
<%@include file="/header/managerHeader.jsp"%>


 <div class = "all-title1">
  <h2>수강생 출결 인정 서류</h2>
  </div>
  
  <jsp:include page="mstudentAttendSearch_File.jsp"></jsp:include>
  
  <section class= "all-section1">
  	<table class="table-info">
		<thead class="table-info-header">
			<tr>
				<th>NO</th>
				<th>이름</th>
				<th>수강반명</th>
				<th>강좌명</th>
				<th>일자</th>
				<th>인정서류</th>
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
			String idx_s = request.getParameter("idx");
			
			int groupidx = 0;
			int idx = 0;
			if(groupidx_s==null||groupidx_s.equals("")){
				groupidx_s = "0";
			}
			
			if(idx_s!=null && !idx_s.equals("")){
				idx = Integer.parseInt(idx_s);
				mrdto.setIdx(idx);
			}
			System.out.println("mrdto.getIdx() 값: " + mrdto.getIdx());
			System.out.println("idx: " + idx);
			
			java.sql.Date attendate = null;
			if(attendate_s!=null&&!attendate_s.equals("")){
				attendate = java.sql.Date.valueOf(attendate_s);
			}
			System.out.println("수강생출결인정attendate값 :" + attendate);
			
			groupidx = Integer.parseInt(groupidx_s);
			System.out.println("수강생출결인정groupidx값 :" + groupidx);
			
			ArrayList<RecordDTO> arr = null;
		 	arr = mrdao.msRecordFile(idx, groupidx, attendate);

			
			//이름 검색 시 
			if ("name".equals(fkey) && fvalue != null && !fvalue.equals("")) {
   				arr = mrdao.attendFind(fvalue, groupidx, attendate);
			} else {
			    arr = mrdao.msRecordFile(idx, groupidx, attendate);
			}
						
			if(arr==null||arr.size()==0){
				if("name".equals(fkey) && fvalue != null && !fvalue.equals("")){
			%>
			<tr>
				<td colspan = "8" style="font-size:16px; padding:5px;"> 등록된 학생이 아닙니다. </td>
			</tr>
			<%
				}else{
			%>	
			<tr>
				<td colspan = "8" style="font-size:16px; padding:5px;"> 담당 반과 날짜를 선택해주세요. </td>
			</tr>
			<%
				}
			}else{
				for(int i = 0; i<arr.size(); i++){
					RecordDTO r2dto = arr.get(i);
					String statusText = "";
					
					//status값 문자 출력
					switch(r2dto.getStatus()){
					case 3 : statusText = "병가"; break;
					case 4 : statusText = "조퇴"; break;
					case 5: statusText = "휴가"; break;
					default : statusText = "기타";
					}
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=arr.get(i).getName()%></td>
				<td><%=arr.get(i).getGroupname() %></td>
				<td><%=arr.get(i).getClassname() %></td>
				<td><%=arr.get(i).getattendate() %></td>
				<td><a href = "<%=arr.get(i).getFilename() %>" download>서류확인</a></td>
				<td><%=statusText %></td>
				<td>
					<form class= "form-sclist" name="mteacherAttendFile" method="post" action="/semi2_AcademicManage/manager/student/mrecordStatusFileUp_ok.jsp">
					<input type="hidden" name = "idx" value = "<%=arr.get(i).getIdx() %>">
					
						<select class = "se-select" name = "status">
							<option value = "3" <%=r2dto.getStatus()==3?"selected":"" %>>병결(출석)</option>
							<option value = "4" <%=r2dto.getStatus()==4?"selected":"" %>>조퇴</option>
							<option value = "5" <%=r2dto.getStatus()==5?"selected":"" %>>휴가</option>
						</select>
						<input type="hidden" name="groupidx" value="<%= groupidx_s %>">
						<input type="hidden" name="attendate" value="<%= attendate_s %>">
						<input type="hidden" name="recordidx" value="<%= r2dto.getRecordidx()%>">
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