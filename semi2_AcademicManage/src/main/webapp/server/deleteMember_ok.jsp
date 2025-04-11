<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	int result = mdao.memberDelete(idx);
	String msg = result > 0 ? "삭제되었습니다." : "실패하였습니다.";
	String member = request.getParameter("member");
	if("1".equals(member)){
		if(result < 0){
			%>
			<script>
				window.alert('숨김처리 되었습니다.');
				location.href='memberAccept.jsp?idxx='+<%=idx%>;
			</script>
			<%
		}else{
			%>
			<script>
				window.alert('<%=msg%>');
				location.href="memberAccept.jsp?idx=0";
			</script>
			<%
		}
	}else{
		if(result < 0){
			%>
			<script>
				window.alert('숨김처리 되었습니다.');
				location.href="addManager.jsp?sort=4&idxx="+<%=idx%>;
			</script>
			<%
		}else{
			%>
			<script>
				window.alert('<%=msg%>');
				location.href="addManager.jsp?sort=4&idx=1";
			</script>
			<%
		}
	} 
%>