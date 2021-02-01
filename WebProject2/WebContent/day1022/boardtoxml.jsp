<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	String sql = "select * from ajaxboard";
	
	OracleConnect db = OracleConnect.getInstance();
	conn = db.getConnection();
%>

<list>
<%
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			int num = rs.getInt("num");
			String writer = rs.getString("writer");
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			String photo = rs.getString("photo");
			Timestamp writeday = rs.getTimestamp("writeday");  // date로 하면 제대로된 결과값 안나옴 ******
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:dd");
			String sDay = sdf.format(writeday);
			%>
				<board num="<%=num %>" writer="<%=writer %>">
					<subject><%=subject %></subject>
					<content><%=content %></content>
					<photo><%=photo %></photo>
					<writeday><%=sDay %></writeday>
				</board>
			<% 
		}
	} catch(SQLException e){
		e.printStackTrace();
	}
%>
</list>