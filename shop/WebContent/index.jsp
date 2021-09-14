<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<!-- start : submenu include -->
	<div>
		<jsp:include page ="/partial/submenu.jsp"></jsp:include>
	</div>
	<!--  end : submenu include  -->
	<h1>메인페이지</h1>
	<%
	
		if(session.getAttribute("loginMember") == null) {
	%>

	<div>
		<div><a href ="/shop/loginForm.jsp">로그인</a></div>
		<div><a href ="/shop/insertMemberForm.jsp">회원가입</a></div>
	</div>
	<%
		}else{
			Member loginMember = (Member)session.getAttribute("loginMember");
			%>
					<!-- 로그인 -->
					<div><%=loginMember.getMemberName()%>님 반갑습니다.</div>
					<div><a href="./logout.jsp">로그아웃</a></div>
					<div><a href="./selectMemberOne.jsp">회원정보</a></div>
			<%	
				}
			%>
	
	
</body>
</html>