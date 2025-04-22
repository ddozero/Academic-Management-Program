<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%
MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
int midx = mdto.getMidx();
String name = mdto.getName();
String mmidx_s = request.getParameter("mmidx");
if(mmidx_s == null){
	mmidx_s = "1";
}
int mmidx = Integer.parseInt(mmidx_s);
System.out.println(mmidx);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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
.table-info td form input[type="submit"]{
	background: #fff;
	color: #777777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}
button {
	background-color : #B5C6FF;
	border : none;
	padding : 2px 6px;
	border-radius : 20px;
}
select, input[type="text"] {
	padding : 6px;
	border : 1px solid #D8D8D8;
	border-radius : 4px;
}
.top {
	overflow : hidden;
	margin-bottom : 10px;
}
.left {
	float: left;
}
.right{
	float: right;
}
.left button {
	margin-left: 6px;
}
.right select,
.right input,
.right button {
	margin-left: 6px;
}

.all-section-3{
	margin-left: 320px; 
	margin-bottom: 100px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 1000px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
}
</style>
</head>
<body>
<%
	if(mmidx == 4){
%>
	<%@ include file="/header/managerHeader.jsp" %>
<%
	} else {
		// mmidx가 없거나 2~4가 아니면 midx 기준으로 분기
		if(midx == 1){
%>
	<%@ include file="/header/serverHeader.jsp" %>
<%
		} else if(midx == 2){
%>
	<script>
		location.href="/semi2_AcademicManage/student/myInfo/studentMyinfo.jsp";
	</script>
<%
		} else if(midx == 3){
%>
	<script>
		location.href="/semi2_AcademicManage/teacher/teacherInfo.jsp";
	</script>
<%
		} else if(midx == 4){
%>
	<script>
		location.href="/semi2_AcademicManage/manager/student/mstudentList.jsp";
	</script>
<%
		}
	}
%>
<%@ include file="serverMain2.jsp" %>
<%@include file="/header/footer.jsp"%>
</body>
</html>
