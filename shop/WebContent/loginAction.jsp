<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		//값 가져오기
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		//객체 생성 
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		Member returnMember =	memberDao.login(member);
		
		//로그인 성공 확인 
		if(returnMember == null){
			System.out.println("로그인 실패");
			response.sendRedirect("./loginForm.jsp");

		}else{
			System.out.println("로그인 성공");
			System.out.println(returnMember.getMemberNo());
			System.out.println(returnMember.getMemberId());
			System.out.println(returnMember.getMemberName());
			System.out.println(returnMember.getMemberLevel());
			
			
			session.setAttribute("loginMember", returnMember);
			response.sendRedirect("./index.jsp");

		}


%>
</body>
</html>