<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 검사</title>
<style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f5f5f5;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .id-wrapper {
    background-color: #fff;
    padding: 40px 30px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
  }

  h2 {
    font-size: 24px;
    color: #3b5bdb;
    margin-bottom: 25px;
    border-bottom: 2px solid #3b5bdb;
    padding-bottom: 8px;
  }

  label {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
    color: #222;
  }

  .inline-group {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
  }

  input[type="text"] {
    flex: 1;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
  }

  input[type="submit"],
  button {
    background-color: #567AF0;
    color: white;
    border: none;
    border-radius: 6px;
    padding: 10px 16px;
    font-size: 13px;
    cursor: pointer;
    white-space: nowrap;
  }

  input[type="submit"]:hover,
  button:hover {
    background-color: #3b5bdb;
  }

  .back-btn {
    display: block;
    margin: 0 auto;
    margin-top: 10px;
  }
</style>
</head>
<body>
  <div class="id-wrapper">
    <h2>ID 검사</h2>
    <form name="fm" action="idCheck_ok.jsp">
      <label>아이디</label>
      <div class="inline-group">
        <input type="text" name="id" placeholder="사용하실 아이디를 입력해주세요.">
        <input type="submit" value="ID 검사">
      </div>
      <button type="button" class="back-btn" onclick="window.close()">회원가입</button>
    </form>
  </div>
</body>
</html>
