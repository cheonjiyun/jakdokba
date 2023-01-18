<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작독바</title>
<link rel="stylesheet" href="css/css.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/js.js"></script>
</head>
<body>
<%@ include file="./top.jsp" %>
<div class="body">
	<%@ include file="dbconnection.jsp" %>
	
	<form class="viewInput" action="processNewEpisode.jsp" name="episode" method="post" enctype="multipart/form-data">
		<%
			String number = request.getParameter("number");
			String sql = "SELECT * FROM work WHERE number = '" + number + "'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		<div class="viewWork">
			<img class="workThumbnail"  src="./img/upload/<%= rs.getString("thumbnail") %>">
			<p class="light title viewWork_title"><%= rs.getString("name") %></p>
			<p class="light author viewWork_author"><%= rs.getString("author") %></p>
			<p class="light genre viewWork_genre">
				<%
					String sqlgenrework = "SELECT * FROM genrework WHERE number = " + number;
					PreparedStatement pstmtgenrework = conn.prepareStatement(sqlgenrework);
					ResultSet genreworkrswork = pstmtgenrework.executeQuery();
					
					while(genreworkrswork.next()){	
						
				%>
				<%= genreworkrswork.getString("genre") %> <% if(genreworkrswork.isLast()){}else{%> / <%} %>
				<% } %>
			<p class="light introduce viewWork_introduce"><%= rs.getString("introduce") %></p>
			<p class="light price viewWork_price"><img src="./img/coin.png">&nbsp;&nbsp;에피소드 당 <%= rs.getInt("price") %> 원</p>
			
		</div>
		<div>
			<p class="medium inputTitle">에피소드 등록</p>
		</div>
		<div>
			<input type="hidden" name="number" value='<%= rs.getString("number") %>'>
		</div>
		<% } %>
		<div>
			<p class="light label">에피소드 제목</p>
			<input class="light input" type="text" name="episodeTitle"/>
		</div>
		<div>
			<p class="light label">에피소드 썸네일</p>
			<input id="fileUpload-input-idepisodeThumbnail" class="fileUpload-input" type="file" name="episodeThumbnail">
			<label class="light fileUpload-label" for="fileUpload-input-idepisodeThumbnail">파일 선택</label>
			<input class="light upload-name" disabled="disabled" placeholder="첨부파일">
		</div>
		<div>
			<p class="light label">에피소드 올리기</p>
			<input id="fileUpload-input-idepisodeImage" class="fileUpload-input" type="file" name="episodeImage">
			<label class="light fileUpload-label" for="fileUpload-input-idepisodeImage">파일 선택</label>
			<input class="light upload-name" disabled="disabled" placeholder="첨부파일">
		</div>
		<div>
			<p class="light label">작가의 말</p>
			<input class="light input" type="text" name="episodeComment"/>
		</div>
		<div>
			<input class="light submit" type="submit" value="등록"/>
		</div>
	</form>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>