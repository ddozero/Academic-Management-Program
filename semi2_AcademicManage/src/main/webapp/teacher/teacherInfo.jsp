<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.member.*" %>
<%
MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
String id = mdto.getId();
int midx = mdto.getMidx();
int idx = mdto.getIdx();

TMemberDAO dao = new TMemberDAO();
MemberDTO dto = dao.getTeacherInfo(id, midx);

if (dto == null) {
    out.println("<script>alert('강사 정보를 불러올 수 없습니다.'); history.back();</script>");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type = "text/css" href="/semi2_AcademicManage/css/mainLayout.css"> 
<style>
   

.name-title {
   font-size: 20px;
   font-weight: bold;
   margin-top: 25px;
   margin-bottom: 15px;
}

.info-box{
	display: flex;
	align-items: flex-start; 
	gap: 20px; 
	margin: 20px auto; 
}
	
.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
  font-size: 15px;

}

.header-style {
  width: 10%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
    height : 50px;
}

.cell-data {
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
  font-size: 15px;
}
	
	
.image-placeholder {
    width: 180px; /* 원하는 크기로 조정 */
    height: 200px; /* 원하는 크기로 조정 */
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #ddd; 
    border-radius: 10px;
    margin-top:20px;
}
	
.image-placeholder img {
    width: 100%; /* 부모 요소 크기에 맞게 변경 */
    height: 100%; /* 부모 요소 크기에 맞게 변경 */
    object-fit: cover; /* 비율 유지하면서 채우기 */
}
	

.addbt {
   display: flex;
    justify-content: flex-end; 
    align-items: flex-end; 
    position: absolute;
    bottom: 130px;
    right: 40px;

}

.addbt input[type="button"]{
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

.addbt input[type="button"]:hover {
  background: #4569d6;
}
    
.all-section-ac {
	position: relative;
	margin-left: 320px; 
	margin-bottom: 10px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
	height : 650px;
	margin-bottom : 100px;
}
    
</style>
</head>
<body>
<%@include file = "../header/teacherHeader.jsp" %>

<div class="all-title1">
	<h2>My Information</h2>
</div>

<section class="all-section-ac">
  <div class="name-title"><%= dto.getName() != null ? dto.getName() : "이름없음" %> 강사님 정보</div>
  
  <div class="info-box">
     <div class="image-placeholder">
    	<img src=<%=dto.getImgaddr() %> alt="강사사진">
	</div>
	
      <table class="table-add">
        <tr>
          <th class = "header-style">이름</th>
          <td class = "cell-data"><%=dto.getName() %></td>
          <th class="header-style">성별</th>
          <td class = "cell-data"><%=dto.getSex() %></td>
        </tr>
        <tr>
          <th class = "header-style">생년월일</th>
          <%
		    String birth = dto.getBirth();
		    String birthOnlyDate = (birth != null && birth.length() >= 10) ? birth.substring(0, 10) : "";
  		  %>
  		  <td class = "cell-data"><%= birthOnlyDate %></td>
          <th class = "header-style">연락처</th>
          <td class = "cell-data"><%=dto.getTel() %></td>
        </tr>
        <tr>
       	  <th class = "header-style">이메일</th>
       	  <td class = "cell-data"><%=dto.getEmail() %></td>
          <th class = "header-style">주소</th>
          <td class = "cell-data"><%=dto.getAddr() %></td>
        </tr>
        <tr>
          <th class = "header-style">입사일</th>
          <td class = "cell-data"><%=dto.getComingdate() %></td>
          <th class = "header-style">학력</th>
          <td class = "cell-data"><%=dto.getEdu2() %></td>
        </tr>
        
        <tr>
	      <th class = "header-style">담당강좌명</th>
          <td class = "cell-data" colspan="3"><%=dto.getClassname() %></td>
        </tr>
        
        <tr>
          <th class = "header-style">반</th>
          <td class = "cell-data"><%=dto.getGroupname() %></td>
          <th class = "header-style">경력</th>
	      <td class = "cell-data"><%=dto.getCareer() %></td>
        </tr>
        
        <tr>
          <th class = "header-style">특이사항</th>
          <td class = "cell-data" colspan="3"><%=dto.getMemo() %></td>
        </tr>
      </table>


    <div class="addbt">
      <input type="button" value = "수정하기" onclick="location.href='teacherInfoUpdate.jsp'">
    </div>
  </div>

</section>
<%@include file = "../header/footer.jsp" %>
</body>
</html>