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
	<form action="processNewWork.jsp" name="work" method="post" enctype="multipart/form-data">
		<div>
			<p>신규 작품 등록</p>
		</div>
		<div>
			<p>작품 제목</p>
			<input type="text" name="name"/>
		</div>
		<div>
			<p>작가 이름</p>
			<% String username = (String) session.getAttribute("name"); %>
			<p><%= username %></p>
		</div>
		<div>
			<p>장르 선택</p>
			<label><input type="checkbox" name="genre" value="로맨스">로맨스</label>
			<label><input type="checkbox" name="genre" value="액션">액션</label>
			<label><input type="checkbox" name="genre" value="일상">일상</label>
			<label><input type="checkbox" name="genre" value="스릴러">스릴러</label>
			<label><input type="checkbox" name="genre" value="판타지">판타지</label>
			<label><input type="checkbox" name="genre" value="스포츠">스포츠</label>
			<label><input type="checkbox" name="genre" value="무협">무협</label>
			<label><input type="checkbox" name="genre" value="사극">사극</label>
			<label><input type="checkbox" name="genre" value="코믹">코믹</label>
			<label><input type="checkbox" name="genre" value="감성">감성</label>
			<label><input type="checkbox" name="genre" value="추리">추리</label>
			<label><input type="checkbox" name="genre" value="드라마">드라마</label>			
		</div>
		<div>
			<p>작품 소개</p>
			<textarea name="introduce"></textarea>
		</div>
		<div>
			<p>작품 썸네일</p>
			<input type="file" name="thumbnail">
		</div>
		<div>
			<p>에피소스당 가격</p>
			<input type="text" name="price"/> 원
		</div>		
		<div>
			<input type="submit" value="등록"/>
		</div>
	</form>
</div>
</body>
</html>