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
	<form action="processSignup.jsp" name="signup" method="post">
		<div>
			<p>회원가입</p>
		</div>
		<div>
			<p>아이디</p>
			<input type="text" name="id"/>
		</div>
		<div>
			<p>비밀번호</p>
			<input type="password" name="password" />
		</div>
		<div>
			<p>비밀번호 확인</p>
			<input type="password" name="passwordCheck" />
		</div>
		<div>
			<p>이메일</p>
			<input type="text" name="email"/>
		</div>
		<div>
			<p>닉네임</p>
			<input type="text" name="name"/>
		</div>
		
		<div>
			<input type="submit" value="회원가입" />
		</div>
		<div>
			<a href="login.jsp">로그인</a>
		</div>
	</form>
</div>
</body>
</html>