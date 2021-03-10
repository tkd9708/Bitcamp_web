<%@page import="java.sql.SQLException"%>
<%@page import="oracle.db.OracleConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql = "select * from person2 order by name asc";
	OracleConnect db=OracleConnect.getInstance();
	
	// 오라클 서버 연결
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
			sb.append("\"java\":" + java + ",");
			sb.append("\"spring\":" + spring + ",");
			sb.append("\"height\":" + height + ",");
			sb.append("\"birth\":\"" + birth + "\"},");
		}
	} catch(SQLException e){
		System.out.println("person 오류: " + e.getMessage());	
	}
	
	// 마지막 컴마 지우기
	//sb.setLength(sb.length()-1);
	//sb.replace(sb.length()-1, sb.length(), "");
	sb.deleteCharAt(sb.lastIndexOf(","));
	
	sb.append("]}");
	
%>

<%=sb.toString()%>