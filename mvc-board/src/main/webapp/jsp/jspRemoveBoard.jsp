<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));

	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc","root","java1234");
	String sql = "DELETE FROM board WHERE no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
	int row = stmt.executeUpdate();
	
	// 뷰가 없다
	response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp");
%>