<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="com.semi2.member.*" %>
    <jsp:useBean id="mdao" class="com.semi2.member.AMemberDAO"></jsp:useBean>
<%
String saveid = "";

Cookie cks[] = request.getCookies();
if (cks != null) {
    for (int i = 0; i < cks.length; i++) {
        if (cks[i].getName().equals("saveid")) {
            saveid = cks[i].getValue();
        }
    }
}
%>

<style>
.right {
  width: 100%;
  height: 100%;
  padding: 40px;
  background-color: #ffffff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-sizing: border-box;
}

.right h2 {
  font-size: 28px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 30px;
}

form {
  width: 100%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.form-group {
  display: flex;
  flex-direction: column;
}

.form-group label {
  font-size: 14px;
  margin-bottom: 5px;
}

.form-group input[type="text"],
.form-group input[type="password"] {
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.form-check {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
}

.captcha-group {
  display: flex;
  gap: 10px;
}

.captcha-group input[type="text"] {
  width: 50%;
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  background-color: #f9f9f9;
}

.captcha-group input[name="autoonly"] {
  color: #4c6ef5;
  font-weight: bold;
  text-align: center;
}

button[type="submit"] {
  background-color: #4c6ef5;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
}

button[type="submit"]:hover {
  background-color: #3b5bdb;
}
input[name="autoonly"]{
	letter-spacing : 5px;
}
</style>

<script>
console.log('ddd');
  function valid() {
    if (document.login.userid.value == '') {
      alert('아이디를 입력해주세요');
      document.login.userid.focus();
      return false;
    }
    if (document.login.userpwd.value == '') {
      alert('비밀번호를 입력해주세요');
      document.login.userpwd.focus();
      return false;
    }
    if (document.login.autoinput.value == '') {
      alert('자동방지 번호를 입력해주세요');
      document.login.autoinput.focus();
      return false;
    }
    
    if(document.login.autoonly.value != document.login.autoinput.value){
    	alert('자동방지 번호가 일치하지 않습니다.')
    	return false;
    }
    
    return true;
    
  }
</script>
<div class="right">
  <h2>로그인</h2>
  <form name="login" action="login_ok.jsp" method="post" onsubmit="return valid()">
    <div class="form-group">
      <label for="userid">아이디</label>
      <input type="text" id="userid" name="userid" value="<%=saveid%>">
    </div>

    <div class="form-group">
      <label for="userpwd">비밀번호</label>
      <input type="password" id="userpwd" name="userpwd">
    </div>

    <div class="form-check">
      <input type="checkbox" name="saveid" id="saveid" value="on" <%= saveid.equals("") ? "" : "checked" %>>
      <label for="saveid">아이디 저장하기</label>
    </div>

    <div class="captcha-group">
      <input type="text" name="autoonly" readonly value="1">
      <%=mdao.autoInt()%>
      <input type="text" name="autoinput" placeholder="자동입력방지문자">
    </div>
    <button type="submit">로그인</button>
  </form>
</div>

