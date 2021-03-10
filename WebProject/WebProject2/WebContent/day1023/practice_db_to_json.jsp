<%@page import="java.sql.SQLException"%>
<%@page import="oracle.db.OracleConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	OracleConnect db = OracleConnect.getInstance();
	
	String sql = "select * from person2";
	
	conn = db.getConnection();
	StringBuffer sb = new StringBuffer();
	sb.append("{\"person\":[");
	
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
			
			sb.append("{\"name\":\"" + name + "\",");
			sb.append("\"blood\":\"" + blood + "\",");
			sb.append("\"java\":\"" + java + "\",");
			sb.append("\"spring\":\"" + spring + "\",");
			sb.append("\"height\":\"" + height + "\",");
			sb.append("\"birth\":\"" + birth + "\"},");
		}
		
	} catch(SQLException e){
		e.printStackTrace();
	} finally {
		db.dbClose(rs, pstmt, conn);
	}
	
	sb.deleteCharAt(sb.lastIndexOf(","));
	sb.append("]}");
%>

<%=sb.toString()%>