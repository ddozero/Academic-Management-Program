<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.test.*" %>
<%@ page import="com.semi2.member.*" %>

<jsp:useBean id="tDAO" class="com.semi2.test.TTestDAO" />

<%
request.setCharacterEncoding("utf-8");

MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
String tname = mdto.getName();
ArrayList<Map<String, Object>> classList = tDAO.getClassListByTname(tname);

// classidx 선택값
String classidxParam = request.getParameter("classidx");
int selectedClassidx = (classidxParam != null) ? Integer.parseInt(classidxParam) : 0;

// 필터 처리
String filterParam = request.getParameter("filter");
boolean filterUnsubmitted = "unsubmitted".equals(filterParam);
boolean filterSubmitted = "submitted".equals(filterParam);

// 시험 결과 목록
ArrayList<TestDTO> resultList = new ArrayList<>();
if (selectedClassidx > 0) {
    resultList = tDAO.getTestSubmitMaxScoreList(selectedClassidx);
}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>SYS Academy</title>
  <link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">
  <style>

    .form-row {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 20px;
    }
    select, button {
      height: 32px;
      border-radius: 4px;
      border: 1px solid #ccc;
      padding: 0 10px;
      font-size: 14px;
    }
    button {
      background-color: #567AF0;
      color: white;
      border: none;
      cursor: pointer;
    }
    button:hover {
      background-color: #2244cc;
    }
    .table-box {
      border: 1px solid #ddd;
      overflow: hidden;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 15px;
    }
    thead {
      background-color: #f1f1f1;
    }
    th, td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #e5e5e5;
    }
    
.all-section-tscheck{
	margin-left: 320px; 
	margin-bottom: 50px;
	background-color: #ffffff;
	padding: 20px 30px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 650px; /* 높이 설정 */
  	overflow-y: auto; /* 세로 스크롤 추가 */
  	overflow-x: hidden;
  	margin-bottom : 100px;
  	height: 650px;
}
  </style>
</head>
<body>

<%@ include file="../header/teacherHeader.jsp" %>

<div class="all-title1">
  <h2>시험 제출 조회현황</h2>
</div>

<section class="all-section-tscheck">
  <form method="get" action="testSubmitCheck.jsp" class="form-row">
    <label for="classidx">강좌명</label>
    <select name="classidx" id="classidx">
      <% for (Map<String, Object> map : classList) {
           int classidx = (Integer) map.get("classidx");
           String cname = (String) map.get("classname");
      %>
        <option value="<%= classidx %>" <%= (classidx == selectedClassidx ? "selected" : "") %>><%= cname %></option>
      <% } %>
    </select>
    
    <div style="margin-left: 20px; display: flex; gap: 10px;">
      <button type="submit">전체 보기</button>
      <button type="submit" name="filter" value="submitted">제출 학생만 보기</button>
      <button type="submit" name="filter" value="unsubmitted">미제출 학생만 보기</button>
    </div>
  </form>

  <div class="table-box">
    <table>
      <thead>
        <tr>
          <th>NO</th>
          <th>이름</th>
          <th>수강 반명</th>
          <th>강좌명</th>
          <th>상태</th>
          <th>점수</th>
        </tr>
      </thead>
      <tbody>
        <%
        int no = 1;
        for (TestDTO dto : resultList) {
            int submit = dto.getSubmit();
            if (filterUnsubmitted && submit == 1) continue;
            if (filterSubmitted && submit == 0) continue;

            String name = dto.getSanswer();
            String groupname = dto.getRightanswer();
            String classname = dto.getClassname();
            int totalscore = dto.getTotalscore();
        %>
        <tr>
          <td><%= no++ %></td>
          <td><%= name != null ? name : "-" %></td>
          <td><%= groupname != null ? groupname : "-" %></td>
          <td><%= classname != null ? classname : "-" %></td>
          <td style="color: <%= submit == 1 ? "green" : "gray" %>;">
            <%= submit == 1 ? "제출" : "미제출" %>
          </td>
          <td>
            <% if (submit == 1) { %>
              <%= totalscore %>점
            <% } else { %>
              -
            <% } %>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</section>

<%@ include file="../header/footer.jsp" %>
</body>
</html>