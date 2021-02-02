<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 탈퇴</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<%
			if(session.getAttribute("loginMemberEmail") == null) {
				response.sendRedirect(request.getContextPath()+"/member/login.jsp");
				return;
			}
		
			request.setCharacterEncoding("UTF-8");
		
			String memberEmail = request.getParameter("memberEmail");
			System.out.println(memberEmail + " <--memberEmail");
			MemberDao memberDao = new MemberDao();
			Member member = memberDao.memberOne(memberEmail);
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">회원 탈퇴</h1>

			<form method="post" action="<%=request.getContextPath()%>/member/deleteMemberAction.jsp?memberEmail=<%=member.getMemberEmail()%>">
				<div class="mb-3 d-flex justify-content-center">
					<%=member.getMemberEmail()%>님 정말로 탈퇴하시겠습니까?
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-danger">
						탈퇴하기
					</button>
				</div>
			</form>
		</div>
	</body>
</html>