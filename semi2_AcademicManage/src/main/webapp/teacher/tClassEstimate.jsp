<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.semi2.lecture.*"%>
<%@ page import="com.semi2.member.*"%>

<jsp:useBean id="mldto" class="com.semi2.lecture.ManagerLectureDTO" />
<jsp:useBean id="mldao" class="com.semi2.lecture.TLectureDAO" />

<%
MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
String tname = mdto.getName();

String classidxParam = request.getParameter("classidx");
int selectedClassidx = classidxParam != null ? Integer.parseInt(classidxParam) : -1;

ArrayList<ManagerLectureDTO> list = mldao.findLectureByTname(tname);
ArrayList<ManagerLectureDTO> estimateList = new ArrayList<>();
int averageScore = 0;

mldto = null;
if (list != null && list.size() > 0) {
    if (selectedClassidx != -1) {
        for (ManagerLectureDTO dto : list) {
            if (dto.getClassidx() == selectedClassidx) {
                mldto = dto;
                break;
            }
        }
    } else {
        mldto = list.get(0);
        selectedClassidx = mldto.getClassidx();
    }
    // 평가 메모 목록 조회
    estimateList = mldao.getEstimateMemo(selectedClassidx);

    // 평균점수 계산
    int totalScore = 0;
    int count = 0;
    for (ManagerLectureDTO e : estimateList) {
        totalScore += e.getEstinum();
        count++;
    }
    averageScore = count > 0 ? (int)Math.round((double)totalScore / count) : 0;
}
%>

<!DOCTYPE html>
<html lang="ko">
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
    .info-box {
      background-color: #e8efff;
      border: 1px solid #aac8ff;
      padding: 10px 20px;
      border-radius: 6px;
      margin-bottom: 20px;
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      font-size: 14px;
      align-items: center;
    }
    .table-box {
      border: 1px solid #ddd;
      overflow: hidden;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }
    thead {
      background-color: #f1f1f1;
    }
    th, td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #e5e5e5;
    }
    td.memo {
      text-align: center;
    }
    
.all-section-tcesiti{
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
  <h2><%= mldto != null ? mldto.getClassname() : "강좌 없음" %> 강좌 평가 조회</h2>
</div>

<section class="all-section-tcesiti">
  <div class="form-row">
  <form method="get" action="tClassEstimate.jsp">
  <label for="course">강좌명</label>
  <select id="course" name="classidx">
    <% for (ManagerLectureDTO dto : list) { %>
      <option value="<%= dto.getClassidx() %>" <%= (dto.getClassidx() == selectedClassidx) ? "selected" : "" %>>
        <%= dto.getClassname() %>
      </option>
    <% } %>
  </select>
  <button type="submit">조회</button>
  </form>
  </div>
  
  <div class="info-box">
    <% if (mldto != null) { %>
      <div>개강일 : <%=mldto.getComingdate()%></div>
      <div>종강일 : <%=mldto.getEnddate()%></div>
      <div>총 평가점수 : <%= averageScore %>점</div>
    <% } else { %>
      <div>강좌 정보를 불러올 수 없습니다.</div>
    <% } %>
  </div>

<% if (classidxParam != null) { %>	
  <div class="table-box">
    <table>
      <thead>
        <tr>
          <th>NO</th>
          <th>평가 메모</th>
          <th>평가 점수</th>
        </tr>
      </thead>
      <tbody>
        <%
        int index = 1;
        for (ManagerLectureDTO dto : estimateList) {
        %>
        <tr>
          <td><%= index++ %></td>
          <td class="memo"><%= dto.getEsticon() %></td>
          <td><%= dto.getEstinum() %>점</td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
<% } %>

</section>
<%@ include file="../header/footer.jsp" %>
</body>
</html>