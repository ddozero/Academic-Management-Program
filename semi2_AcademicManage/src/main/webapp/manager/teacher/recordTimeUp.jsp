<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.semi2.record.*" %>
<jsp:useBean id="rdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<style>
.popup-container{
	display : flex;
	flex-direction: column; 
	align-items : center;
	overflow: hidden;
	justify-content: center;
	padding-top:10px;
    background-color: #fff; 
    z-index: 1000;
    text-align: center; 
    margin : 10px;
}


.popup-title{
	border-bottom: 3px solid #567AF0;
	width : 450px;
	margin-bottom: 15px;
}

.popup-title h4 {
	margin:0px;
	padding : 10px;
    font-size: 23px;
    color: #567AF0; /* 텍스트 색상 */
}

.popup-text{
	padding : 10px;
	font-size : 16px;
}

.popup-form-context input[type="text"]{
	width : 150px;
	height : 15px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 10px;
}

.popup-form-bt {
    display: flex;
    justify-content: center;
    align-items: center;    
}

.popup-form-bt input[type="submit"]{
	background: #567AF0;
	color: #fff;
	border: none;
	border-radius: 10px;
 	width: 80px;
	height: 32px;
	margin-top:20px;
}

.popup-text-plus{
	padding : 10px;
	font-size : 13px;
	color : #888;
}

</style>
</head>

<%
String tname = request.getParameter("tname");
String recordidx_s = request.getParameter("recordidx");
String recordtime_s = request.getParameter("recordtime");

int recordidx = 0;
int recordtime = 0;

if(recordidx_s != null && recordtime_s != null){
		recordidx = Integer.parseInt(recordidx_s);
		recordtime = Integer.parseInt(recordtime_s);
}
%>

<body>
<div class = "popup-container">
	<form name = "recordTimeUp" action = "recordTimeUp_ok.jsp" method="post">
		<div class = "all-popbox">
			<div class ="popup-title"><h4>총 근무시간 변경</h4></div>
			<input type="hidden" name="tname" value="<%= tname %>">
			<div class = "popup-text"> <%=tname %> 강사님의 변경하실 근무시간을 입력해주세요.</div>
			
			<div class = "popup-text-plus">총 근무시간 : 8시간(480분) <br> 반차기준 : 4시간(240분) </div>
			
			<div class = "popup-form-context">
			<input type="hidden" name="recordidx" value="<%= recordidx %>">
			<input type = "text" name = "recordtime" value="<%=recordtime %>">
			</div>
			
			<div class = "popup-form-bt"><input type = "submit" value ="수정하기"></div>
		</div>
	</form>
</div>
</body>
</html>