<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_productOne</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 유효성 검사
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#ordersAddr").val().length<1){
					alert("배송지를 입력하세요");
					$("#ordersAddr").focus(); // 입력 포커스를 ordersAddr 입력창으로
					return;
				}
				$("#addOdersForm").submit();
			});
		});
	</script>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");

	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1>상품 상세보기</h1>
	
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
	
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp" id="addOdersForm">
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
			<input type="text" name="ordersAddr" id="ordersAddr">
		</div>
		<div><button type="button" id="btn" class="btn btn-sucess">주문</button></div>
	</form>
</div>
</body>
</html>