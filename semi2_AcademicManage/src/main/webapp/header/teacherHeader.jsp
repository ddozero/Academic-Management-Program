<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.semi2.member.*" %>
<%
	MemberDTO dto1=(MemberDTO)session.getAttribute("smdto");
	String sname=dto1.getName();
%>
<header>
	<div class="container">
		<div class="left-group">
			<h1>
				<a href="#">SYS Academy</a>
			</h1>
			<div class="user-group">
				<h4>강사</h4>
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
			<li class="subt">근태 관리</li>
			<li><a href="/semi2_AcademicManage/teacher/teacherInfo.jsp" class="active">내정보</a></li>
			<li><a href="/semi2_AcademicManage/teacher/teacherAtten.jsp">출/퇴근 관리</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">수강생 관리</li>
			<li><a href="/semi2_AcademicManage/teacher/tStudentMemo.jsp">수강생 정보</a></li>
			<li><a href="/semi2_AcademicManage/teacher/LStudentAtten.jsp">담당강좌 수강생 출결 조회</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">강좌 관리</li>
			<li><a href="/semi2_AcademicManage/teacher/teacherLectureList.jsp">담당강좌 관리</a></li>
			<li><a href="/semi2_AcademicManage/teacher/tTestManagement.jsp">시험 등록</a></li>
			<li><a href="/semi2_AcademicManage/teacher/testSubmitCheck.jsp">시험 제출 조회현황</a></li>
			<li><a href="/semi2_AcademicManage/teacher/tClassEstimate.jsp">강좌 평가 조회</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">게시판</li>
			<li><a href="#">공지사항</a></li>
		</ul>

		<ul class="title-select">
			<li class="subt-select"><a href="#">수업용 드라이브</a></li>
		</ul>

	</nav>
</header> 
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