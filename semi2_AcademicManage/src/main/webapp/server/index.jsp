<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
  <style>
.login-wrapper {
  width: 800px;
  height: 450px;
  margin: 150px auto;
  display: flex;
  background-color: #ffffff;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.left {
  width: 50%;
  background-color: #4c6ef5;
  color: white;
  text-align: center;
  padding: 40px 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-sizing: border-box;
}

.right {
  width: 50%; /* ✅ 오른쪽도 딱 50% */
  background-color: #fff;
  padding: 40px 30px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

  </style>
</head>
<body>
<%@ include file="/header/mainHeader.jsp" %>
<section>
  <article>
    <div class="login-wrapper">
      <%@ include file="/server/index_left_memberJoin.jsp" %>
      <%@ include file="/server/index_right_login.jsp" %>
    </div>
  </article>
</section>

<%@ include file="/header/footer.jsp" %>
</body>
<!-- /* sort : 0 , 1 , 4 사용중 || AMemberDAO - memSelect(String sort)에서 사용 중 */ -->
	<!-- 0 : member1 테이블의 모든 레코드를 조회, 1과 4를 else한 경우를 의미하며  -->
	<!-- 1 : appro승인처리가 된 계정과 되지 않은 계정을 나누는 용도  -->
	<!-- 4 : midx가 매니저인 계정만 조회하는 용도 -->

<!-- /* idxx : 기존에는 회원가입을 통해서 member1테이블의 레코드만이 생성이 되었는데, 
			   편의성을 위해서 회원가입이 되었을 때 member2 || member3까지 같이 레코드가 생성된다.
			   
			   member2,member3 테이블이 member1 테이블을 참조하고 있어서 
			   delete 쿼리문을 사용해서 레코드를 삭제하는 것이 불가능.
			   
			   그래서 해당 변수를 추가하여 각 테이블의 레코드를 delete하는 것이 아니라
			   화면에서 보여지는 것을 숨김처리하는 용도로 사용							  */ -->



</html>

