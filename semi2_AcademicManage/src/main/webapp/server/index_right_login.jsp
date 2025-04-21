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
  font-size: 25px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 30px;
}

form {
  width: 80%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap:20px;
  align-items: center; 
  
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
	width: 400px; 
  padding: 10px;
  font-size: 15px;
  border: none; 
  border-bottom: 1px solid #ccc;
  border-radius: 0; 
  box-sizing: border-box;
}

.form-group input[type="text"]:focus,
.form-group input[type="password"]:focus {
  border-bottom: 2px solid #4c6ef5; 
  outline: none; 
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
  width : 80px;
  height : 35px;
  background-color: #0E3CA5;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  margin-top: 10px;
}

button[type="submit"]:hover {
  color: #eee;
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
  <h2>아이디 로그인</h2>
  
  <form name="login" action="login_ok.jsp" method="post" onsubmit="return valid()">
    <div class="form-group">
      <img src = "">
      <input type="text" id="userid" name="userid" value="<%=saveid%>" placeholder ="직번/아이디">
    </div>

    <div class="form-group">
      <input type="password" id="userpwd" name="userpwd" placeholder ="비밀번호">
    </div>

    <div class="form-check">
      <input type="checkbox" name="saveid" id="saveid" value="on" <%= saveid.equals("") ? "" : "checked" %>>
      <label for="saveid">아이디 저장하기</label>
    </div>

    <div class="captcha-group">
      <input type="text" name="autoonly" readonly value="<%=mdao.autoInt()%>">
      <input type="text" name="autoinput" placeholder="자동입력방지문자">
    </div>

    <button type="submit">로그인</button>
  </form>
  
</div>

