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
	String thumbnail = "";
	
	//work name
	String sql = "SELECT * FROM work WHERE number = (SELECT DISTINCT number FROM episode WHERE episodeNumber = " + episodeNumber+ ")";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		name = rs.getString("name");
		thumbnail = rs.getString("thumbnail");
	}
	
	//episode
	sql = "SELECT * FROM episode WHERE episodeNumber =" + episodeNumber;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
	%>
	<div class="viewEpisode_top">
		<img class="viewEpiosde_thumbnail" src='./img/upload/<%= thumbnail %>' >
		<a class="light viewEpisode_name" href="viewWork.jsp?number=<%= rs.getInt("Number") %>"><%= name %></a>
		<p class="light viewEpisode_title"><%= rs.getString("episodeTitle") %></p>
	</div>
	<hr class="bar" id="epsidoeLocation">
	<div class="viewEpisode_episode">
		<img class="viewEpisode_image" src='./img/upload/<%= rs.getString("episodeImage") %>'>
		<p class="light viewEpisode_comment">작가의 말</p>
		<p class="light viewEpisode_comment_content"><%= rs.getString("episodeComment") %></p>
	</div>
	<%} %>
	<hr class="bar">
	<div class="comment">
		<div id="comment_input_contianer">
		<form action="processNewComment.jsp" name="comment" method="post">
			<div>
				<p class="viewEpisode_comment_introduce"><img src="./img/message.png">&nbsp;&nbsp;댓글</p>
			</div>
			<div>
				<input type="hidden" name="author" value='<%= username %>'>
				<input type="hidden" name="episodeNumber" value='<%= episodeNumber %>'>
				<input type="hidden" name="name" value='<%= name %>'>
			</div>
			<div>
				<textarea class="light comment_input" name="comment" placeholder="댓글" rows="4" cols="100"></textarea>
			</div>
			<div>
				<input class="light submit comment_submit" type="submit" value="댓글 달기"/>
			</div>
		</form>
		</div>
		<div class="comments">
		<%
			String sqlcomment = "SELECT * FROM comment WHERE episodeNumber = " + episodeNumber + " ORDER BY commentDate DESC";
			PreparedStatement pstmtcomment = conn.prepareStatement(sqlcomment);
			ResultSet rscomment = pstmtcomment.executeQuery();
			
			while(rscomment.next()){
		%>
		<div class="commentInfo">
			<p class="light"><%= rscomment.getString("author") %>

			<% 
				String commentDate = rscomment.getString("commentDate");
				commentDate = commentDate.substring(0, 10);
			%></p>
			<p class="light commentDate"><%= commentDate %></p>
		</div>
		<p class="light comment_content"><%= rscomment.getString("comment") %></p>
		<hr class="bar_comment">
		<%} %>
		</div>
	</div>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>