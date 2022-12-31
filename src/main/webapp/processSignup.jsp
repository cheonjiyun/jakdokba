<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@ include file="dbconnection.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO member(id, password, email, name) VALUES(?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, email);
	pstmt.setString(4, name);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("login.jsp");
%>
</body>
</html>