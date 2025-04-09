<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.lecture.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
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
}


</style>


</head>

<%
	String idx_s = request.getParameter("classidx");

	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int classidx = Integer.parseInt(idx_s);
	
	System.out.println("classidx: " + classidx);

	ManagerLectureDTO dto = mldao.managerLectureList(classidx);
	if (dto == null) {
	%>
	<script>
		window.alert("세부 강좌 등록 준비중입니다.")
		location.href = '/semi2_AcademicManage/manager/lecture/managerLectureList.jsp';
	</script>
	<%
	return;
	}
%>

<body>
  <%@include file="/header/managerHeader.jsp"%>

    <form name="mnagerLectureList">
      <table class = "table-add">
        <tr>
          <th class="header-style">강좌명</th>
          <td class="cell-data" colspan="3"><%=dto.getClassname() %></td>
        </tr>
        
        <tr>
          <th class="header-style">담당강사</th>
          <td class="cell-data"><%=dto.getTname() %></td>
          
          <th class="header-style">담당매니저</th>
          <td class="cell-data"><%=dto.getChargemname() %></td>
        </tr>

        <tr>
          <th class="header-style">수강반명</th>
          <td class="cell-data"><%=dto.getGroupname() %></td>
          <th class="header-style">총수강일</th>
          <td class="cell-data"><%=dto.getEntiredate() %></td>
        </tr>

        <tr>
          <th class="header-style">개강일</th>
          <td class="cell-data"><%=dto.getComingdate() %></td>
          <th class="header-style">종강일</th>
          <td class="cell-data"><%=dto.getEnddate() %></td>
        </tr>
        
        <tr>
        <th class="header-style">강좌 개요</th>
        <td class = "cell-data" colspan="3"><%=dto.getClassintro() %></td>
        </tr>
      </table>
    </form>



<%@include file="/header/footer.jsp"%>
</body>
</html>