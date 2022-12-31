<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작독바</title>
<link rel="stylesheet" href="css/css.css">
</head>
<body>
<%@ include file="./top.jsp" %>
<div class="body">
	<%@ include file="dbconnection.jsp" %>
	<%
	request.setCharacterEncoding("utf-8");
	
	String username = (String) session.getAttribute("name");
	if(username == null){
		response.sendRedirect("login.jsp?from=newBoard.jsp");
	}else{
	%>
	<form action="processNewBoard.jsp" name="board" method="post" enctype="multipart/form-data">
		<div>
			<p>글쓰기</p>
		</div>
		<div>
			<input type="hidden" name="author" value='<%= username %>'>
		</div>
		<div>
			<input type="text" name="boardTitle" placeholder="제목"/>
		</div>
		<div>
			<textarea name="boardContent" placeholder="내용"></textarea>
		</div>
		<div>
			<p>게시물 썸네일</p>
			<input type="file" name="boardThumbnail">
		</div>
		<div>
			<input type="submit" value="글쓰기"/>
		</div>
	</form>
	<% } %>
</div>
</body>
</html>