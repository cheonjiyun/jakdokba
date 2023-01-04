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
<% 
	String recentURI = request.getParameter("from");
	
	int episodeNumber = 0;
	if(request.getParameter("episodeNumber") != null){
		episodeNumber = Integer.parseInt(request.getParameter("episodeNumber"));
	}
	
%>
<div class="body">
	<form class="viewInput" action="processLogin.jsp?from=<%= recentURI %>" name="login" method="post">
		<div>
			<p class="medium inputTitle">로그인</p>
		</div>
		<div>
			<input type="hidden" name="episodeNumber" value='<%= episodeNumber %>'>
		</div>
		<div>
			<p class="light label">아이디</p>
			<input class="light input" type="text" name="id"/>
		</div>
		<div>
			<p class="light label">비밀번호</p>
			<input class="light input" type="password" name="password" />
		</div>
		<div>
			<input class="light submit" type="submit" value="로그인"/>
		</div>
		<div>
			<a class="light submitSide" href="signup.jsp">회원가입</a>
		</div>
	</form>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>