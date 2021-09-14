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
	request.setCharacterEncoding("UTF-8");

	//방어코드
	if(request.getParameter("memberId") == null || request.getParameter("memberPw") == null || request.getParameter("memberLevel") == null ||request.getParameter("memberName") == null || request.getParameter("memberAge") == null || request.getParameter("memberGender") == null){
	//다시 브라우저에게 다른곳을 요청하도록 하기 위해 만든것 
	response.sendRedirect("./insertMemberForm.jsp");
	return;
	}
	
	if(request.getParameter("memberId").equals("")|| request.getParameter("memberPw").equals("") || request.getParameter("memberLevel").equals("") ||request.getParameter("memberName").equals("") || request.getParameter("memberAge").equals("") || request.getParameter("memberGender").equals("")){
		//다시 브라우저에게 다른곳을 요청하도록 하기 위해 만든것 
		response.sendRedirect("./insertMemberForm.jsp");
	return;
		}
	
	
	//값저장 
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	int memberLevel = Integer.parseInt(request.getParameter("memberLevel"));
	String memberName = request.getParameter("memberName");
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	String memberGender = request.getParameter("memberGender");
	
	//디버깅 코드 
	System.out.println(memberId +"<-------memberId");
	System.out.println(memberPw +"<-------memberPw");
	System.out.println(memberLevel +"<-------memberLevel");
	System.out.println(memberName +"<-------memberName");
	System.out.println(memberAge +"<-------memberAge");
	System.out.println(memberGender +"<-------memberGender");
	//객체 생성 후 값 저장 
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	member.setMemberLevel(memberLevel);
	member.setMemberName(memberName);
	member.setMemberAge(memberAge);
	member.setMemberGender(memberGender);
	//객체 생성 
	MemberDao memberDao = new MemberDao();
	memberDao.insertMember(member);
	
	response.sendRedirect("./loginForm.jsp");
	
%>
</body>
</html>