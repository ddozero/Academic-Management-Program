<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.semi2.member.*" %>

<%
	//String sname = (String)session.getAttribute("sname");
	MemberDTO dto=(MemberDTO)session.getAttribute("smdto");
	String sname=dto.getName();
%>

<header>
	<div class="container">
	   <div class="left-group">	
		<h1>
			<a href="#"> SYS Academy </a>
		</h1>
		<div class="user-group">
			<h4>수강생</h4>
		</div>
	   </div>
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
 
	<nav id="aside">
		<ul class="title-1">
			<li class="subt">출결 관리</li>
			<li><a href="#" class="active">내 정보</a></li>
			<li><a href="/semi2_AcademicManage/student/attendance/studentAttend.jsp">입실/퇴실</a></li>
			<li><a href="/semi2_AcademicManage/student/attendance/studentMyAttend.jsp">출석부</a></li>
			<li><a href="/semi2_AcademicManage/student/attendance/studentSubmitAbsence.jsp">조퇴 신청</a></li>
			<li><a href="/semi2_AcademicManage/student/attendance/studentCheckAbs.jsp"">조퇴 신청 내역</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">강좌 관리</li>
			<li><a href="/semi2_AcademicManage/student/studentlecture/studentLectureList.jsp">개설 강좌 조회</a></li>
			<li><a href="/semi2_AcademicManage/student/studentlecture/studentMyLecture.jsp">내 강좌 관리</a></li>
			<li><a href="/semi2_AcademicManage/student/test/studentTestList.jsp">시험 문제 풀기</a></li>
			<li><a href="/semi2_AcademicManage/student/test/studentScore.jsp">성적표 조회</a></li>
			<li><a href="/semi2_AcademicManage/student/esti/studentEstiTeacher.jsp"">강사 평가</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">게시판</li>
			<li><a href="/semi2_AcademicManage/server/freeBbsList.jsp">자유 게시판</a></li>
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