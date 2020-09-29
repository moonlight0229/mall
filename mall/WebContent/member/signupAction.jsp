<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<%
	// signAction
	//로그인 한 상태임에도 해당 페이지에 접근 시 강제로 메인페이지로 보냄
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	// 이메일이 중복인지 확인하여 중복을 방지
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail); // 가입시도하는 이메일이 중복인지 체크하는 메소드 호출
	if(member != null) {
		System.out.println("이미 사용중인 이메일입니다.");
		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	memberDao.insertMember(paramMember); // 회원가입 메소드 호출
	System.out.println(memberEmail + memberPw + memberName);
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>