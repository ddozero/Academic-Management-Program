<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date"%>
<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO"></jsp:useBean>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<%

	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.table-info td:nth-child(2), .table-info th:nth-child(2) { /*강좌명 너비 조정*/
	width: 350px; 
	word-break: break-word;
}


.table-info td:nth-child(9), .table-info th:nth-child(9) { /*수정 너비 조정*/
	width: 80px; 
	word-break: break-word;
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

.LectureList-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}

</style>
<script>
	function timeDisplay(){
		var now=new Date();
		
		var y = now.getFullYear();  
		var m1 = now.getMonth()+1;    
		var d = now.getDate(); 
		
		var h=now.getHours();
		var m2=now.getMinutes();
		var s=now.getSeconds();
		var str=y+'-'+m1+'-'+d+'   '+h+':'+m2+':'+s;
		
		var timer=document.getElementById('timer');
		timer.innerHTML=str;
		
		window.setTimeout('timeDisplay()',1000);
	  }
</script>
</head>
<body onload="timeDisplay();">
<%@include file="/header/studentHeader.jsp"%>
<div class = "all-title1">
<h2><%=mdto.getName() %> 수강생님 입/퇴실 관리</h2> 
</div>

<section class="all-section1">
	<span>현재시간  <span id="timer">0000-00-00 00:00:00 </span></span>
	<span class="display: block;">
	<%
		rdto=srdao.studentShowAttend(mdto);
		
	
		Calendar now=Calendar.getInstance();
		int y=now.get(Calendar.YEAR);
		int m=now.get(Calendar.MONTH)+1;
		int d=now.get(Calendar.DATE);
		String temp1=y+"-0"+m+"-"+d;
		String temp2=null;
		String temp6=null;
		
		if(rdto!=null){
			temp2=rdto.getattendate().toString();
			temp6=rdto.getOuttime().toString();
			
			if(!temp2.equals(temp1)){ 
	%>
			<input style="float: right;" type="button" name="checkout" value="퇴실" onclick="window.alert('입실 처리되지 않았습니다.')">
			<input style="float: right;" type="button" name="checkin" value="입실"   onclick="location.href='studentAttend_ok.jsp?num=1'">
	<%		
			}else if(temp6.equals("0001-01-01 00:00:00.0")){
	%>		
			<input style="float: right;" type="button" name="checkout" value="퇴실" onclick="location.href='studentAttend_ok.jsp?num=2'">
	<%		
			}else {
	%>			
			
			
	<%			
			}
					
		}else{//아예 값이 없을때
	%>
			<input style="float: right;" type="button" name="checkout" value="퇴실" onclick="window.alert('입실 처리되지 않았습니다.')">
			<input style="float: right;" type="button" name="checkin" value="입실"   onclick="location.href='studentAttend_ok.jsp?num=1'">
	<%
		}
	%>
				
		
	
		
	</span>
</section>

<div class="all-title2">
<h2>입/퇴실 기록</h2>
</div>
<section class="all-section2">
	<article>
	<table class="table-info">
		<thead class="table-info-header">
			<tr>
				<th>NO</th>
				<th>수강강좌명</th>
				<th>날짜</th>
				<th>입실</th>
				<th>퇴실</th>
				<th>실수업시간</th>
				<th>구분</th>
			</tr>
		</thead>
		<tbody>
		<%
			
			
		
			SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss");
			String timeOnly="";
			String timeOnly2="";
		
			if (rdto != null && rdto.getIntime() != null) {
				
				timeOnly = sdf.format(rdto.getIntime()); 
			}
			
			if (rdto != null && rdto.getOuttime() != null) {
				if(sdf.format(rdto.getOuttime()).equals("00:00:00")){
					timeOnly2="";						
				}else{
					timeOnly2 = sdf.format(rdto.getOuttime()); 
						
				}
			}
			
				
			
			
			if(rdto==null||!temp2.equals(temp1)){
		%>		
			<tr>
				<td colspan="7">금일 입실 기록이 존재하지 않습니다.</td>
			</tr>	
		<%
			}else{
		 		
		 %>
			<tr>
				<td><%=rdto.getRecordidx() %></td>
				<td><%=rdto.getClassname() %></td>
				<td><%=rdto.getattendate() %></td>
				<td><%=timeOnly %></td>
				<td><%=timeOnly2 %></td>
		<%
			
		
		
				int temp4=rdto.getStatus();
				String temp5=null;		
				switch(temp4){
					case 1:temp5="출석";break;
					case 3:temp5="지각";break;
					case 4:temp5="조퇴";break;
					case 5:temp5="결석";break;
					case 6:temp5="질병";break;
					
				}
		
		%>		
				<td><%=rdto.getRecordtime() %></td>
				<td><%=temp5%></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
	</article>
</section>

<%@include file="/header/footer.jsp" %>
</body>
</html>