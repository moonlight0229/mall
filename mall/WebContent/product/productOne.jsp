<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_productOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");

	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
<div class="container">
	<h1>상품 상세보기</h1>
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
		<input type="hidden" value="<%=product.getProductId()%>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
		<div>
			주문수량 : 
			<select name="ordersAmount">
				<%
					for(int i=1; i<11; i+=1) {
				%>
						<option value="<%=i%>"><%=i%></option>
				<%		
					}
				%>
			</select>개
		</div>
		<div>
			배송지 : 
			<input type="text" name="ordersAddr">
		</div>
		<div><button type="submit">주문</button></div>
	</form>
	<table class="table">
		<tr>
			<td><img src="/mall/images/<%=product.getProductPic()%>" class="rounded"></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><%=product.getProductName()%></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td><%=product.getProductPrice()%></td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td><%=product.getProductContent()%></td>
		</tr>
		<tr>
			<td>품절여부</td>
			<td><%=product.getProductSoldout()%></td>
		</tr>
	</table>
</div>
</body>
</html>