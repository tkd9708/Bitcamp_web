<?xml version="1.0" encoding="UTF-8"?>
<%@page import="ajax.sawon.db.SawonDao"%>
<%@page import="ajax.sawon.db.SawonDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<list>
<% 
	SawonDao dao = new SawonDao();
	List<SawonDto> list = dao.getSawonList();
	
	for (SawonDto dto: list){
		%>
		<sawon num="<%=dto.getNum()%>">
			<name><%=dto.getName() %></name>
			<driver><%=dto.getDriver() %></driver>
			<gender><%=dto.getGender() %></gender>
			<address><%=dto.getAddress() %></address>
			<birthday><%=dto.getBirthday() %></birthday>
		</sawon>
		<% 
	}
%>
</list>
