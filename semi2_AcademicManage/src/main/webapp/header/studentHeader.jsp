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
			<h4>수강생</h4>
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
			<li><a href="#">입실/퇴실</a></li>
			<li><a href="#">출결 인정 신청</a></li>
			<li><a href="#">출결 신청 내역</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">강좌 관리</li>
			<li><a href="#">개설 강좌 조회</a></li>
			<li><a href="#">내 강좌 관리</a></li>
			<li><a href="#">시험 문제 풀기</a></li>
			<li><a href="#">성적표 조회</a></li>
			<li><a href="#">강사 평가</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">게시판</li>
			<li><a href="#">증빙 게시판</a></li>
			<li><a href="#">자유 게시판</a></li>
		</ul>
		
	</nav>
</header>