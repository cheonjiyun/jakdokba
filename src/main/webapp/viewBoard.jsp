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
String boardTitle = request.getParameter("boardTitle");

String sql = "SELECT * FROM board WHERE boardTitle ='" + boardTitle + "'";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while(rs.next()){
%>
<p><%= rs.getString("boardTitle").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></p>
<p>작성 날짜
<% 
			String boardDate = rs.getString("boardDate");
			boardDate = boardDate.substring(0, 10);
		%>
		<%= boardDate %></p>
<p>글쓴이<%= rs.getString("author") %></p>
<!-- 사진 -->
<% if(rs.getString("boardThumbnail") != null){%> 
<p><img src='./img/upload/<%= rs.getString("boardThumbnail") %>'></p>
<% } %>
<p><%= rs.getString("boardContent").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></p>

<a href="board.jsp">목록</a>
<!-- 작성자라면 수정 삭제 가능-->
<%	
	if(username != null){
	
	if(username.equals(rs.getString("author"))){
%>
	<!--  --> <a href="updateBoard.jsp">수정</a>
	<a href="deleteBoard.jsp?boardNumber=<%= rs.getInt("boardNumber")%>">삭제</a>
<%} }}%>
</div>
</body>
</html>