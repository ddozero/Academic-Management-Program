<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  
  .left {
  width: 50%;
  height: 100%;
  background-color: #0E3CA5;
  color: white;
  float: left;
  text-align: center;
  display: flex; 
  flex-direction: column; 
  align-items: center; 
  justify-content: center; 
  box-sizing: border-box; 
  }
  

  .left h2 {
    font-size: 30px;
    margin-bottom: 30px;
  }

  .left button {
    background-color: white;
    color: #4c6ef5;
    border: none;
    border-radius: 10px;
    font-size: 15px;
    cursor: pointer;
    width : 130px;
    height : 40px;
   	text-align: center; 
   	color : #0E3CA5;
  }

  .left p {
    margin-top: 40px;
    font-size: 15px;
  }
</style>
<div class="left">
  <p>SYS Academy에 오신걸 <br> 환영합니다.</p>
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

  <p>Tel.123-1234<br>
     E-mail.sysacademy@sys.com
  </p>
</div>