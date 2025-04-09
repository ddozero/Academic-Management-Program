<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>

<%
	MemberDTO smdto = (MemberDTO)session.getAttribute("smdto");
	String sname = smdto.getName();
%>

<header>
	<!-- 여기부터 추가 -->
  <div class="container">
    <div class="left-group">
      <h1><a href="#">SYS Academy</a></h1>
      <div class="user-group">
        <h4>관리자</h4>
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
			<li class="subt">회원 관리</li>
			<li><a href="/semi2_AcademicManage/server/memberAccept.jsp">회원 승인</a></li>
			<li><a href="/semi2_AcademicManage/server/addManager.jsp?sort=4" >매니저 관리</a></li>
			<li><a href="#"class="active">강사 조회</a></li>
			<li><a href="#">수강생 조회</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">반 관리</li>
			<li><a href="#">반 등록</a></li>
			<li><a href="#">비품 관리</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">게시판</li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">취업알리미</a></li>
		</ul>

	</nav>
</header>