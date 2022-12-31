<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakdokba", "root", "9133");
%>