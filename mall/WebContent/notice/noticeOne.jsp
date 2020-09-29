<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	System.out.println(noticeId + " <--noticeId");
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.noticeOne(noticeId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">공지사항 상세보기</h1>
	<table class="table">
		<tr>
			<td>번호</td>
			<td><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td><%=notice.getNoticeDate()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
	</table>
</div>
</body>
</html>