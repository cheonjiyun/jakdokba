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

	MultipartRequest multi = new MultipartRequest(request,  request.getServletContext().getRealPath("./img/upload"), 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	int number = Integer.valueOf(multi.getParameter("number"));
	String episodeTitle = multi.getParameter("episodeTitle");
	String episodeComment = multi.getParameter("episodeComment");
	
	Date date = new Date();
	
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = simpleDateFormat.format(date);
	java.sql.Timestamp episodeDate = java.sql.Timestamp.valueOf(formattedDate);
	
	Enumeration files = multi.getFileNames();
	
	PreparedStatement pstmt = null;
	
	String sqlepisode = "INSERT INTO episode(number, episodeTitle, episodeThumbnail, episodeImage, episodeComment, episodeDate) VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sqlepisode);
	pstmt.setInt(1, number);
	pstmt.setString(2, episodeTitle);
	
	//파일
	int i = 0;
	while(files.hasMoreElements()){
		String parameter = (String)files.nextElement();
		String fileName = multi.getFilesystemName(parameter);
		
		if(fileName == null) continue;
		
		if(i > 0){
			pstmt.setString(3, fileName);
		}else{
			pstmt.setString(4, fileName);
		}
		i++;
	}
	
	pstmt.setString(5, episodeComment);
	pstmt.setTimestamp(6, episodeDate);
	pstmt.executeUpdate();

	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("viewWork.jsp?number="+number);
%>
</body>
</html>