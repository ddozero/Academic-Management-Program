<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    width: 50%;
    height: 100%;
    float: left;
    background-color: #fff;
    text-align: center;
    padding-top: 100px;
  }

  .right h2 {
    font-size: 24px;
    margin-bottom: 30px;
    margin: auto;
  }
  form{
  	width:50%;
  	margin:0 auto;
  }
  form input[type="text"]{
  	width:25%;
  }
  form input[name="userid"]{
  	width:50%;
  }
  form input[type="text"],
  form input[type="password"]{
  	height:20px;
  }
</style>

<div class="right">
  <h2>로그인</h2>
  <form name="login" action="login_ok.jsp" method="post" onsubmit="return valid()">
    <table>
      <tr>
        <td><label>아이디</label><br>
          <input type="text" name="userid" value="<%=saveid%>"></td>
      </tr>
      <tr>
        <td><label>비밀번호</label><br>
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
        <td>
          <input type="submit" value="로그인">
        </td>
      </tr>
    </table>
  </form>
</div>

<script>
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
    return true;
  }
</script>
