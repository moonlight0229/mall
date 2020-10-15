<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 유효성 검사
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#memberEmail").val().length<1){
					alert("이메일을 입력하세요");
					$("#memberEmail").focus(); // 입력 포커스를 memberEmail 입력창으로
					return;
				} else if($("#memberPw").val().length<1){
					alert("비밀번호를 입력하세요");
					$("#memberPw").focus(); // 입력 포커스를 memberPw 입력창으로
					return;
				}
				$("#loginForm").submit();
			});
		});
	</script>
</head>
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
	<h1>로그인</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp" id="loginForm">
		<table class="table">
			<tr>
				<td>Email</td>
				<td><input type="text" name="memberEmail" id="memberEmail"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<button type="button" id="btn" class="btn btn-success" style="float: right;">로그인</button>
	</form>
</div>
</body>
</html>