<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show(){
		opener.document.mj.addr.value = '['+'] '+document.getElementById("addr1").value+" "+document.getElementById("addr2").value;
		window.self.close();
	}
</script>
</head>
<body>
	<h2>주소검색</h2>
	<label>주소</label>
	<input type="text" id="addr1"><br>
	<label>상세주소</label>
	<input type="text" id="addr2"><br>
	<input type="button" value="등록" onclick="show()">
</body>
</html>