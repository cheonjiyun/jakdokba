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
<%@ include file="dbconnection.jsp" %>
<div class="body">
<%
request.setCharacterEncoding("utf-8");

String username = (String) session.getAttribute("name");
int episodeNumber = Integer.parseInt(request.getParameter("episodeNumber"));
String name = "";

//work name
String sql = "SELECT * FROM work WHERE number = (SELECT DISTINCT number FROM episode WHERE episodeNumber = " + episodeNumber+ ")";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
while(rs.next()){
	name = rs.getString("name");
}

//episode
sql = "SELECT * FROM episode WHERE episodeNumber =" + episodeNumber;
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
%>
<a href="viewWork.jsp?number=<%= rs.getInt("Number") %>"><%= name %></a>
<img src='./img/upload/<%= rs.getString("episodeImage") %>'>
<p>작가의 말</p>
<p><%= rs.getString("episodeComment") %></p>
<%} %>

	<div class="comment">
		<form action="processNewComment.jsp" name="comment" method="post">
			<div>
				<p>댓글</p>
			</div>
			<div>
				<input type="hidden" name="author" value='<%= username %>'>
				<input type="hidden" name="episodeNumber" value='<%= episodeNumber %>'>
				<input type="hidden" name="name" value='<%= name %>'>
			</div>
			<div>
				<textarea name="comment" placeholder="댓글"></textarea>
			</div>
			<div>
				<input type="submit" value="댓글 달기"/>
			</div>
		</form>
		
		<%
			String sqlcomment = "SELECT * FROM comment WHERE episodeNumber = " + episodeNumber;
			PreparedStatement pstmtcomment = conn.prepareStatement(sqlcomment);
			ResultSet rscomment = pstmtcomment.executeQuery();
			
			while(rscomment.next()){
		%>
		<p><%= rscomment.getString("comment") %></p>
		<p><%= rscomment.getString("author") %></p>
		<% 
			String commentDate = rscomment.getString("commentDate");
			commentDate = commentDate.substring(0, 10);
		%>
		<p><%= commentDate %></p>
		<%} %>
	</div>
</div>
</body>
</html>