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
	<form class="viewInput" action="processNewWork.jsp" name="work" method="post" enctype="multipart/form-data">
		<div>
			<p class="medium inputTitle">신규 작품 등록</p>
		</div>
		<div>
			<p class="light label">작품 제목</p>
			<input class="light input" type="text" name="name"/>
		</div>
		<div>
			<p class="light label">작가 이름</p>
			<% String username = (String) session.getAttribute("name"); %>
			<p class="light newWork_author"><%= username %></p>
		</div>
		<div class="checkbox_container">
			<p class="light newWork_genre">장르 선택</p>
			<div class="checkbox_inner">
				<input id="gerneCheckbox-id1" class="gerneCheckbox-input" type="checkbox" name="genre" value="로맨스">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id1">로맨스</label>
				<input id="gerneCheckbox-id2" class="gerneCheckbox-input" type="checkbox" name="genre" value="액션">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id2">액션</label>
				<input id="gerneCheckbox-id3" class="gerneCheckbox-input" type="checkbox" name="genre" value="일상">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id3">일상</label>
				<input id="gerneCheckbox-id4" class="gerneCheckbox-input" type="checkbox" name="genre" value="스릴러">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id4">스릴러</label>
				<input id="gerneCheckbox-id5" class="gerneCheckbox-input" type="checkbox" name="genre" value="판타지">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id5">판타지</label>
				<input id="gerneCheckbox-id6" class="gerneCheckbox-input" type="checkbox" name="genre" value="스포츠">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id6">스포츠</label>
				<input id="gerneCheckbox-id7" class="gerneCheckbox-input" type="checkbox" name="genre" value="무협">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id7">무협</label>
				<input id="gerneCheckbox-id8" class="gerneCheckbox-input" type="checkbox" name="genre" value="사극">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id8">사극</label>
				<input id="gerneCheckbox-id9" class="gerneCheckbox-input" type="checkbox" name="genre" value="코믹">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id9">코믹</label>
				<input id="gerneCheckbox-id10" class="gerneCheckbox-input" type="checkbox" name="genre" value="감성">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id10">감성</label>
				<input id="gerneCheckbox-id11" class="gerneCheckbox-input" type="checkbox" name="genre" value="추리">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id11">추리</label>
				<input id="gerneCheckbox-id12" class="gerneCheckbox-input" type="checkbox" name="genre" value="드라마">
					<label class="light genreCheckbox-label" for="gerneCheckbox-id12">드라마</label>
			</div>
		</div>
		<div>
			<p class="light label">작품 소개</p>
			<textarea class="light newWork_introduce" name="introduce" rows="6" cols="10"></textarea>
		</div>
		<div>
			<p class="light label">작품 썸네일</p>
				<input id="fileUpload-input-idThumbnail" class="fileUpload-input" type="file" name="thumbnail">
				<label class="light fileUpload-label" for="fileUpload-input-idThumbnail">파일 선택</label>
				<input class="light upload-name" disabled="disabled" placeholder="첨부파일">
		</div>
		<div>
			<p class="light label">에피소스당 가격 (원)</p>
			<input class="light input" type="text" name="price"/>
		</div>		
		<div>
			<input class="light submit" type="submit" value="등록"/>
		</div>
	</form>
</div>
<%@ include file="./bottom.jsp" %>
</body>
</html>