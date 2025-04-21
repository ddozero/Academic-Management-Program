<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi2.member.*" %>
    
<%
	MemberDTO ssmdto = (MemberDTO)session.getAttribute("smdto");
	int sidx = ssmdto.getIdx();
	System.out.println("sdix="+sidx);
%>
    <jsp:useBean id="smdao" class="com.semi2.member.SMemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    height:50px;
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
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}
.table-info td input[type="text"]{
    padding: 3px;
    border: 1px solid #fff;
    text-align: center;
    height:50px;
}
input[readonly] {
  background-color: #f0f0f0;
  color: #999;
  border: 1px solid #ccc;
  cursor: not-allowed;
}
.image-placeholder img {
    width: 200px;
    height: 250px;
    margin-top:20px;
    object-fit: cover;
    border: 1px solid #ddd; 
    border: 1px solid #ddd; 
  	border-radius: 10px;
}
.inner {
  display: flex;
  gap: 20px;
  align-items: flex-start;
}

.image-placeholder {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  gap: 10px;
}

.table-inner {
  flex: 8;
}
.all-section-ac {
	margin-left: 320px; 
	margin-bottom: 10px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 1000px; /* 높이 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
}
input[type="submit"],input[type="button"] {
    background-color: #4c6ef5;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
}
</style>
<title>Insert title here</title>
</head>
<%
	MemberDTO sdto = smdao.memberFind(sidx);
%>
<body>
	<%@ include file="/header/studentHeader.jsp" %>
		<div class="all-title1">
			<h2>My Information</h2>
		</div>
		<section class="all-section-ac">
			<article>
				<span><strong>내 정보 수정</strong></span>
				<form action="stuUpdate.jsp" method="post">
				<div class="inner">
					<div class="image-placeholder">
			 			 <img src="/semi2_AcademicManage/img/<%=sdto.getImgaddr() %>" alt="이미지테스트">
			  			<div style="text-align:center; margin-top:10px;">
			    			<input type="button" value="업로드" onclick="window.open('studentInfoImg.jsp?idx=<%=sdto.getIdx() %>','form','width=600px,height=400px')">
			 			 </div>
					</div>
	        <div class="table-inner">
				<table class="table-info">
	            <thead class="table-info-header">
	              <tr>
	                <th>이름</th>
	                <td><input type="text" name="name" value="<%=sdto.getIdx()==1 ? "" : sdto.getName()%>"></td>
	                <th>성별</th>
	                <td>
	                  <input type="text" name="sexx" value="<%=sdto.getIdx()==1 ? "" : (sdto.getSex().equals("F") ? "여자" : "남자")%>">
	                  <input type="hidden" name="sex" value="<%=sdto.getSex()%>">
	                </td>
	              </tr>
	              <tr>
	                <th>생년월일</th>
	                <td><input type="text" name="birth" value="<%=sdto.getIdx()==1 ? "" : sdto.getBirth().substring(0, 10)%>"></td>
	                <th>주소</th>
	                <td><input type="text" name="addr" value="<%=sdto.getIdx()==1 ? "" : sdto.getAddr()%>"></td>
	              </tr>
	              <tr>
	                <th>연락처</th>
	                <td><input type="text" name="tel" value="<%=sdto.getIdx()==1 ? "" : sdto.getTel()%>" onkeypress="onlyNum(event)"></td>
	                <th>이메일</th>
	                <td><input type="text" name="email" value="<%=sdto.getIdx()==1 ? "" : sdto.getEmail()%>"></td>
	              </tr>
	              <tr>
  	                <th>담당반</th>
	                <td><input type="text" name="groupname"  placeholder="-" value="<%=sdto.getIdx()==1 ? "" : sdto.getGroupname()%>"></td>
	                <th>경력</th>
	                <td><input type="text" name="career"  placeholder="-" value="<%=sdto.getIdx()==1 ? "" : sdto.getCareer()%>"></td>
	              </tr>
	              <tr>
	                <th>특이사항</th>
	                <td colspan="3"><input type="text" name="memo"  placeholder="-" value="<%=sdto.getIdx()==1 ? "" : sdto.getMemo()%>"></td>
	              </tr>
	            </thead>
	          </table>
	          <div   style="text-align:right; margin-top: 10px">
	          <input type="hidden" name="idx" value="<%=sdto.getIdx()%>">
	        	<input type="submit" value="저장">  	
       		</div>
	          	</div>
	          </div>
	          </form>
			</article>
		</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>