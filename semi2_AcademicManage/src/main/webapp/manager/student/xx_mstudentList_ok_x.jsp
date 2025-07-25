<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "java.util.*" %>    
    
<jsp:useBean id="mdto" class="com.semi2.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.semi2.member.MMemberDAO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");
%>
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
  font-size: 15px;
}

.header-style {
  width: 15%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
}

.cell-data {
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
  font-size: 15px;
}

.info-box{
	display: flex;
	align-items: flex-start; 
	gap: 20px; 
	margin: 20px auto; 
	
}

.image-placeholder img {
    width: 150px;
    height: 200px;
    margin-top:20px;
    object-fit: cover;
    border: 1px solid #ddd; 
    border: 1px solid #ddd; 
  	border-radius: 10px;
}

</style>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
</head>

<%
String idx_s = request.getParameter("idx");

if (idx_s == null || idx_s.equals("")) {
    idx_s = "0";
}
int idx = Integer.parseInt(idx_s);
System.out.println("idx: " + idx);

// DTO 객체 생성 및 데이터 조회
MemberDTO dto = mdao.mstudentInfoDetail(idx);
%>

<body>


  <form name = "mstudentInfo" method = "post">
  		<div class = "info-box">
            <!-- 이미지-->
            <div class="image-placeholder">
                <img src=<%=dto.getImgaddr() %> alt="학생정보테스트용">
            </div>
  		
  			<table class = "table-add">
  			<tr>
  			<th class = "header-style">이름</th>
  			<td class = "cell-data"><%=dto.getName() %></td>
  			<th class = "header-style">성별</th>
  			<td class = "cell-data"><%=dto.getSex() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">생년월일</th>
  			<td class = "cell-data"><%=dto.getBirth() %></td>
  			<th class = "header-style">주소</th>
  			<td class = "cell-data"><%=dto.getAddr() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">연락처</th>
  			<td class = "cell-data"><%=dto.getTel() %></td>
  			<th class = "header-style">이메일</th>
  			<td class = "cell-data"><%=dto.getEmail() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">학력</th>
  			<td class = "cell-data"><%=dto.getEdu() %></td>
  			<th class = "header-style">경력</th>
  			<td class = "cell-data"><%=dto.getLicen() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">수강반명</th>
  			<td class = "cell-data"><%=dto.getGroupname() %></td>
  			<th class = "header-style">강좌명</th>
  			<td class = "cell-data"><%=dto.getClassname() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">개강일</th>
  			<td class = "cell-data"><%=dto.getComingdate() %></td>
  			<th class = "header-style">종강일</th>
  			<td class = "cell-data"><%=dto.getEnddate() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">특이사항</th>
  			<td class = "cell-data" colspan ="3"><%=dto.getMemo() %></td>
  			</tr>
  		
  		</table>
	</div>
</form>

</html>