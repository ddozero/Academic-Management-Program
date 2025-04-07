<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/header/serverHeader.jsp" %>
	<section>
		<article>
			<div>
				<h2>매니저 관리</h2>
				<div>
					<h4>매니저 기본 정보</h4>
					<table>
						<tr>
							<td rowspan="8" style="width: 150px; text-align: center;">이미지<br><button>상세 변경</button><br><button>이미지 등록</button></td>
							<td>이름</td>
							<td><input type="text" name="name"></td>
							<td>성별</td>
							<td><input type="text" name="gender"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birth"></td>
							<td>주소</td>
							<td><input type="text" name="address"></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="phone"></td>
							<td>이메일</td>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<td>입사일</td>
							<td><input type="text" name="hire_date"></td>
							<td>경력</td>
							<td><input type="text" name="career"></td>
						</tr>
						<tr>
							<td>수강반명</td>
							<td><input type="text" name="class_name"></td>
							<td>강좌명</td>
							<td><input type="text" name="lecture_name"></td>
						</tr>
						<tr>
							<td>특이사항</td>
							<td colspan="3"><textarea name="note" style="width: 100%; height: 60px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="5" style="text-align: right;">
								<button>수정</button>
								<button>등록</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</article>
		<br>
		<article>
			<div>
				<h4>매니저 목록</h4>
				<div>
					<div>
						<button>전체조회</button>
						<button>삭제</button>
					</div>
					<div>
						<select>
							<option>검색조건</option>
						</select>
						<input type="text" placeholder="조건을 선택해주세요.">
						<button>검색</button>
					</div>
				</div>
				<table>
					<thead>
						<tr>
							<th>NO</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>연락처</th>
							<th>이메일</th>
							<th>수강 반명</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
		</article>
	</section>
	<%@ include file="/header/footer.jsp" %>
</body>
</html>