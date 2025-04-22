<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="com.semi2.member.*" %>
    <%@page import="com.semi2.board.*" %>
    <%@page import="com.semi2.group.*" %>
	<%@page import="java.util.ArrayList"%>
	<jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
	<jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
	<jsp:useBean id="gdao" class="com.semi2.group.AGroupDAO"></jsp:useBean>
<%
	ArrayList<BoardDTO> arr = bdao.bbsList();
	BoardDTO bdto = new BoardDTO();
%>
	<div class="all-title1">
		<h2>최신 게시글</h2>
	</div>
	<!-- 자유 게시판에 등록된 최근 등록물-->
	<section class="all-section1">
		<article>
			<span><strong><a href="/semi2_AcademicManage/server/freeBbsList.jsp">자유 게시판</a></strong></span>
			<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(arr==null || arr.size()==0){
						%>
					<tr>
						<td colspan="5">등록된 게시물이 없습니다.</td>
					</tr>
						<%					
					}else{
						System.out.println(arr.size());
						for(int i =  arr.size()-1; i >= 0 && i > arr.size() - 6; i--){
							bdto = arr.get(i);
							
							%>
					<tr>
						<td><%=bdto.getBoardidx() %></td>
						<td><%=bdto.getTitle() %></td>
						<td><%=bdto.getName() %></td>
						<td><%=bdto.getWritedate() %></td>
						<td><%=bdto.getReadnum() %></td>
					</tr>		
							<%
						}
					}
				%>

				</tbody>
			</table>
		</article>
	</section>
	<br>
<%
	String sort = "0";
	String accept = request.getParameter("accept");
	if(accept!=null)sort = accept;
	ArrayList<MemberDTO> marr = mdao.memSelect(sort);
	MemberDTO mdtoo = new MemberDTO();
%>
	<!-- 최근에 가입한 회원 -->
	<section class="all-section1">
		<span><strong><a href="/semi2_AcademicManage/server/memberAccept.jsp">최신 회원</a></strong></span>
		<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th>NO</th>
						<th>상태</th>
						<th>구분</th>
						<th>이름</th>
						<th>아이디</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(marr==null || marr.size()==0){
						%>
					<tr>
						<td colspan="6">등록된 게시물이 없습니다.</td>
					</tr>
						<%					
					}else{
						for (int i = marr.size() - 1; i >= 0 && i > marr.size() - 6; i--){
							mdtoo = marr.get(i);
							
							%>
					<tr>
						<td><%=mdtoo.getIdx() %></td>
						<%
							if(mdtoo.getAppro()==1){
						%>
							<td>[승인]</td>
						<%
							}else{
						%>
							<td>[대기]</td>
						<%
							}
							switch(mdtoo.getMidx()){
								case 1 :%><td>[관리자]</td><%break;
								case 2 :%><td>[수강생]</td><%break;
								case 3 :%><td>[강사]</td><%break;
								case 4 :%><td>[매니저]</td><%;
							}
								
						%>
						
						<td><%=mdtoo.getName() %></td>
						<td><%=mdtoo.getId() %></td>
					</tr>		
							<%
					}
					}
				%>
				</tbody>
			</table>
	</section>
	<br>

<%
	ArrayList<GroupDTO> garr = gdao.selectGroup();
	GroupDTO gdto = new GroupDTO();
%>
	<section class="all-section-3">
		<article>
			<span><strong><a href="/semi2_AcademicManage/server/addGroup.jsp?gidx=0">개설된 반</a></strong></span>
			<table class="table-info">
				<thead class="table-info-header">
					<tr>
						<th>NO</th>
						<th>반</th>
						<th>매니저</th>
						<th>강사</th>
						<th>총원</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(garr == null || garr.size()==0){
					%>
					<tr><td>등록된 반이 없습니다.</td></tr>
					<%
					}else{
						for(int i = garr.size() - 1; i >= 0 && i > garr.size() - 6; i--){
							gdto = garr.get(i);
						%>
						<tr>
							<td><%=gdto.getGroupidx() %></td>
							<td><%=gdto.getGroupname() %></td>
							<td><%=gdto.getMname()%></td>
							<td><%=gdto.getTname() %></td>
							<td><%=gdto.getScount() %></td>
						</tr>
						<%
						}
					}
				%>
				</tbody>
			</table>
		</article>
	</section>




	