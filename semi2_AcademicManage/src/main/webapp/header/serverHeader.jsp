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
      <h1><a href="/semi2_AcademicManage/server/serverMain.jsp">SYS Academy</a></h1>
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
			<li><a href="/semi2_AcademicManage/server/memberAccept.jsp?idxx=0">회원 승인</a></li>
			<li><a href="/semi2_AcademicManage/server/addManager.jsp?sort=4&idxx=0">매니저 관리</a></li>
		</ul>

		<ul class="title-2">
			<li class="subt">반 관리</li>
			<li><a href="/semi2_AcademicManage/server/addGroup.jsp?gidx=0">반 등록</a></li>
		</ul>

		<ul class="title-3">
			<li class="subt">게시판</li>
			<li><a href="/semi2_AcademicManage/server/freeBbsList.jsp">자유게시판</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">취업알리미</a></li>
		</ul>

	</nav>
</header>

<script>
document.addEventListener("DOMContentLoaded", function () {
    var currentUrl = window.location.pathname + window.location.search;
    var menuLinks = document.querySelectorAll("#aside ul li a");

    menuLinks.forEach(link => {
        var href = link.getAttribute("href");
        if (currentUrl === href) {
            link.classList.add("active");
        } else {
            link.classList.remove("active");
        }
    });
});
</script>
