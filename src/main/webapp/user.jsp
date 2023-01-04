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
		<%
			request.setCharacterEncoding("utf-8");
			String username = (String) session.getAttribute("name");
			if(username ==null){ //비 로그인
		%> 
		<a class="light user_login" href="./login.jsp?from=user.jsp">로그인해서 작품을 올려보세요.</a>
		<hr class="bar">
		<% }else{ // 로그인 후%>
			<p class="light user_author"><%= username %> 작가님</p>
			<a class="light user_logout" href="processLogout.jsp">로그아웃</a>
			<hr class="bar">
			<div class="works">
				<p class="medium">내 작품</p>
				<%@ include file="dbconnection.jsp" %>
				<%
					int count = 0;
					String recentUpload = ""; 
					String sql = "SELECT * FROM work WHERE author = '" + username + "'";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						//총 몇화
						String sqlcount = "SELECT COUNT(*) FROM episode WHERE number =" + rs.getInt("number");
						PreparedStatement pstmtcount = conn.prepareStatement(sqlcount);
						ResultSet rscount = pstmtcount.executeQuery();
						while(rscount.next()){
							count= rscount.getInt("COUNT(*)");
						}
						//최근 업로드 언제
						String sqldate = "SELECT MAX(episodeDate) FROM episode WHERE number = " + rs.getInt("number");
						PreparedStatement pstmtdate = conn.prepareStatement(sqldate);
						ResultSet rsdate = pstmtdate.executeQuery();
						while(rsdate.next()){
							if(rsdate.getString("MAX(episodeDate)") != null){
								recentUpload = rsdate.getString("MAX(episodeDate)");
								recentUpload = recentUpload.substring(0, 10);	
							}
							else{
								recentUpload = "-";
							}
							
						}
						
				%>
				<div class="work" onclick="location.href='viewWork.jsp?number=<%= rs.getInt("number") %>'">
					<img class="workThumbnail" src="./img/upload/<%= rs.getString("thumbnail") %>">
					<p class="light user_title"><%= rs.getString("name") %></p>
					<p class="light user_count">총 <%= count %>화 업로드</p>
					<p class="light user_date">최근 업로드&nbsp;<%= recentUpload %></p>
				</div>
				<% } %>
				<div class="newWork" onclick="location.href='newWork.jsp'">
					<p class="light newWork_button"><img src="./img/plus_color.png">&nbsp;&nbsp;신규 작품 등록</p>
				</div>
			</div>
		<% } %>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>