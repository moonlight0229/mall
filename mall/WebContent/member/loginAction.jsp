<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<%
	// memberLoginAction
	//로그인 한 상태임에도 해당 페이지에 접근 시 강제로 메인페이지로 보냄
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	
	// 디버그
	System.out.println(memberEmail+" memberEmail");
	System.out.println(memberPw+" memberPw");
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	
	MemberDao memberDao = new MemberDao();
	String loginMemberEmail = memberDao.login(paramMember);
	//로그인이 안됬을 때
	if(loginMemberEmail == null) {
		System.out.println("loginMemberEmail == null"); // 디버그
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
		System.out.println("login 실패"); // 디버그
	// 로그인이 됬을 때
	} else {
		session.setAttribute("loginMemberEmail", loginMemberEmail);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		System.out.println("login 성공"); // 디버그
	}
	
%>