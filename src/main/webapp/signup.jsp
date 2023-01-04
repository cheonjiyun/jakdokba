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
	<form class="viewInput" action="processSignup.jsp" name="signup" method="post">
		<div>
			<p class="medium inputTitle">회원가입</p>
		</div>
		<div>
			<p class="light label">아이디</p>
			<input class="light input"  type="text" name="id"/>
		</div>
		<div>
			<p class="light label">비밀번호</p>
			<input class="light input" type="password" name="password" />
		</div>
		<div>
			<p class="light label">비밀번호 확인</p>
			<input class="light input" type="password" name="passwordCheck" />
		</div>
		<div>
			<p class="light label">이메일</p>
			<input class="light input" type="text" name="email"/>
		</div>
		<div>
			<p class="light label">닉네임</p>
			<input class="light input" type="text" name="name"/>
		</div>
		
		<div>
			<input class="light submit" type="submit" value="회원가입" />
		</div>
		<div>
			<a class="light submitSide" href="login.jsp">로그인</a>
		</div>
	</form>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>