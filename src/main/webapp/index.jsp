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
	<div>
		<p class="medium">작독바 작품</p>
		<div class="works">
			<%@ include file="dbconnection.jsp" %>
			<%
				String sqlwork = "SELECT * FROM work WHERE number IN (SELECT DISTINCT number FROM episode)";
				PreparedStatement pstmtwork = conn.prepareStatement(sqlwork);
				ResultSet rswork = pstmtwork.executeQuery();
				
				int number = 0;
				while(rswork.next()){
					number = rswork.getInt("number");
			%>
			<div class="work" onclick="location.href= 'viewWork.jsp?number=<%= rswork.getInt("number") %>'">
				<img class="workThumbnail" src="./img/upload/<%= rswork.getString("thumbnail") %>">
				<p class="light title"><%= rswork.getString("name") %></p>
				<p class="light author"><%= rswork.getString("author") %></p>
				<p class="light genre">
				<%
					String sqlgenrework = "SELECT * FROM genrework WHERE number = " + number;
					PreparedStatement pstmtgenrework = conn.prepareStatement(sqlgenrework);
					ResultSet genreworkrswork = pstmtgenrework.executeQuery();
					
					while(genreworkrswork.next()){	
				%>
				<%= genreworkrswork.getString("genre") %> <% if(genreworkrswork.isLast()){}else{%> / <%} %>
				<% } %>
				</p>
			</div>
				<% 
				} 
				pstmtwork.close();	
				conn.close();
				%>
		</div>
	</div>
	<div>
		<p><a class="medium" href="./board.jsp">토론의 장</a></p>
		<div>
			<p>흠으으으으으으으으으으으으으으음</p>
		</div>
	</div>

</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>