<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method = "post" action = "/shop/insertMemberAction.jsp">
		<!--회원아이디-->
		<div>memberId :</div>
		<div><input type = "text" name ="memberId"></div>
		<!--회원비번-->
		<div>memberPw :</div>
		<div><input type = "password" name ="memberPw"></div>
		<!-- 회원레벨 -->
		<div>memberLevel :</div>
		<div><input type = "text" name ="memberLevel" value ="0" readonly/></div>
		<!--회원이름-->
		<div>memberName :</div>
		<div><input type = "text" name ="memberName"></div>
		<!--회원나이-->
		<div>memberAge :</div>
		<div><input type = "text" name ="memberAge"></div>
		<!--회원 성별-->
		<div>memberGender :</div>
		<div>
			<input type = "radio" name ="memberGender" value = "남">남
			
	 		<input type = "radio" name ="memberGender" value = "여">여
	 	</div>
	
		<button type = "submit">입력</button>
		<button type = "reset">초기화</button>
	</form>
</body>
</html>