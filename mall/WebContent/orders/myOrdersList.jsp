<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrdersList</title>
</head>
<body>
<%
	if(session.getAttribute("loginMemberEmail") != null) {
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	return;
}
%>
<!-- 허어....
	내 주문리스트니까 내 이메일로 주문했던 리스트를 뽑아야한다
 -->
 
 <div class="container">
 	<h1>내 주문목록</h1>
 </div>
</body>
</html>