<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
    <%@page import="com.semi2.member.*" %>
	<jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
<script>
	function managerJoin(){
		window.open("memberJoin.jsp?mem=","memberJoin","width=600,height=800,left=300,top=100,scrollbars=yes");
	}
	function showDetail(idx){
		location.href="addManager.jsp?sort=4&idx="+idx;
	}
	function deletee(idx){
		location.href="deleteMember_ok.jsp?idx="+idx;
	}
	function memUpdate(idx){
		location.href="addManager.jsp?sort=4&idx="+idx+"&update=";
	}
	function onlyNum(event){
		if (event.keyCode >= 48 && event.keyCode <= 57){
			return
		}
		event.preventDefault();
	}
</script>
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
.table-info td input[type="text"]{
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
}
input[readonly] {
  background-color: #f0f0f0;
  color: #999;
  border: 1px solid #ccc;
  cursor: not-allowed;
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
input[type="submit"],input[type="button"] {
    background-color: #567AF0;
    color: white;
    padding: 3px 7px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

.all-section-etc{
	margin-left: 320px; 
	margin-bottom: 100px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 400x; /* 높이 설정 */
 	overflow-y: auto; /* 세로 스크롤 추가 */
 	height : 400px;

}
</style>
<title>Insert title here</title>
</head>
<%
	String sort = request.getParameter("sort");

	String idx_s = request.getParameter("idx");
	if(idx_s==null)idx_s = "0";
	int idx = Integer.parseInt(idx_s);
	
	String idxx_s = request.getParameter("idxx");
	int[] idxHidden = mdao.addHiddenIdx(session, idxx_s);
	
	String update = request.getParameter("update");
	if(update==null){
		update="1";
	}
	
	ArrayList<MemberDTO> arr = mdao.memSelect(sort);
	MemberDTO dto2 = mdao.memberFind(idx);
%>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>매니저 관리</h2>
	</div>
	<section class="all-section1">
		<article>
			<span><strong>매니저 목록</strong></span>
			<input type="button" value="계정 추가" onclick="managerJoin()">
			<input type="button" value="삭제" onclick="deletee('<%=idx%>')">
			<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th></th>
						<th>NO</th>
						<th>이름</th>
						<th>아이디</th>
						<th>연락처</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<% if (arr == null || arr.size() == 0) { %>
					<tr>
						<td colspan="7">등록된 매니저 계정이 없습니다.</td>
					</tr>
					<% } else {
						for (int i = 1; i < arr.size(); i++) {
							MemberDTO dto = arr.get(i);
							boolean hidden = false;
							if (idxHidden != null && idxHidden[0] != 0) {
								for (int j = 0; j < idxHidden.length; j++) {
									if (dto.getIdx() == idxHidden[j]) {
										hidden = true;
										break;
									}
								}
							}
							if (hidden) continue;
					%>
					<tr onclick="showDetail('<%=dto.getIdx()%>')" id="check">
						<td><input type="checkbox" <%= dto.getIdx() == idx ? "checked" : "" %>></td>
						<td><%=i%></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getId()%></td>
						<td><%=dto.getTel()%></td>
						<td><%=dto.getEmail()%></td>
					</tr>
					<% }	} %>
				</tbody>
			</table>
		</article>
	</section>
	
	<br>

	<section class="all-section-etc">
	  <article>
	    <span><strong>매니저 세부 정보</strong></span>
	    <form action="memberUpdate_ok.jsp" method="post">
	      <div class="inner">
			<div class="image-placeholder">
			  <img src="/semi2_AcademicManage/img/<%=dto2.getImgaddr() %>" alt="이미지테스트">
			  <div style="text-align:center; margin-top:10px;">
			    <input type="button" value="업로드" onclick="window.open('addManagerImg.jsp?idx=<%=dto2.getIdx() %>','form','width=600px,height=400px')">
			  </div>
			</div>

	
	        <div class="table-inner">
	          <table class="table-info">
	            <thead class="table-info-header">
	              <tr>
	                <th>이름</th>
	                <td><input type="text" name="name" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : dto2.getName()%>"></td>
	                <th>성별</th>
	                <td>
	                  <input type="text" name="sexx" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : (dto2.getSex().equals("F") ? "여자" : "남자")%>">
	                  <input type="hidden" name="sex" value="<%=dto2.getSex()%>">
	                </td>
	              </tr>
	              <tr>
	                <th>생년월일</th>
	                <td><input type="text" name="birth" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : dto2.getBirth().substring(0, 10)%>"></td>
	                <th>주소</th>
	                <td><input type="text" name="addr" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : dto2.getAddr()%>"></td>
	              </tr>
	              <tr>
	                <th>연락처</th>
	                <td><input type="text" name="tel" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : dto2.getTel()%>" onkeypress="onlyNum(event)"></td>
	                <th>이메일</th>
	                <td><input type="text" name="email" <%=update.equals("1") ? "readonly" : ""%> value="<%=dto2.getIdx()==1 ? "" : dto2.getEmail()%>"></td>
	              </tr>
	              <tr>
	                <th>입사일</th>
	                <td><input type="text" name="comingdate" readonly value="<%=dto2.getIdx()==1 ? "" : dto2.getComingdate()%>" title="계정을 회원가입한 당일이 입사날짜 입니다."></td>
	                <th>경력</th>
	                <td><input type="text" name="career" <%=update.equals("1") ? (dto2.getCareer()==null ? "" : "readonly") : ""%> placeholder="-" value="<%=dto2.getIdx()==1 ? "" : dto2.getCareer()%>"></td>
	              </tr>
	              <tr>
	                <th>담당반</th>
	                <td><input type="text" name="groupname" <%=update.equals("1") ? (dto2.getGroupname()==null ? "" : "readonly") : ""%> placeholder="-" value="<%=dto2.getIdx()==1 ? "" : dto2.getGroupname()%>"></td>
	                <th>특이사항</th>
	                <td><input type="text" name="memo" <%=update.equals("1") ? (dto2.getMemo()==null ? "" : "readonly") : ""%> placeholder="-" value="<%=dto2.getIdx()==1 ? "" : dto2.getMemo()%>"></td>
	              </tr>
	            </thead>
	          </table>
	          <div style="text-align:right; margin-top: 10px;">
	            <input type="button" onclick="memUpdate(<%=dto2.getIdx()%>)" value="수정">
	            <input type="hidden" name="idx" value="<%=dto2.getIdx()%>">
	            <input type="submit" value="등록">
	          </div>
	        </div>
	      </div>
	    </form>
	  </article>
	</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>