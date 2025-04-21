<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.lecture.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@page import = "java.util.*" %>

<jsp:useBean id="gdto" class="com.semi2.group.GroupDTO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:useBean id="mldao" class="com.semi2.lecture.MLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">

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

.addbt input[type="reset"] {
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

/* 강좌등록 section 별도 수정 */
.all-section-madd {
		margin-left: 320px; 
		background-color: #ffffff;
		padding: 20px 40px;
		border-radius: 10px;
		max-width: calc(100% - 360px);
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
		height : 350px;
		max-height: 350px; /* 높이 설정 */
  		overflow-y: auto; /* 세로 스크롤 추가 */
}

</style>

</head>
<body>
  <%@include file="/header/managerHeader.jsp"%>
  
  <div class = "all-title1">
  
  <h2>강좌 개설</h2>
  
  </div>
  
  
  <section class= "all-section-madd">
  
    <form name="mnagerLectureAdd" action="managerLectureAdd_ok.jsp" method="post">
      <table class = "table-add">
        <tr>
          <th class="header-style">강좌명</th>
          <td class="cell-data" colspan="3"><input type="text" name="classname" placeholder="강좌명을 입력하세요"></td>
        </tr>
        
        <tr>
          <th class="header-style">담당강사</th>
          <td class="cell-data">
            <select name="tname">
              <% 
                ArrayList<MemberDTO> tarr = mldao.managerMemberPick(3);
                if (tarr == null || tarr.size() == 0) {
              %>
                <option value="">강사 없음</option>
              <% } else {
                for (int i = 0; i < tarr.size(); i++) { %>
                <option value="<%=tarr.get(i).getName()%>"><%=tarr.get(i).getName()%></option>
              <% }
              } %>
            </select>
          </td>
          
          <th class="header-style">총수강일</th>
          <td class="cell-data"><input type="text" name="entiredate" placeholder="총수강일을 입력하세요"></td>

        </tr>

    
        <tr>
          <th class="header-style">개강일</th>
          <td class="cell-data"><input type="date" name="comingdate"></td>
          <th class="header-style">종강일</th>
          <td class="cell-data"><input type="date" name="enddate"></td>
        </tr>
        
        <tr>
          <th class="header-style">총 인원</th>
          <td class="cell-data"><input type="text" name="entirescount" placeholder="총인원을 입력하세요"></td>
          <th class="header-style">현재 인원</th>
          <td class="cell-data"><input type="text" name="reqscount" placeholder="현재인원을 입력하세요"></td>
        </tr>
        
        <tr>
        <th class="header-style">강좌 개요</th>
        <td class = "cell-data" colspan="3"><input type="text" name = "classintro"></td>
        </tr>
        
        
      </table>
        <div class = "addbt">
            <input type="submit" value="등록하기">
            <input type="reset" value="초기화">
        </div>
    </form>
  </section>
    
     <div class = "all-title2">
  		<h2>개설 강좌 목록</h2>
 	</div>
    <section class = "all-section2">
      <jsp:include page="managerLectureInfo.jsp"></jsp:include>
    </section>


<%@include file="/header/footer.jsp"%>
</body>
</html>