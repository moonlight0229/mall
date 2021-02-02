<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 보기</title>
		
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
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">공지사항 보기</h1>
			
			<table class="table">
				<tr>
					<th>No.</th>
					<td><%=notice.getNoticeId()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=notice.getNoticeTitle()%></td>
				</tr>
				<tr>
					<th>작성일자</th>
					<td><%=notice.getNoticeDate()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=notice.getNoticeContent()%></td>
				</tr>
			</table>
		</div>
	</body>
</html>