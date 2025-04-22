<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.lecture.*"%>
<%@ page import="com.semi2.group.*"%>
<%@ page import="com.semi2.member.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="mldao" class="com.semi2.lecture.MLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<style>
.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
  font-size : 15px;
}

.header-style {
  width: 15%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  
}

.cell-data {
  width : 25%;
  text-align: center;
  padding: 3px;
  border: 1px solid #ddd;
}


input[type="text"], input[type="date"], select {
  border : none;
  background-color:transparent;
  outline:none;
  width: calc(100% - 20px);
  padding: 5px;
  margin: 5px 0;
  box-sizing: border-box;
  font-size : 15px;
}


select {
  border: 1px solid #ccc; 
  border-radius: 5px;
  padding: 5px; 
  background-color: #fff; 
  box-sizing: border-box; 
}

.addbt {
  display: flex; /* 가로정렬 */
  justify-content: flex-end; /* 오른쪽정렬 */
  align-items: center; 
  gap: 8px; 
  margin-top: 20px; 
}

.addbt input[type="submit"]{
	  background: #567AF0;
	  color: #fff;
	  border: none;
	  border-radius: 10px;
	  width: 80px;
	  height: 32px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  cursor: pointer;
}

.addbt input[type="button"] {
	  background: #fff;
	  color: #777777;
	  border: 1px solid #d9d9d9;
	  border-radius: 10px;
	  width: 80px;
	  height: 32px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  cursor: pointer;
}

.addbt input[type="submit"]:hover {
  background: #4569d6;
}

.all-section-mup {
		margin-left: 320px; 
		background-color: #ffffff;
		padding: 20px 40px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		height : 650px;
		max-height: 650px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
  		margin-bottom: 100px;
}
</style>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>
<body>
<%@include file="/header/managerHeader.jsp"%>
	<%
	
	String idx_s = request.getParameter("classidx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int classidx = Integer.parseInt(idx_s);
	ManagerLectureDTO dto = mldao.managerLectureUpSh(classidx);
	if (dto == null) {
	%>
	<script>
		window.alert("수정할 값을 전부 입력해주세요.")
		history.back();
	</script>
	<%
	return;
	}
	%>
  <div class = "all-title1">
  <h2>강좌 수정</h2>
  </div>
	<section class="all-section-mup">
		<form name="managerLectureUp" action="/semi2_AcademicManage/manager/lecture/managerLectureUp_ok.jsp" method="post">
			<input type="hidden" name="classidx" value="<%=dto.getClassidx()%>">
			<table class = "table-add">
				<tr>
					<th class="header-style">강좌명</th>
					<td class="cell-data" colspan="3"><input type="text" name="classname" value = "<%=dto.getClassname()%>"></td>
				</tr>

				<tr>
					<th class="header-style">담당강사</th>
					<td class="cell-data" style = "color: #888;"><%=dto.getTname() %></td>

					<th class="header-style">담당매니저</th>
					<td class="cell-data" style = "color: #888;"><%=dto.getChargemname() %></td>
				</tr>

				<%
				ArrayList<GroupDTO> garr = mldao.managerLecturePick();
				%>
				<tr>
					<th class="header-style">수강반명</th>
					<td class="cell-data" style = "color: #888;"><%=dto.getGroupname()%></td>
					<th class="header-style">총수강일</th>
					<td class="cell-data"><input type="text" name="entiredate" value = "<%=dto.getEntiredate()%>"></td>
				</tr>

				<tr>
					<th class="header-style">개강일</th>
					<td class="cell-data"><input type="date" name="comingdate" value="<%=dto.getComingdate()%>"></td>
					<th class="header-style">종강일</th>
					<td class="cell-data"><input type="date" name="enddate" value="<%=dto.getEnddate() %>"></td>
				</tr>
				
				<tr>
					<th class="header-style">총인원</th>
					<td class="cell-data"><input type="text" name="entirescount" value="<%=dto.getEntirescount()%>"></td>
					<th class="header-style">현재인원</th>
					<td class="cell-data"><input type="text" name="reqscount" value="<%=dto.getReqscount() %>"></td>
				</tr>
				
				 <tr>
			        <th class="header-style">강좌 개요</th>
			        <td class = "cell-data" colspan="3"><input type="text" name = "classintro" value="<%=dto.getClassintro() %>" placeholder="수정할 내용을 입력해주세요"></td>
			     </tr>
				</tbody>
			</table>
				<div class="addbt">
					<input type="submit" value="수정하기"> 
					<input type="button" value="취소하기" onclick="location.href='/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp'">
				</div>
		</form>
	</section>

<%@include file="/header/footer.jsp"%>
</body>
</html>