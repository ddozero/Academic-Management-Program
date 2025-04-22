<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.lecture.*" %>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO" ></jsp:useBean>
<jsp:useBean id="ldto" class="com.semi2.lecture.LectureDTO" ></jsp:useBean>

<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);	
	ldto=sldao.lectureDetail(classidx);

	ArrayList<LectureDTO> arr=sldao.lectureDetailList(classidx);
	
	
	
	String num_s=request.getParameter("num");
	int num=Integer.parseInt(num_s);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<script>


function showpopup(){
	var popupWidth = 500;  // 팝업 너비
	var popupHeight = 400;  // 팝업 높이

	// 팝업 중앙 위치 계산
	var left = (screen.width / 2) - (popupWidth / 2);
	var top = (screen.height / 2) - (popupHeight / 2);

    // 팝업을 열기
    window.open('studentLectureSubmit.jsp?classidx=<%=classidx%>','popup','width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left);
}


function showpopup2(){
	var popupWidth = 500;  // 팝업 너비
	var popupHeight = 400;  // 팝업 높이

	// 팝업 중앙 위치 계산
	var left = (screen.width / 2) - (popupWidth / 2);
	var top = (screen.height / 2) - (popupHeight / 2);
	
	// 팝업을 열기
	window.open('studentLectureDel.jsp?classidx=<%=classidx%>','popup','width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left);
			
}


</script>
<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 15px;
    text-align: left;
    height:300px;
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

.extra1{
	background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
    font-weight: bold;
}
.extra2{
	background-color: #567AF0;
    color: white;
    padding: 5px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;

}
.all-section-sldetail {
		margin-left: 320px; 
		background-color: #ffffff;
		padding: 20px 40px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		max-height: 650px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
  		height: 650px;
	}

</style>
</head>
<body>

<%@include file="/header/studentHeader.jsp"%>
<div class = "all-title1">
<h2>강좌 자세히 보기</h2>
</div>
<section class="all-section-sldetail">
	<article>
		<table class="table-info">
			<thead class="table-info-header">
			<tr>
				<th>강좌번호</th>
				<th>강좌명</th>
				<th>강사</th>
				<th>현재신청인원</th>
				<th>총인원</th>
				<th>개강일</th>
				<th>종강일</th>
				<th>총수강일</th>
			</tr>
			</thead>
			<tr>
		
				<td><%=ldto.getClassidx() %></td>
				<td><%=ldto.getClassname() %></td>
				<td><%=ldto.getTname() %></td>
				<td><%=ldto.getReqscount() %></td>
				<td><%=ldto.getEntirescount() %></td>
				<td><%=ldto.getComingdate() %></td>
				<td><%=ldto.getEnddate() %></td>
				<td><%=ldto.getEntiredate() %></td>
				
			</tr>
			<tr>
				<td colspan="8" class="extra1">강좌목차</td>
			</tr>
			<%
			if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan="2">준비중입니다.</td>
				
			</tr>
			<%
			}else{
				for(int i=0;i<arr.size();i++){
			%>
				<tr>
					<td class="extra1" ><%=arr.get(i).getWeeknum()%>주차</td>
					<td><%=arr.get(i).getWeekname() %></td>
					<td colspan="6"><%=arr.get(i).getWeekcon()%></td>
				</tr>
					
					
			<%		
				}
			}
			%>
			
			<tr>
				<td class="extra1">강좌세부내용</td>
				<td colspan="7"><%=ldto.getClassintro() %></td>
			</tr>
			<tr >
				<td colspan="6" style="border: none;"></td>
				<% 
				if(num==1){
				%>
				<td  colspan="2" style="border: none;  text-align: right;"><input type="button" value="신청하기" onclick="showpopup()" class="extra2"> <input type="button" value="뒤로가기" onclick="location.href='studentLectureList.jsp'" class="extra2"></td>
				<%
				}else{
				%>
				<td colspan="2" style="border: none;  text-align: right;"><input type="button" value="취소하기" onclick="showpopup2()" class="extra2"> <input type="button" value="뒤로가기" onclick="location.href='studentMyLecture.jsp'" class="extra2"></td>
				<%	
				}
				%>
			</tr>
		</table>
		
	</article>
</section>
<%@include file="/header/footer.jsp" %>
</body>
</html>