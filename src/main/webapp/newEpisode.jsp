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
	
	<form action="processNewEpisode.jsp" name="episode" method="post" enctype="multipart/form-data">
		<div>
			<p>에피소드 등록</p>
		</div>
		<%
			String number = request.getParameter("number");
			String sql = "SELECT * FROM work WHERE number = '" + number + "'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
			<img src="./img/upload/<%= rs.getString("thumbnail") %>">
			<p><%= rs.getString("name") %></p>
			<p><%= rs.getString("introduce") %></p>
			<p><%= rs.getString("author") %></p>
		
		<div>
			<input type="hidden" name="number" value='<%= rs.getString("number") %>'>
		</div>
		<% } %>
		<div>
			<p>에피소드 제목</p>
			<input type="text" name="episodeTitle"/>
		</div>
		<div>
			<p>에피소드 썸네일</p>
			<input type="file" name="episodeThumbnail">
		</div>
		<div>
			<p>에피소드 올리기</p>
			<input type="file" name="episodeImage">
		</div>
		<div>
			<p>작가의 말</p>
			<input type="text" name="episodeComment"/>
		</div>
		<div>
			<input type="submit" value="등록"/>
		</div>
	</form>
</div>
</body>
</html>