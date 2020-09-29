<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_signup</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="container">	
	<h1>회원가입</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp">
		<table class="table">
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="memberEmail">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="memberPw">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="memberName">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-light">회원가입</button>
	</form>
</div>
</body>
</html>