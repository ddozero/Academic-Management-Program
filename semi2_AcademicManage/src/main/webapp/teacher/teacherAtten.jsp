<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "com.semi2.record.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
String id = mdto.getId();
int midx = mdto.getMidx();
int idx = mdto.getIdx();
String name = mdto.getName();

TMemberDAO mtdao = new TMemberDAO();
TRecordDAO rdao = new TRecordDAO();
RecordDTO rdto = new RecordDTO();
rdao.getClassByName(rdto, name);
int classidx = rdto.getClassidx();
String classname = rdto.getClassname();
ArrayList<RecordDTO> arrdto = rdao.recordShow(midx);
SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SYS Academy</title>
  <link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
 <style>

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

.current-time{

	font-size:18px;
	color : #0E3CA5; 
	font-weight: bold;
}

.left-box {
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬 */
    align-items: center;
}

.left-box, .right-box{
	display: flex;
    align-items: center;
    gap: 10px;
    flex-wrap: wrap;
}

.right-box{
	display : flex;
	position: right;
}

.right-box input{
	margin-left : 10px;
}

.btn {
    background-color: #4c6ef5;
    color: white;
    padding: 5px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    width : 80px;
    height : 35px;
}

.btn:hover {
   background-color: #3b5cc7; /* 버튼 hover 효과 */
 }
 
 
.record-box h3 {
    font-size: 16px;
    margin-bottom: 10px;
}
    

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
    height : 40px;
}

.title-inner h4 {
	margin-top:16px;
    font-size: 20px; /* 원하는 크기로 조정 */
    font-weight: bold; /* 가독성을 높이기 위해 추가 */
}

.all-section-tattend{
	margin-left: 320px; 
	margin-bottom: 100px; 
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 550px; /* 높이 설정 */
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	height : 550px
}   

</style>
  
  
  <script>
    function noticeTime() {
      var now = new Date();

      var y = now.getFullYear();
      var mo = now.getMonth() + 1;
      var d = now.getDate();
      var h = now.getHours();
      var mi = now.getMinutes();
      var s = now.getSeconds();
      var str = y + '년 ' + mo + '월 ' + d + '일 ' + h + '시 ' + mi + '분 ' + s + '초';

      var timer = document.getElementById('timer');
      if (timer) {
        timer.innerHTML = str;
      }

      setTimeout(noticeTime, 1000);
    }
  </script>
</head>

<body onload="noticeTime()">
<%@ include file="../header/teacherHeader.jsp" %>

<div class="all-title1">
  <h2><%= mdto.getName() %> 강사님 출/퇴근 관리</h2>
</div>

<section class="all-section0">
<div class = "all-box">
	<div class ="left-box">
    <div class="current-time">현재 시간: <span id="timer"></span></div>
    </div>
    
    <div class="right-box">
	<!-- 출근 버튼 -->
	<form action="teacherAtten_ok.jsp" method="post">
		<input type="hidden" name="midx" value="<%= midx %>">
	    <input type="hidden" name="idx" value="<%= idx %>">
	    <input type="hidden" name="classidx" value="<%= classidx %>">
	    <input type="hidden" name="name" value="<%= name %>">
	    <button class="btn" type="submit" name="action" value="in">출근</button>
	</form>

 	<!-- 퇴근 버튼 -->
	<form action="teacherAtten_ok.jsp" method="post">
	    <input type="hidden" name="midx" value="<%= midx %>">
	    <input type="hidden" name="idx" value="<%= idx %>">
	    <input type="hidden" name="classidx" value="<%= classidx %>">
	    <input type="hidden" name="name" value="<%= name %>">
	    <button class="btn" type="submit" name="action" value="out">퇴근</button>
	</form>
</div>
</div>
 </section>
 
<section class="all-section-tattend">

<div class = "title-inner">
<h4>입퇴실 기록</h4>
</div>

<table class="table-info">
  <thead class="table-info-header">
    <tr>
      <th>NO</th>
      <th>담당강좌명</th>
      <th>날짜</th>
      <th>출근</th>
      <th>퇴근</th>
      <th>총 근무시간</th>
      <th>구분</th>
    </tr>
  </thead>
  <tbody>
  <% if (arrdto != null && !arrdto.isEmpty()) {
       for (int i = 0; i < arrdto.size(); i++) {
           RecordDTO r2dto = arrdto.get(i);
           String statusText;
           switch (r2dto.getStatus()) {
               case 1: statusText = "출근"; break;
               case 5: statusText = "결근"; break;
               default: statusText = "기타";
           }
  %>
    <tr>
      <td><%= i + 1 %></td>
      <td><%= rdto.getClassname() %></td>
      <td><%= r2dto.getattendate() %></td>
      <td><%= (r2dto.getIntime() != null) ? sdfDateTime.format(r2dto.getIntime()) : "-" %></td>
	  <td><%= (r2dto.getOuttime() != null) ? sdfDateTime.format(r2dto.getOuttime()) : "-" %></td>
      <td><%= r2dto.getRecordtime() %>분</td>
      <td><%= statusText %></td>
    </tr>
  <%   }
     } else { %>
    <tr><td colspan="7">출퇴근 기록이 없습니다.</td></tr>
  <% } %>
  </tbody>
</table>
</section>
<%@ include file="../header/footer.jsp" %>
</body>
</html>
