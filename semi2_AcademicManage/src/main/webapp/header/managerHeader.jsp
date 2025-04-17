<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.semi2.member.*" %>
<%
MemberDTO dto1=(MemberDTO)session.getAttribute("smdto");
String sname=dto1.getName();
%>
<header>
	<!-- 여기부터 추가 -->
  <div class="container">
    <div class="left-group">
      <h1><a href="/semi2_AcademicManage/server/serverMain.jsp">SYS Academy</a></h1>
      <div class="user-group">
        <h4>매니저</h4>
      </div>
    </div>
    <div class="right-group">
   		<div class="id-group">
			<%
				if(sname != null){
			%>
				<span><%=sname %>님</span>
				<a href="/semi2_AcademicManage/server/logout.jsp">로그아웃</a>
			<%
				}
			%>
		</div>
    </div>
  </div>

	<nav id="aside">
		<ul class="title-1">
			<li class="subt">수강생</li>
			<li><a href="/semi2_AcademicManage/manager/student/mstudentList.jsp" class="active">수강생 정보</a></li>
			<li><a href="/semi2_AcademicManage/manager/student/mstudentAttendList.jsp">수강생 출결 관리</a></li>
			<li><a href="/semi2_AcademicManage/manager/student/mstudentAttendFile.jsp">출결 인정 서류</a><li>
		</ul>

		<ul class="title-2">
			<li class="subt">강사</li>
			<li><a href="/semi2_AcademicManage/manager/teacher/mteacherList.jsp" class="active">강사 정보</a></li>
			<li><a href="/semi2_AcademicManage/manager/teacher/mteacherAttendList.jsp">강사 근태 관리</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">강좌 관리</li>
			<li><a href="/semi2_AcademicManage/manager/lecture/managerLectureAdd.jsp">강좌 개설</a></li>
			<li><a href="/semi2_AcademicManage/manager/lecture/managerLectureList.jsp">강좌 세부정보</a></li>
			<li><a href="/semi2_AcademicManage/manager/lecture/lectureStudentList.jsp">강좌별 수강생 현황</a></li>
		</ul>

		<ul class="title-4">
			<li class="subt">게시판</li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">취업 알리미</a></li>
		</ul>

		<ul class="title-select">
			<li class="subt-select"><a href="https://www.naver.com/"
				class="drive-link">학원 드라이브</a></li>
		</ul>
	</nav>
</header>

<!-- 메뉴 선택시 색변경(전체 헤더에 공통 적용해야함) -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    var menuLinks = document.querySelectorAll("#aside ul li a");

    // URL 경로 가져오기
    var currentUrl = window.location.pathname;

    menuLinks.forEach(link => {
        if (link.getAttribute("href") === currentUrl) {
            link.classList.add("active");
        } else {
            link.classList.remove("active"); // 기존 active 제거
        }
    });
});
</script>
