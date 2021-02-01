<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="oracle.db.OracleConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	OracleConnect db = OracleConnect.getInstance();
 	
 	String sql = "select * from person2";
 	
 	conn = db.getConnection();
 	
 %>
 
 <list>
 <% 
 	try {
 		pstmt = conn.prepareStatement(sql);
 		rs = pstmt.executeQuery();
 		
 		while(rs.next()){
 			String name = rs.getString("name");
 			String blood = rs.getString("blood");
 			int java = rs.getInt("java");
 			int spring = rs.getInt("spring");
 			double height = rs.getDouble("height");
 			String birth = rs.getDate("birthday").toString();
 			
 			%>
 			<person name="<%=name %>">
 				<blood><%=blood %></blood>
 				<score>
 					<java><%=java %></java>
 					<spring><%=spring %></spring>
 				</score>
 				<height><%=height %></height>
 				<birth><%=birth %></birth>
 			</person>
 			
 			<% 
 		}
 		
 	} catch(SQLException e) {
 		e.printStackTrace();
 	} finally{
 		db.dbClose(rs, pstmt, conn);
 	}
 
 
 %>
 
 </list>