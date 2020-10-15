<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_signup</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberEmail").val().length == ""){
				alert("이메일을 입력하세요");
				$("#memberEmail").focus(); // 입력 포커스를 memberEmail 입력창으로
				return;
			} else if($("#memberPw").val().length == ""){
				alert("비밀번호를 입력하세요");
				$("#memberPw").focus(); // 입력 포커스를 memberPw 입력창으로
				return;
			} else if($("#memberName").val().length == ""){
				alert("이릅을 입력하세요");
				$("#memberName").focus(); // 입력 포커스를 memberName 입력창으로
				return;
			}
			$("#signUpForm").submit();
		});
	});
</script>
<body>
<%
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>회원가입</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp" id="signUpForm">
		<table class="table">
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="memberEmail" id="memberEmail">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="memberPw" id="memberPw">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="memberName" id="memberName">
				</td>
			</tr>
		</table>
		<button type="button" id="btn" class="btn btn-light">회원가입</button>
	</form>
</div>
</body>
</html>