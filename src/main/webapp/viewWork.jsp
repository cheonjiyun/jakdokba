<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
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
		String author = "";
		String name = "";
		int price = 0;
		int number = Integer.valueOf(request.getParameter("number"));
		String sqlwork = "SELECT * FROM work WHERE number = '" + number + "'";
		PreparedStatement pstmt = conn.prepareStatement(sqlwork);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
		author = rs.getString("author");
		name = rs.getString("name");
		price = rs.getInt("price");
	%>
		<div class="viewWork">
			<img class="workThumbnail" src='./img/upload/<%= rs.getString("thumbnail") %>' alt="썸네일">
			<p class="light title viewWork_title"><%= rs.getString("name") %></p>
			<p class="light author viewWork_author"><%= rs.getString("author") %></p>
			<p class="light genre viewWork_genre">
				<%
					String sqlgenrework = "SELECT * FROM genrework WHERE number = " + number;
					PreparedStatement pstmtgenrework = conn.prepareStatement(sqlgenrework);
					ResultSet genreworkrswork = pstmtgenrework.executeQuery();
					
					while(genreworkrswork.next()){	
						
				%>
				<%= genreworkrswork.getString("genre") %> <% if(genreworkrswork.isLast()){}else{%> / <%} %>
				<% } %>
			</p>
			<p class="light introduce viewWork_introduce"><%= rs.getString("introduce") %></p>
			
			<p class="light price viewWork_price"><img src="./img/coin.png">&nbsp;&nbsp;에피소드 당 <%= rs.getInt("price") %> 원</p>
		</div>
		
		<div class="newEpisode">
	<%
		if(username != null && username.equals(rs.getString("author"))){
	%>
		<a href='newEpisode.jsp?number=<%=rs.getString("number")%>'><img src="./img/plus.png">에피소드 등록하기</a>
	<%
		}}
	%>
		</div>
		<hr class="bar">
		<div class="episodes">
	<%		
		pstmt.close();
		
		String sqlepisode = "SELECT * FROM episode WHERE number = '" + number + "'";
		pstmt = conn.prepareStatement(sqlepisode);
		rs = pstmt.executeQuery();
		while(rs.next()){
	%>
		<div class="episode" onclick="location.href='./payment.jsp?episodeNumber=<%= rs.getInt("episodeNumber")%>'">
			<img class="episodeThumbnail" src='./img/upload/<%= rs.getString("episodeThumbnail") %>'>
				<div class="episodeInfo">
					<p class="light episodeTitle"><%= rs.getString("episodeTitle") %></p>
					
					<% 
						String episodeDate = rs.getString("episodeDate");
						episodeDate = episodeDate.substring(0, 10);
					%>
					<p class="light episodeDate"><%= episodeDate %></p>
				</div>
		</div>
		<% }conn.close(); %>
		</div>
</div>
</body>
</html>