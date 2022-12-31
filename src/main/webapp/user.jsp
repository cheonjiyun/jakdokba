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
	<div class="inner">
		<img src="./img/profile.png" alt="프로필사진">
	</div>
	<div class="inner">
		<%
			request.setCharacterEncoding("utf-8");
			String username = (String) session.getAttribute("name");
			if(username ==null){ //비 로그인
		%> 
		<a href="./login.jsp?from=user.jsp">로그인해서 작품을 올려보세요.</a>
		
		<% }else{ // 로그인 후%>
			<p><%= username %> 작가님</p>
			<a href="processLogout.jsp">로그아웃</a>
			<div>
				<p>내 작품</p>
				<%@ include file="dbconnection.jsp" %>
				<%
					String sql = "SELECT * FROM work WHERE author = '" + username + "'";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
				%>
				<img src="./img/upload/<%= rs.getString("thumbnail") %>">
				<p><%= rs.getString("name") %></p>
				<p><%= rs.getString("introduce") %></p>
				<p><%= rs.getString("author") %></p>
				<a href='viewWork.jsp?number=<%= rs.getString("number") %>'>작품 보러 가기</a>
				<% } %>
				<a href="newWork.jsp">신규 작품 등록</a>
			</div>
		<% } %>
	</div>
	
</div>

</body>
</html>