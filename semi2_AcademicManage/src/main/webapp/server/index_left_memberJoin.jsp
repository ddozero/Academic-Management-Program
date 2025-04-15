<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  .left {
    width: 50%;
    height: 100%;
    background-color: #4c6ef5;
    color: white;
    float: left;
    text-align: center;
    padding-top: 100px;
  }

  .left h2 {
    font-size: 30px;
    margin-bottom: 30px;
  }

  .left button {
    background-color: white;
    color: #4c6ef5;
    border: none;
    padding: 15px 30px;
    border-radius: 10px;
    font-size: 16px;
    cursor: pointer;
  }

  .left p {
    margin-top: 40px;
    font-size: 14px;
  }
</style>
<div class="left">
  <h2>---로그---</h2>
  <button onclick="openJoinPopup()">회원가입</button>

<script>
  function openJoinPopup() {
    window.open(
      "memberJoin.jsp?mem=0",
      "joinPopup",
      "width=600,height=800,left=300,top=100,scrollbars=yes"
    );
  }
</script>

  <p>Tel. 123-1234<br>
     E-mail. e@naver.com
  </p>
</div>