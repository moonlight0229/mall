<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>member_index</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	int categoryId = -1;
	// 카테고리
	CategoryDao categoryDao = new CategoryDao();
	// 상품
	ProductDao productDao = new ProductDao();
	// 공지사항
	NoticeDao noticeDao = new NoticeDao();
	// 회원
	MemberDao memberDao = new MemberDao();
	// 전체 카테고리 이름 리스트
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	// 추천 카테고리 이미지 리스트
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
	// 상품 리스트
	ArrayList<Product> productList = null;
	// 공지사항 리스트
	ArrayList<Notice> noticeList = noticeDao.selectMainPageNoticeList();
	if(categoryId == -1) {
		productList = productDao.selectMainPageProductList();
	} else {
		productList = productDao.selectMainPageProductListByCategoryId(categoryId);
	}
%>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
			
	<!-- 전체카테고리3 / 이미지 배너9 -->
	<div class="row">
		<table>
			<div class="col-sm-3">
				<!-- 전체카테고리 -->
				<div class="btn-group-vertical">
					<%
						for(Category c : categoryList1) {
					%>
							<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>" class="btn btn-secondary"><%=c.getCategoryName()%></a>
					<%		
						}
					%>
				</div>
			</div>
			<div class="col-sm-9" style="width: 700px">
				<img src="<%=request.getContextPath()%>/images/b1.jpg">
			</div>
		</table>
	</div>
	
	<!-- 추천 카테고리 이미지 링크 -->
	<div class="d-flex justify-content-center">
		<%
			for(Category c : categoryList2) {
		%>
				<a href="">
					<img src="<%=request.getContextPath()%>/images/<%=c.getCategoryPic()%>" class="rounded-circle" width="200" height="200">
				</a><br>
		<%
			}
		%>
	</div>
	
	<%
		Calendar today = Calendar.getInstance();
	%>
	<!-- 카테고리별 추천 상품 출력 -->
	<div>
		<h4>
			오늘의 추천상품
			<span class="badge badge-pill badge-primary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH)+1%>.<%=today.get(Calendar.DAY_OF_MONTH)%>
			</span>
		</h4>
		<div class="btn-group" role="group">
			<a class="btn btn-light" href="<%=request.getContextPath()%>/index.jsp">전체</a>
			<%
				for(Category c : categoryList1) {
			%>
					<a class="btn btn-light" href="<%=request.getContextPath()%>/index.jsp?categoryId=<%=c.getCategoryId()%>">
						<%=c.getCategoryName()%>
					</a>
			<%
				}
			%>
		</div>
	</div>
	
	<div class="center-block d-flex justify-content-center">
		<table class="table">
			<tr>
				<%
					int i = 0;
					for(Product p : productList) {
						i=i+1;
				%>
				<td>
					<div class="col-sm-4 text-center">
						<div class="card" style="width: 300px">
							<img class="card-img-top" src="<%=request.getContextPath()%>/images/<%=p.getProductPic()%>" alt="Card image">
							<div class="card-body">
								<h4 class="card-title">
									<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>">
										<%=p.getProductName()%>
									</a>
								</h4>
								<p class="card-text"><%=p.getProductPrice()%>원</p>
									<%
										if(p.getProductSoldout().equals("Y")) {
									%>
										<p class="card-text">품절</p>
									<%
										} else {
									%>
										<p class="card-text">판매중</p>
									<%	
										}
									%>
							</div>
						</div>
					</div>
				</td>
				<%
						if(i%3 == 0) {
				%>
			</tr>
			<tr>
				<%			
						}
					}
				%>
			</tr>
		</table>
	</div>
	
	<!-- 최근 공지 -->
	<div class=row>
		<h4>공지사항</h4>
		<table class="table">
			<thead>			
				<tr>
					<th>공지ID</th>
					<th>공지 제목</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Notice n : noticeList) {
				%>
						<tr>
							<td><%=n.getNoticeId()%></td>
							<td>
								<a href="<%=request.getContextPath()%>/notice/noticeOne.jsp"><%=n.getNoticeTitle()%></a>
							</td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>