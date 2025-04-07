<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
	
<%
	String sname = (String)session.getAttribute("sname");
%>

<header>
	<div class="container">
		<h1>
			<a href="#"> SYS Academy </a>
		</h1>
		<div class="user-group">
			<h4>매니저</h4>
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
			<li class="subt">근태 관리</li>
			<li><a href="#" class="active">내 정보</a></li>
			<li><a href="#">출/퇴근 관리</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">수강생 관리</li>
			<li><a href="#">수강생 정보</a></li>
			<li><a href="#">수강생 출결 조회</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">강좌 관리</li>
			<li><a href="#">강좌 현황</a></li>
			<li><a href="#">세부 강좌 등록</a></li>
			<li><a href="#">시험 등록</a></li>
			<li><a href="#">강좌 평가 조회</a></li>
		</ul>

		<ul class="title-4">
			<li class="subt">게시판</li>
			<li><a href="#">공지사항</a></li>
		</ul>

		<ul class="title-select">
			<li class="subt-select"><a href="https://www.naver.com/"
				class="drive-link">드라이브</a></li>
		</ul>
	</nav>
</header>