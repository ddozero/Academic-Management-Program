<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

body{
	margin: 0px;
    padding: 0px;
}
	
.join-title{
	width : 500px;
}

.join-title h2{
    font-size: 26px;
    color: #3b5bdb;
    border-bottom: 2px solid #3b5bdb;
    padding-bottom: 8px;
}
	
  .join-wrapper {
    max-width: 500px;
    padding-left: 50px;
    padding-right: 50px;
    padding-top: 30px;
    padding-bottom : 30px;
    background-color: #fff;
  }

  .form-group {
    margin-bottom: 18px;
  }

  label {
    display: block;
    font-weight: 500;
    margin-bottom: 6px;
    font-size: 15px;
    color: #222;
  }

  input[type="text"],
  input[type="password"],
  input[type="email"],
  input[type="date"] {
    width: 80%;
    padding: 10px 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    outline: none;
  }

  input::placeholder {
    color: #aaa;
  }

  .inline-group {
    display: flex;
    gap: 8px;
  }

  .inline-group input[type="text"] {
    flex: 1;
  }

  .inline-group button {
  	width : 70px;
  	height : 35px;
    background-color: #567AF0;
    color: #fff;
    font-size: 13px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    white-space: nowrap;
  }

  .inline-group button:hover {
    background-color: #3b5bdb;
  }

  .submit-btn {
   display: block; 
    margin: 20px auto; 
    width:200px;
    height : 45px;
    background-color: #567AF0;
    border: none;
    border-radius: 8px;
    color: #fff;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 50px;
  }

  .submit-btn:hover {
    background-color: #3b5bdb;
  }
  
  .inline-radio {
  display: flex;
  gap: 20px;
  margin-top: 5px;
	}
	
	.inline-radio label {
	  display: inline-flex;
	  align-items: center;
	  gap: 5px;
	}
	
</style>
	<script>
		function addrCheck(){
			window.open("addrCheck.jsp","addr","width=500px,height=400")
		}
		function idCheck(){
			window.open("idCheck.jsp","idCheck","width=420px,height=250")
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
			if(document.mj.pwd.value==''){
				window.alert('비밀번호를 입력하셔야 합니다.');
				window.mj.pwd.focus();
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
			}else{
				return true;
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
</head>
<% String mem = request.getParameter("mem"); %>
<body>
<div class="join-wrapper">
	<div class ="join-title">
	<%if("0".equals(mem)){
		%>
		<h2>회원가입</h2>
		<%
	}else{
		%>
		<h2>매니저 계정 추가</h2>
		<%
	} 
	%>
	</div>
		<form name="mj" action="memberJoin_ok.jsp" method="post" onsubmit="return valid()">
		
		
		
		<% if ("0".equals(mem)) { %>
			<div class="form-group">
				<label>회원 유형</label>
				<div class="inline-radio">
					<label><input type="radio" name="midx" value="2" checked> 학생</label>
					<label><input type="radio" name="midx" value="3"> 강사</label>
				</div>
			</div>
		<% } else { %>
			<input type="hidden" name="midx" value="4">
		<% } %>
		
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" placeholder="이름을 입력하세요.">
			</div>
		
			<div class="form-group">
				<label>성별</label>
				<div class="inline-radio">
					<label><input type="radio" name="sex" value="M" checked> 남자</label>
					<label><input type="radio" name="sex" value="F"> 여자</label>
				</div>
			</div>
		
			<div class="form-group">
				<label>아이디</label>
				<div class="inline-group">
					<input type="text" name="id" readonly placeholder="사용하실 아이디를 입력해주세요.">
					<button type="button" onclick="idCheck()">ID 검사</button>
				</div>
			</div>
		
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="pwd" placeholder="비밀번호는 6자 이상입니다.">
			</div>
			
			<div class="form-group">
				<label>비밀번호 확인</label>
				<input type="password" name="pwd2" placeholder="확인용 비밀번호를 다시 입력해주세요.">
			</div>
			
			<div class="form-group">
				<label>전화번호</label>
				<input type="text" name="tel" onkeypress="onlyNum(event)" placeholder="010-0000-0000">
			</div>
			
			<div class="form-group">
				<label>이메일</label>
				<input type="email" name="email" placeholder="ex. IT@itac.com">
			</div>
			
			<div class="form-group">
				<label>주소</label>
				<div class="inline-group">
					<input type="text" name="addr" readonly placeholder="주소를 입력해주세요.">
					<button type="button" onclick="addrCheck()">주소 검색</button>
				</div>
			</div>
			
			<div class="form-group">
				<label>생년월일</label>
				<input type="date" name="birth" value="2025-04-01">
			</div>
			
			
			
			<% if ("0".equals(mem)) { %>
			<input type="hidden" name="appro" value="0">
			<% } else { %>
			<input type="hidden" name="appro" value="1">
			<% } %>
			<input type="submit" value="회원가입" class="submit-btn">
		</form>
	</div>
</body>

</html>
