<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- member_menu -->
<!-- 최상단 검색바 4/4/4 -->
<nav class="navbar navbar-expand-sm">
	<div class="container">
		<div class="col-sm-4 d-flex justify-content-start">
			<h1>
				<a style="text-decoration: none; color: black;" href="<%=request.getContextPath()%>/index.jsp">Goodee Shop</a>
			</h1>
		</div>
		<div class="input-group col-md-3 d-flex justify-content-center">
			<input type="text" class="form-control" placeholder="Search">
			<div class="input-group-append">
				<button type="submit" class="btn btn-secondary">검색</button>
			</div>
		</div>
		<div class="col-sm-4 d-flex justify-content-end">
			<nav class="d-flex justify-content-end">
				<%
					if(session.getAttribute("loginMemberEmail") == null) {
				%>
						<!-- 로그아웃 상태 -->
						<div>
							<a class="btn btn-light" href="<%=request.getContextPath()%>/member/login.jsp">
								로그인
							</a>
							<a class="btn btn-light" href="<%=request.getContextPath()%>/member/signup.jsp">
								회원가입
							</a>
						</div>
				<%
					} else {
				%>
						<!-- 로그인 상태 -->
						<div>
							<a class="btn btn-light btn-sm" href="<%=request.getContextPath()%>/member/myMember.jsp?memberEmail=<%=session.getAttribute("loginMemberEmail")%>">
								<%=session.getAttribute("loginMemberEmail")%>님
							</a>
							<a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/member/logoutAction.jsp">
								로그아웃
							</a>
						</div>
				<%
					}
				%>
			</nav>
		</div>
	</div>
</nav>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link btn" href="<%=request.getContextPath()%>/product/productList.jsp">전체상품</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn" href="<%=request.getContextPath()%>/notice/noticeList.jsp">공지사항</a>
			</li>
		</ul>
	</div>
</nav>