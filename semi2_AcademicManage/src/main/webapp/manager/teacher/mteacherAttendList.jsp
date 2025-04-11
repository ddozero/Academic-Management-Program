<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 1번 열: NO */
.table-info th:nth-child(1),
.table-info td:nth-child(1) {
  width: 5%;
}

/* 2번, 3번, 7번, 8번 열: 이름, 수강반명, 상태, 변경처리 */
.table-info th:nth-child(2),
.table-info td:nth-child(2),
.table-info th:nth-child(3),
.table-info td:nth-child(3),
.table-info th:nth-child(7),
.table-info td:nth-child(7),
.table-info th:nth-child(8),
.table-info td:nth-child(8) {
  width: 10%;
}

/* 4번 열: 강좌명 */
.table-info th:nth-child(4),
.table-info td:nth-child(4) {
  width: 25%;
}

/* 5번, 6번 열: 입실시간, 퇴실시간 */
.table-info th:nth-child(5),
.table-info td:nth-child(5),
.table-info th:nth-child(6),
.table-info td:nth-child(6) {
  width: 15%;
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
					<th>입실시간</th>
					<th>퇴실시간</th>
					<th>상태</th>
					<th>변경처리</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>				
					<td>
					<form class= "form-sclist" name="managerLectureList" method="post" action="/semi2_AcademicManage/manager/teacher/mteacherAttendList.jsp">
						<select class = "se-select" name = "fkey">
							<option value = "attend1">출근</option>
							<option value = "attend2">결근</option>
							<option value = "attend3">지각</option>
							<option value = "attend4">휴가</option>
							<option value = "attend5">병가</option>
						</select>
						<input type="hidden" name="classidx" value="">
						<input type="submit" value="변경">
					</form>
					</td>
				</tr>
			
			</tbody>
		</table>
	</section>
	
	

<%@include file="/header/footer.jsp"%>
</body>
</html>