<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="dbconnection.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	MultipartRequest multi = new MultipartRequest(request,  request.getServletContext().getRealPath("./img/upload"), 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	String name = multi.getParameter("name");
	String author = (String) session.getAttribute("name");
	String genre[] = multi.getParameterValues("genre");
	String introduce = multi.getParameter("introduce");
	String priceString = multi.getParameter("price");
	int price = Integer.valueOf(priceString);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String thumbnail = multi.getFilesystemName(fname);
	


	//작품 입력
	String sqlwork = "INSERT INTO work(name, author, introduce, thumbnail, price) VALUES(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sqlwork);
	pstmt.setString(1, name);
	pstmt.setString(2, author);
	pstmt.setString(3, introduce);
	pstmt.setString(4, thumbnail);
	pstmt.setInt(5, price);
	pstmt.executeUpdate();
	
	//number 받기
	String sqlnumber = "SELECT MAX(number) FROM work";
	PreparedStatement pstmtnumber = conn.prepareStatement(sqlnumber);
	ResultSet rsnumber = pstmtnumber.executeQuery();
			
	int number = 0;
	while(rsnumber.next()){
		number = rsnumber.getInt("MAX(number)");
	}
	pstmtnumber.close();
	
	//장르 입력
	String sqlgenre = "INSERT INTO genrework(number, genre) VALUES(?,?)";
	pstmt = conn.prepareStatement(sqlgenre);
	
	for(int i = 0; i < genre.length; i++){
		pstmt.setInt(1, number);
		pstmt.setString(2, genre[i]);
		pstmt.executeUpdate();
	}
	pstmt.close();
	
	pstmt.close();
	conn.close();

	response.sendRedirect("user.jsp");
	
	
%>
</body>
</html>