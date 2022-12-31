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
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconnection.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	MultipartRequest multi = new MultipartRequest(request,  request.getServletContext().getRealPath("./img/upload"), 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	String boardTitle = multi.getParameter("boardTitle");
	String boardContent = multi.getParameter("boardContent");
	String author = (String) session.getAttribute("name");

	//날짜
	Date date = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = simpleDateFormat.format(date);
	java.sql.Timestamp boardDate = java.sql.Timestamp.valueOf(formattedDate);
	
	//파일
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String thumbnail = multi.getFilesystemName(fname);
	
	String sqlboard = "UPDATE board SET boardThumbnail=?, boardTitle=?, boardContent=?, boardDate=?) WHERE boardNumber=? LIMIT 1";
	PreparedStatement pstmt = conn.prepareStatement(sqlboard);
	pstmt.setString(1, thumbnail);
	pstmt.setString(2, boardTitle);
	pstmt.setString(3, boardContent);
	pstmt.setTimestamp(4, boardDate);
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	response.sendRedirect("board.jsp");
	
	
%>
</body>
</html>