<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 프론트쪽에서 보낸 데이터를 읽는다
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String s = name + "님의 핸드폰은 " + hp + "입니다";
	
	// 데이터를 읽어서 프론트로 xml형태로 문자열을 보낸다
%>

<result>
	<%=s %>
</result>