<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.semi2.member.*" %>
<%@ page import = "com.semi2.group.*" %>

<jsp:useBean id="mdao" class="com.semi2.member.MMemberDAO"></jsp:useBean>
<jsp:useBean id="mrdao" class="com.semi2.record.MRecordDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>SYS Academy</title>
<link rel="stylesheet" type="text/css" href="/semi2_AcademicManage/css/mainLayout.css">

<style>
.table-info {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 15px;
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

.table-info td form input[type="submit"]:hover {
  	color: #567AF0; /* 텍스트 색상 변경 */
}

.list-alert{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center;
	font-size: 16px;
	color: #333;
}

/* 검색창 디자인 */
.se-Find {
    float: right; 
    margin: 10px 0; 
}

form[name="mstudentFind"] {
    float: right;
}

.sebt{ 
    background: #d8d8d8;
    color: #333;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    width: 50px;
    height: 28px;
    cursor: pointer;
}

.search-button:hover {
    color: #567AF0;
}

.se-select { 
    background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    width: 80px;
    height: 28px;
    cursor: pointer; /* 커서 모양 */
    padding : 5px;
}


.se-select:focus {
    outline: none; 
}

.setxt{
	width : 200px;
	height : 28px;
	background: #fff;
    color: #333;
    border: 1px solid #d6d6d6; 
    border-radius: 5px;
    padding : 5px;
}

.total-count p{
	font-size: 14px;
	color : #666;
	margin-top:15px;
}


/**section2 디자인*/
.table-add {
  width: 100%;
  border-collapse: collapse;
  margin: 20px auto;
  border-radius : 10px;
  font-size: 15px;
}

.header-style {
  width: 15%;
  text-align: center;
  border: 1px solid #ddd;
  white-space: nowrap;
  background-color: #eee;
  font-size : 15px;
}

.cell-data {
  width : 25%;
  text-align: left;
  padding: 10px;
  border: 1px solid #ddd;
  font-size: 15px;
}

.info-box{
	display: flex;
	align-items: flex-start; 
	gap: 20px; 
	margin: 20px auto; 
	
}

.image-placeholder img {
    width: 150px;
    height: 200px;
    margin-top:20px;
    object-fit: cover;
    border: 1px solid #ddd; 
    border: 1px solid #ddd; 
  	border-radius: 10px;
}

</style>

</head>

<script>
	function mstudentList(){
		location.href="freeBbsList.jsp";
	}
</script>

<body>

<div class = "all-title1">
  <h2>수강생 정보 관리</h2>
</div>
 <section class= "all-section1">
  	<%@include file="/header/managerHeader.jsp"%>
<%
String idx = request.getParameter("idx");
String fkey = request.getParameter("fkey");
String fvalue = request.getParameter("fvalue");

ArrayList<MemberDTO> arr = null;



%>
    <article>
		<form class = "se-Find" name="mstudentFind" method="post" action="mstudentList.jsp">
			<select class= "se-select" name = "fkey">
				<option value = "">전체</option>
				<option value = "name">이름</option>
			</select>
			<input class = "setxt" type="text" name = "fvalue">
			<input class = "sebt" type="submit" value="검색">
		</form>

		<table class="table-info">
			<thead class="table-info-header">
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>반배정</th>
					<th>세부정보</th>
				</tr>
			</thead>
			
			<tbody>
				<%
	
				
				if(fkey == null || fvalue == null || fkey.equals("") || fvalue.equals("")){
					arr = mdao.mstudentInfo(2);
				}else{
					arr = mdao.mstudentFind(fkey, fvalue);
				}
				
				if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan = "8"> 등록된 수강생이 없습니다.</td>
				</tr>					
				<%
				}else{
					for(int i = 0; i<arr.size(); i++){
				%>	
				<tr>
					<td><%=i+1%></td>
					<td><%=arr.get(i).getName() %></td>
					<td><%=arr.get(i).getSex() %></td>
					<td><%=arr.get(i).getBirth() %></td>
					<td><%=arr.get(i).getTel() %></td>
					<td><%=arr.get(i).getEmail() %></td>
					<td>
					<form class = "search" name = "selectList" method="post" action = "msgroupSelect_ok.jsp">
					<input type="hidden" name="idx" value="<%=arr.get(i).getIdx() %>">
					<select class = "se-select" name = "groupidx">
					<option value = "" selected> 반 선택 </option>
				<%
					ArrayList<GroupDTO> arr2 = mrdao.groupSelect();
					if(arr2==null||arr2.size()==0){
				%>
						<option value = ""> 미정 </option>
				<%
					}else{
						for(int j = 0; j<arr2.size(); j++){
				%>		
						<option value="<%=arr2.get(j).getGroupidx()%>"><%=arr2.get(j).getGroupname()%></option>
				<%
						}
					}	
				%>	
					</select>
					<input class = "sebt" type="submit" value="배정">
					</form>
					
					</td>
					<td>
					<form name="managerstudentList" method="post" action="/semi2_AcademicManage/manager/student/mstudentList.jsp">
					<input type="hidden" name="idx" value="<%=arr.get(i).getIdx()%>">
					<input type="submit" value="조회">
					</form>
					</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</article>
</section>

  
<div class = "all-title2">
		<h2>수강생 정보</h2>
	</div>
	<section class= "all-section2">
	
	 <%
    if(idx == null||idx.equals("")){
    %>
    	<p class= "list-alert">학생 세부정보를 확인하시려면 '보기' 버튼을 클릭하세요.</p>
    <%
    }else{
    %>
    <%
	String idx_s = request.getParameter("idx");


	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}
	int idx2 = Integer.parseInt(idx_s);
	System.out.println("idx: " + idx);
	
	MemberDTO dto = mdao.mstudentInfoDetail(idx2);
	
	if(dto==null){
%>
	<script>
		window.alert("학생 정보 등록 중입니다.")
		location.href = '/semi2_AcademicManage/manager/student/mstudentList.jsp';
	</script>
	
	<%
	return;
	}
%>


  <form name = "mstudentInfo" method = "post">
  		<div class = "info-box">
            <!-- 이미지-->
            <div class="image-placeholder">
                <img src=<%=dto.getImgaddr() %> alt="학생정보테스트용">
            </div>
  		
  			<table class = "table-add">
  			<tr>
  			<th class = "header-style">이름</th>
  			<td class = "cell-data"><%=dto.getName() %></td>
  			<th class = "header-style">성별</th>
  			<td class = "cell-data"><%=dto.getSex() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">생년월일</th>
  			<td class = "cell-data"><%=dto.getBirth() %></td>
  			<th class = "header-style">주소</th>
  			<td class = "cell-data"><%=dto.getAddr() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">연락처</th>
  			<td class = "cell-data"><%=dto.getTel() %></td>
  			<th class = "header-style">이메일</th>
  			<td class = "cell-data"><%=dto.getEmail() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">학력</th>
  			<td class = "cell-data"><%=dto.getEdu() %></td>
  			<th class = "header-style">수강반명</th>
  			<td class = "cell-data"><%=dto.getGroupname() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">강좌명</th>
  			<td class = "cell-data" colspan = "3" ><%=dto.getClassname() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">개강일</th>
  			<td class = "cell-data"><%=dto.getComingdate() %></td>
  			<th class = "header-style">종강일</th>
  			<td class = "cell-data"><%=dto.getEnddate() %></td>
  			</tr>
  			
  			<tr>
  			<th class = "header-style">특이사항</th>
  			<td class = "cell-data" colspan ="3"><%=dto.getMemo() %></td>
  			</tr>
  		
  		</table>
	</div>
</form>
    
 
	<%
    }
	%>	
	</section>

<%@include file="/header/footer.jsp"%>
</body>
</html>