<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.*" %>
<jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<meta charset="UTF-8">
<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
    text-align: left;
}


.table-info-header th {
    background-color: #f4f4f4;
    color: #333;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
}

.table-info td {
    padding: 3px;
    border: 1px solid #ddd;
    text-align: center;
}
.table-info td form input[type="submit"]{
	background: #fff;
	color: #777777;
	border: 1px solid #d9d9d9;
	border-radius: 10px;
	width: 50px;
	height:28px;
	cursor: pointer;
}
button {
	background-color : #B5C6FF;
	border : none;
	padding : 2px 6px;
	border-radius : 20px;
}
select, input[type="text"] {
	padding : 6px;
	border : 1px solid #D8D8D8;
	border-radius : 4px;
}
.top {
	overflow : hidden;
	margin-bottom : 10px;
}
.left {
	float: left;
}
.right{
	float: right;
}
.left button {
	margin-left: 6px;
}
.right select,
.right input,
.right button {
	margin-left: 6px;
}
   .all-section-ac {
	margin-left: 320px; 
	margin-bottom: 10px;
	background-color: #ffffff;
	padding: 20px 40px;
	border-radius: 10px;
	max-width: calc(100% - 360px);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	max-height: 1000px; /* 높이 설정 */
 		overflow-y: auto; /* 세로 스크롤 추가 */
}
</style>
<script>
	function showDetail(idx) {
	    var accept = document.getElementById("accept");
	    if (accept.checked) {
	        location.href="memberAccept.jsp?accept=1&idx=" + idx
	    }else{
		    location.href="memberAccept.jsp?accept=&idx=" + idx
	    }
	}
	function deletee(idx){
		location.href="deleteMember_ok.jsp?member=1&idx="+idx;
	}
</script>
<title>회원 승인 목록</title>
</head>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s==null)idx_s="0";
	int idx = Integer.parseInt(idx_s);
	
	String idxx_s = request.getParameter("idxx");
	int[] idxHidden = mdao.addHiddenIdx(session, idxx_s);
	
	String sort = "0";
 	String accept = request.getParameter("accept");
	if(accept!=null)sort = accept;
	 
	ArrayList<MemberDTO> arr = mdao.memSelect(sort);
	MemberDTO dto2 = mdao.memberFind(idx);
%>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<div class="all-title1">
		<h2>회원 승인 목록</h2>
	</div>
	<section class="all-section-ac">
		<article>
			<div class="inner">
				<div class="top">
					<div class="left">
						<span><b>승인 목록</b></span>
						<select>
							<option>전체조회</option>
							<option>수강생</option>
							<option>강사</option>
							<option>매니저</option>
						</select>
						<input type="checkbox" id="accept" <%=sort.equals("1") ? "checked" : "" %>>승인대기
						<script>
							var check = document.getElementById("accept");
							check.addEventListener("change",function(){
								 showDetail(<%=idx%>)
							})
						</script>
					</div>
					<div class="right">
						<select>
							<option>검색조건</option>
							<option>아이디</option>
							<option>이름</option>
						</select>
						<input type="text" placeholder="조건을 선택해주세요.">
						<input type="submit" value="검색">
					</div>
				</div>

				<table class="table-info">
					<thead class="table-info-header">
						<tr>
							<th></th>
							<th>NO</th>
							<th>상태</th>
							<th>구분</th>
							<th>이름</th>
							<th>아이디</th>
							<th>처리</th>
						</tr>
					</thead>
					<tbody>
						<%
							if(arr == null || arr.size()==0){
							%>
								<tr><td colspan="7">가입한 계정이 없습니다.</td></tr>
							<%
							}else {
								for (int i = 0; i < arr.size(); i++) {
								    MemberDTO dto = arr.get(i);
								    
								    boolean hidden = false;
								    if (idxHidden != null && idxHidden[0] != 0) {
								        for (int j = 0; j < idxHidden.length; j++) {
								            if (dto.getIdx() == idxHidden[j]) {
								                hidden = true;
								                break;
								            }
								        }
								    }
								    if (hidden)continue;
								%>
									<tr onclick="showDetail(<%=dto.getIdx()%>)">
									
										<td><input type="checkbox" <%= dto.getIdx() == idx ? "checked" : "" %>></td>
										<td><%=dto.getIdx() %></td>
										<%
											if(dto.getAppro()==1){
										%>
											<td>[승인]</td>
										<%
											}else{
										%>
											<td>[대기]</td>
										<%
											}
											switch(dto.getMidx()){
												case 1 :%><td>[관리자]</td><%break;
												case 2 :%><td>[수강생]</td><%break;
												case 3 :%><td>[강사]</td><%break;
												case 4 :%><td>[매니저]</td><%;
											}
												
										%>
										
										<td><%=dto.getName() %></td>
										<td><%=dto.getId() %></td>
										<% 
											if(dto.getAppro()==0){
										%>
										<td><a href="memberAccept_ok.jsp?idx=<%=dto.getIdx()%>">승인</a></td>
										<%
											}else{
										%>
										<td><button>완료</button></td>
										<%
											}
										%>
									</tr>
								<%
								}
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="1"></td>
							<td colspan="5" style="text-align:center;">
								1 2 3 4 5
							</td>
							<td colspan="1" style="text-align:center;">
								<input type="button" value="삭제" onclick="deletee(<%=idx%>)">
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</article>
	</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>