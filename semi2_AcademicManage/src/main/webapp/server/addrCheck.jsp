<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f6f7fb;
  }

  .popup-wrapper {
    max-width: 500px;
    margin: 40px auto;
    background-color: #fff;
    border-radius: 12px;
    padding: 30px 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
  }

  h2 {
    font-size: 22px;
    color: #3b5bdb;
    border-bottom: 2px solid #3b5bdb;
    padding-bottom: 10px;
    margin-bottom: 25px;
  }

  .form-row {
    display: flex;
    gap: 10px;
    margin-bottom: 18px;
  }

  .form-row input[type="text"] {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
    outline: none;
  }

  .addr1 {
    width: 30%;
  }

  .addr2 {
    width: 70%;
  }

  .form-row-full {
    margin-bottom: 18px;
  }

  .form-row-full input[type="text"] {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
    outline: none;
  }

  .submit-btn {
    display: block;
    width: 100px;
    margin: 0 auto;
    padding: 10px 0;
    background-color: #567AF0;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
  }

  .submit-btn:hover {
    background-color: #3b5bdb;
  }
</style>

<script>
  function show(){
    const addr1 = document.getElementById("addr1").value;
    const addr2 = document.getElementById("addr2").value;
    opener.document.mj.addr.value = '[' + addr1 + '] ' + addr2;
    window.close();
  }
</script>
</head>
<body>
  <div class="popup-wrapper">
    <h2>주소검색</h2>
    <div class="form-row">
      <input type="text" id="addr1" class="addr1" placeholder="예: 12345">
      <input type="text" id="addr2" class="addr2" placeholder="예: 서울시 강남구 ...">
    </div>
    <div class="form-row-full">
      <input type="text" id="detail" placeholder="예: 101동 202호">
    </div>
    <button type="button" class="submit-btn" onclick="show()">등록</button>
  </div>
</body>
</html>
