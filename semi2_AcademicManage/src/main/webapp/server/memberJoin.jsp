<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
	<script>
		function addrCheck(){
			window.open("addrCheck.jsp","addr","width=300px,height=200")
		}
		function idCheck(){
			window.open("idCheck.jsp","idCheck","width=300px,height=200")
		}
		
		/* 각각의 빈칸 input 유효성 검사 */
 		function valid(){
			if(document.mj.name.value==''){
				window.alert('이름을 입력하셔야 합니다.');
				window.mj.name.focus();
				return false;
			}
			if(document.mj.id.value==''){
				window.alert('아이디를 입력하셔야 합니다.');
				window.mj.id.focus();
				return false;
			}
			if(document.mj.pwd1.value==''){
				window.alert('비밀번호를 입력하셔야 합니다.');
				window.mj.pwd1.focus();
				return false;
			}
			if(document.mj.pwd2.value==''){
				window.alert('비밀번호를 입력하셔야 합니다.');
				window.mj.pwd2.focus();
				return false;
			}
			
			/* 비밀번호 글자수 제한 || 비밀번호 일치 */
			if(document.mj.pwd.value.length < 6){
				alert('비밀번호는 6글자 이상이어야 합니다.');
				return false;
			}
			if(document.mj.pwd.value != document.mj.pwd2.value){
				alert('비밀번호가 일치 하지 않습니다.');
				return false;
			}else{
				return true;
			}
			
			
			if(document.mj.tel.value==''){
				window.alert('전화번호를 입력하셔야 합니다.');
				window.mj.tel.focus();
				return false;
			}
			if(document.mj.birth.value==''){
				window.alert('생일을 입력하셔야 합니다.');
				window.mj.birth.focus();
				return false;
			}
			if(document.mj.addr.value==''){
				window.alert('주소를 입력하셔야 합니다.');
				window.mj.addr.focus();
				return false;
			}
			if(document.mj.email.value==''){
				window.alert('이메일 입력하셔야 합니다.');
				window.mj.email.focus();
				return false;
			}
		}
		
		/* 숫자만 입력이 되어야 하는 유효성 검사 */
		function onlyNum(event){
			if (event.keyCode >= 48 && event.keyCode <= 57){
				return
			}
			event.preventDefault();
		}
	</script>
	<style>
		h2{
      	  	color:#567AF0;
		}
		section{
			width:400px;
			margin:0 auto;
		}
		li{
			list-style-type:none;
		}
		.button {
			background-Color:#567AF0;
			color:#FFFFFF;
			font:14px;
			font-weight:bold;
			width:600;
			height:30;
		}
	</style>
<body>
<%@ include file="/header/mainHeader.jsp" %>
	<section>
		<article>
			<h2>
				회원가입
			</h2>
			<form name="mj" action="memberJoin_ok.jsp" onsubmit="return valid()">
				<ul>
					<li>
						<input type="radio" name="midx" value="2" checked>학생
						<input type="radio" name="midx" value="3">강사
					</li>
					<li>
						<label>이름</label>
					</li>
					<li>
						<input type="text" name="name">
					</li>
					<li>
						<input type="radio" name="sex" value="M" checked>남자
						<input type="radio" name="sex" value="F">여자
					</li>
					<li>
						<label>ID</label>
					</li>
					<li>
						<input type="text" name="id" readonly>
						<input type="button" value="중복검사" onclick="idCheck()">
					</li>
					<li>
						<label>비밀번호</label>
					</li>
					<li>
						<input type="password" name="pwd">
					</li>
					<li>
						<label>비밀번호 확인</label>
					</li>
					<li>
						<input type="password" name="pwd2">
					</li>
					<li>
						<label>전화번호</label>
					</li>
					<li>
						<input type="text" name="tel" onkeypress="onlyNum(event)">
					</li>
					<li>
						<label>생년월일</label>
					</li>
					<li>
						<input type="date" name="birth">
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" name="addr" readonly>			
						<input type="button" value="주소검색" onclick="addrCheck()">
					</li>
					<li>
						<label>이메일</label>
					</li>
					<li>
						<input type="text" name="email">
					</li>
					<li>
						<input type="submit" value="회원가입" class="button">
					</li>
					</ul>
		</form>
		</article>
	</section>
<%@ include file="/header/footer.jsp" %>
</body>
</html>