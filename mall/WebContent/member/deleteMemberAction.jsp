<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//member_deleteMemberAction
	if(session.getAttribute("loginMemberEmail") == null) {
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");

	String memberEmail = request.getParameter("memberEmail");
	
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(memberEmail);
	
	// 로그아웃 하기
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>