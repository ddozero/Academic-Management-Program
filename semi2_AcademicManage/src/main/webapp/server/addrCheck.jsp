 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="java.util.*"%>
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
    background-color: #f6f7fb;
  }

  .popup-wrapper {
    max-width: 500px;
    margin: 10px auto;
    background-color: #fff;
    border-radius: 12px;
    padding: 30px 25px;
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
    const detail = document.getElementById("detail").value;
    opener.document.mj.addr.value = '[' + addr1 + '] ' + addr2 + " " +detail;
    window.close();
  }
</script>
</head>
<%
Random rand = new Random();
int randomNum = rand.nextInt(90000) + 10000;
%>
<body>
  <div class="popup-wrapper">
    <h2>주소검색</h2>
    <div class="form-row">
      <input type="text" id="addr4" class="addr1" readonly placeholder="우편번호">
      <input type="hidden" id="addr1" value="<%=randomNum%>"> 
      <input type="text" id="addr2" class="addr2" placeholder="예: 서울시 마포구 ...">
    </div>
    <div class="form-row-full">
      <input type="text" id="detail" placeholder="예: 101동 202호">
    </div>
    <button type="button" class="submit-btn" onclick="show()">등록</button>
  </div>
</body>
</html>
