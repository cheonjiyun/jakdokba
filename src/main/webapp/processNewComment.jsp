<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
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
</head>
<body>
<%@ include file="dbconnection.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int episodeNumber = Integer.parseInt(request.getParameter("episodeNumber"));
	String comment = request.getParameter("comment");
	String author = (String) session.getAttribute("name");
	String name = request.getParameter("name");

	//날짜
	Date date = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = simpleDateFormat.format(date);
	java.sql.Timestamp commentDate = java.sql.Timestamp.valueOf(formattedDate);
	
	String sqlboard = "INSERT INTO comment(episodeNumber, comment, author, commentDate, commentGood, commentBad) VALUES(?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sqlboard);
	pstmt.setInt(1, episodeNumber);
	pstmt.setString(2, comment);
	pstmt.setString(3, author);
	pstmt.setTimestamp(4, commentDate);
	pstmt.setInt(5, 0);
	pstmt.setInt(6, 0);
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	response.sendRedirect("viewEpisode.jsp?episodeNumber="+episodeNumber+"&name="+name);

%>
</body>
</html>