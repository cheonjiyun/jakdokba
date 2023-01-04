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

	int episodeNumber = Integer.parseInt(request.getParameter("episodeNumber"));
	String name = "";
	String author = "";
	int price = 0;
	String episodeTitle = "";
	
	//work information
	String sql = "SELECT * FROM work WHERE number = (SELECT DISTINCT number FROM episode WHERE episodeNumber = " + episodeNumber+ ")";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		name = rs.getString("name");
		author = rs.getString("author");
		price = rs.getInt("price");
	}
	
	//episodeTitle
	sql = "SELECT * FROM episode WHERE episodeNumber = " + episodeNumber;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		episodeTitle = rs.getString("episodeTitle");
	}
	
	if(username == null){
		response.sendRedirect("login.jsp?from=payment.jsp&episodeNumber="+episodeNumber);
	}
	else if(username.equals(author)){
		response.sendRedirect("viewEpisode.jsp?episodeNumber="+episodeNumber+"&name="+name);
	}
	else{
		
	%>
		<p>결제 정보
		<p><%= name %><%= episodeTitle %></p>
		<p><%= price %> 원
		<a href="viewEpisode.jsp?episodeNumber=<%=episodeNumber%>">결제하기</a>

	<% } %>

	
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>