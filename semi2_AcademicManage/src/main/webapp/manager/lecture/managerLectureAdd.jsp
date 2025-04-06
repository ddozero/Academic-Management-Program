<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi2.lecture.*" %>
<%@ page import = "com.semi2.group.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@page import = "java.util.*" %>

<jsp:useBean id="gdto" class="com.semi2.group.GroupDTO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.semi2.lecture.ManagerLectureDTO"></jsp:useBean>
<jsp:useBean id="mldao" class="com.semi2.lecture.ManagerLectureDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYS Academy</title>

<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">

</head>
<body>
  <%@include file="/header/managerHeader.jsp"%>

  <section>
    <form name="mnagerLectureAdd" action="managerLectureAdd_ok.jsp" method="post">
      <table border = "1px">
        <tr>
          <th>강좌명</th>
          <td colspan="3"><input type="text" name="classname" placeholder="강좌명을 입력하세요"></td>
        </tr>
        
        <tr>
          <th>담당강사</th>
          <td>
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
          
          <th>담당매니저</th>
          <td>
            <select name="chargemname">
              <% 
                ArrayList<MemberDTO> marr = mldao.managerMemberPick(4);
                if (marr == null || marr.size() == 0) { 
              %>
                <option value="">매니저 없음</option>
              <% } else {
                for (int i = 0; i < marr.size(); i++) { %>
                <option value="<%=marr.get(i).getName()%>"><%=marr.get(i).getName()%></option>
              <% }
              } %>
            </select>
          </td>
        </tr>

        <tr>
          <th>수강반명</th>
          <td>
            <select name="groupname">
              <% 
                ArrayList<GroupDTO> arr = mldao.managerLecturePick();
                if (arr == null || arr.size() == 0) { 
              %>
                <option value="">개설반 없음</option>
              <% } else {
                for (int i = 0; i < arr.size(); i++) { %>
                <option value="<%=arr.get(i).getGroupname()%>"><%=arr.get(i).getGroupname()%></option>
              <% }
              } %>
            </select>
          </td>
          <th>총수강일</th>
          <td><input type="text" name="entiredate" placeholder="총수강일을 입력하세요"></td>
        </tr>

        <tr>
          <th>개강일</th>
          <td><input type="date" name="comingdate"></td>
          <th>종강일</th>
          <td><input type="date" name="enddate"></td>
        </tr>

        <tr>
          <td colspan="4" style="text-align: center;">
            <input type="submit" value="등록하기">
            <input type="reset" value="초기화">
          </td>
        </tr>
      </table>
    </form>
    
    <br>
    <div>
      <jsp:include page="managerLectureInfo.jsp"></jsp:include>
    </div>
  </section>



<%@include file="/header/footer.jsp"%>
</body>
</html>