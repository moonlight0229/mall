<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myMember</title>
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
	MemberDao memberDao = new MemberDao();
	ArrayList<Member> memberList = memberDao.selectMemberList(memberEmail);
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> ordersList = ordersDao.selectOrdersListByEmail(memberEmail);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
 	<h1 class="display-4">내 정보</h1>
 	
 	<a class="btn btn-danger" href="<%=request.getContextPath()%>/member/deleteMember.jsp?memberEmail=<%=session.getAttribute("loginMemberEmail%>">
 		회원탈퇴
 	</a>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>주문개수</th>
				<th>주문가격</th>
				<th>주문자 이메일</th>
				<th>배송지</th>
				<th>주문상태</th>
				<th>주문일시</th>
				<th>주문관리</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : ordersList) { // oap = order and Product
			%>
					<tr>
						<td><%=oap.orders.getOrdersId()%></td>
						<td><%=oap.orders.getProductId()%></td>
						<td><%=oap.product.getProductName()%></td>
						<td><%=oap.orders.getOrdersAmount()%></td>
						<td><%=oap.orders.getOrdersPrice()%>원</td>
						<td><%=oap.orders.getMemberEmail()%></td>
						<td><%=oap.orders.getOrdersAddr()%></td>
						<td><%=oap.orders.getOrdersState()%></td>
						<td><%=oap.orders.getOrdersDate()%></td>
						<td><a class="btn btn-light" href="<%=request.getContextPath()%>/orders/modifyOrdersState.jsp?ordersId=<%=oap.orders.getOrdersId()%>">관리</a></td>
					</tr>
			<%
				}
			%>
 		</tbody>
	</table>
</div>
</body>
</html>