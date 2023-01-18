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
<%@ include file="dbconnection.jsp" %>
<div class="body">
	<div>
		<div><p class="medium">토론의 장</p></div>

	</div>
	<div>
	<table class="board">
		<thead>
			<tr class="board_tr">
				<th class="light board_title board_th"> </th>
				<th class="light board_title board_th">제목</th>
				<th class="light board_author board_th">작성자</th>
				<th class="light board_date board_th">작성일</th>
				<th class="light board_viewCounts board_th">조회수</th>
			</tr>
		</thead>
		<tbody class="board_tbody">
		<%
			request.setCharacterEncoding("utf-8");
		
			String sqlboard = "SELECT * FROM board";
			
			PreparedStatement pstmtboard = conn.prepareStatement(sqlboard);
			ResultSet rsboard = pstmtboard.executeQuery();
			
			//페이징 숫자
			int pageNumber = 10;
			if(request.getParameter("pageNumber") != null){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));	
			}
			
			while(rsboard.next()){
				
				if(pageNumber-10 < rsboard.getInt("boardNumber") && rsboard.getInt("boardNumber") <= pageNumber  ){
		%>
			<tr class="board_tr">
				<td class="board_td"><img src="./img/upload/<%= rsboard.getString("boardThumbnail") %>"></td>
				<td class="board_td"><a href='viewBoard.jsp?boardTitle=<%=rsboard.getString("boardTitle")%>'><%= rsboard.getString("boardTitle") %></a></td>
				<td class="board_td"><%= rsboard.getString("author") %></td>
				<td class="board_td"><% 
					String boardDate = rsboard.getString("boardDate");
					boardDate = boardDate.substring(0, 10);
				%><%= boardDate %></td>
				<td class="board_td"><%= rsboard.getString("boardViews") %></td>
			</tr>
		<% }}
			pstmtboard.close();	
			
			String sqlboardcount = "SELECT count(*) FROM board";
			PreparedStatement pstmtboardcount = conn.prepareStatement(sqlboardcount);
			ResultSet rsboardcount = pstmtboardcount.executeQuery();
			
			while(rsboardcount.next()){
			%>
		</tbody>
	</table>
			
	<div class="write_right"><a class="light submit" href="./newBoard.jsp">글쓰기</a></div>
		
	<!-- 페이징 -->
	<% if(pageNumber != 10){ %>
	<a href="board.jsp?pageNumber=<%= pageNumber - 10 %>">이전</a>
	<% }
		if(pageNumber < rsboardcount.getInt("count(*)") ){ %>
	<a href="board.jsp?pageNumber=<%= pageNumber + 10 %>">다음</a>
	<% }
			}
		
		conn.close();
		%>
	</div>
</div>
</body>
</html>