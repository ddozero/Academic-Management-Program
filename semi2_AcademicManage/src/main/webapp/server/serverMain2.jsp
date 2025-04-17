<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
    <%@page import="com.semi2.board.*" %>
	<%@page import="java.util.ArrayList"%>
	<jsp:useBean id="bdao" class="com.semi2.board.ABoardDAO"></jsp:useBean>
<%
	ArrayList<BoardDTO> arr = bdao.bbsList();
	BoardDTO bdto = new BoardDTO();
%>
	<div class="all-title1">
		<h2>최신 게시글</h2>
	</div>
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
						for(int i =  arr.size()-1; i > arr.size()-5; i--){
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
