<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f0f3fa;
  }

  .join-wrapper {
    max-width: 500px;
    margin: 80px auto;
    padding: 40px 30px;
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
  }

  h2 {
    font-size: 26px;
    color: #3b5bdb;
    margin-bottom: 25px;
    border-bottom: 2px solid #3b5bdb;
    padding-bottom: 8px;
  }

  .form-group {
    margin-bottom: 18px;
  }

  label {
    display: block;
    font-weight: 500;
    margin-bottom: 6px;
    font-size: 14px;
    color: #222;
  }

  input[type="text"],
  input[type="password"],
  input[type="email"],
  input[type="date"] {
    width: 100%;
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
    padding: 10px 16px;
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
    width: 100%;
    padding: 13px;
    background-color: #567AF0;
    border: none;
    border-radius: 8px;
    color: #fff;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 20px;
  }

  .submit-btn:hover {
    background-color: #3b5bdb;
  }
</style>

<script>
  function idCheck(){
    window.open("idCheck.jsp","idCheck","width=500,height=400");
  }
  function addrCheck(){
    window.open("addrCheck.jsp","addr","width=500,height=400");
  }
  function onlyNum(event){
    if (event.keyCode < 48 || event.keyCode > 57){
      event.preventDefault();
    }
  }
</script>
</head>
<body>
  <div class="join-wrapper">
    <h2>회원가입</h2>
    <form name="mj" action="memberJoin_ok.jsp" method="post">

      <div class="form-group">
        <label>아이디</label>
        <div class="inline-group">
          <input type="text" name="id" placeholder="사용하실 아이디를 입력해주세요.">
          <button type="button" onclick="idCheck()">ID 검사</button>
        </div>
      </div>

      <div class="form-group">
        <label>비밀번호</label>
        <input type="password" name="pwd" placeholder="사용하실 비밀번호를 입력해주세요.">
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
        <label>생년월일</label>
        <input type="date" name="birth" value="2025-04-01">
      </div>

      <div class="form-group">
        <label>주소</label>
        <div class="inline-group">
          <input type="text" name="addr" placeholder="주소를 입력해주세요.">
          <button type="button" onclick="addrCheck()">주소 검색</button>
        </div>
      </div>

      <div class="form-group">
        <label>이메일</label>
        <input type="email" name="email" placeholder="ex. IT@itac.com">
      </div>

      <input type="submit" value="회원가입" class="submit-btn">
    </form>
  </div>
</body>
</html>
