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

	int episodeNumber = Integer.parseInt(request.getParameter("episodeNumber"));
	String recentURI = request.getParameter("from");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT id, password, name FROM member WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(password.equals(rs.getString("password"))){
			session.setAttribute("name", rs.getString("name"));
			
			pstmt.close();
			conn.close();
			response.sendRedirect(recentURI+"?episodeNumber="+episodeNumber);
		}else{
			pstmt.close();
			conn.close();
			response.sendRedirect("login.jsp?from="+recentURI);
		}
	}
	
	


	
%>
</body>
</html>