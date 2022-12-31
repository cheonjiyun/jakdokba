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
		String boardTitle = request.getParameter("boardTitle");

		String sql = "SELECT * FROM board WHERE boardTitle ='" + boardTitle + "'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()){
			
		}
	%>
	<form action="processUpdateBoard.jsp" name="board" method="post" enctype="multipart/form-data">
		<div>
			<p>글쓰기</p>
		</div>
		<% if(rs.getString("boardThumbnail") != null){%> 
			<p><img src='./img/upload/<%= rs.getString("boardThumbnail") %>'></p>
		<% } %>
		<div>
			<input type="hidden" name="author" value='<%= username %>'>
		</div>
		<div>
			<input type="text" name="boardTitle" value="<%= rs.getString("boardTitle")%>"/>
		</div>
		<div>
			<textarea name="boardContent" value="<%= rs.getString("boardContent")%>"></textarea>
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