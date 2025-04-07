<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String saveid="";

Cookie cks[]=request.getCookies();
if(cks!=null){
   for(int i=0;i<cks.length;i++){
       if (cks[i].getName().equals("saveid")) {
           saveid = cks[i].getValue();
      }
   }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
	article, table { margin: 0 auto; text-align: center; }
	
</style>
<script>
	function valid() {
		if(document.login.id.value == '') {
			alert('아이디를 입력해주세요');
			document.login.id.focus();
			return false;
		}
		if(document.login.pwd.value == '') {
			alert('비밀번호를 입력해주세요');
			document.login.pwd.focus();
			return false;
		}
		if(document.login.autoinput.value == '') {
			alert('자동방지 번호를 입력해주세요');
			document.login.autoinput.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<%@ include file="/header/mainHeader.jsp" %>
<section>
	<article>
		<h2>로그인</h2>
		<form name="login" action="login_ok.jsp" method="post" onsubmit="return valid()">
			<table>
				<tr>
					<td><label>아이디</label>
					<input type="text" name="userid" value="<%=saveid%>"></td>
				</tr>
				<tr>
					<td><label>비밀번호</label>
					<input type="password" name="userpwd"></td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="saveid" value="on" <%= saveid.equals("") ? "" : "checked" %>> 아이디 저장하기
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="autoonly" readonly>
						<input type="text" name="autoinput" placeholder="자동방지 입력">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인">
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
<%@ include file="/header/footer.jsp" %>
</body>
</html>
