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

	String boardNumber = request.getParameter("boardNumber");

	String sql= "DELETE FROM board WHERE boardNumber=" + boardNumber;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	response.sendRedirect("board.jsp");
	
	
%>
</body>
</html>