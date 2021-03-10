<?xml version="1.0" encoding="UTF-8"?>
<%@page import="ajax.memo.db.MemoDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ajax.memo.db.MemoDto"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Vector<MemoDto> list = new Vector<MemoDto>();
	MemoDao dao = new MemoDao();
	list = dao.getAllDatas();
	
%>
<list>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	for(int i =0; i<list.size(); i++){ // for(MemoDto dto:list)
		String num = list.get(i).getNum();
		String nick = list.get(i).getNickname();
		String content = list.get(i).getContent();
		String avata = list.get(i).getAvata();
		int likes = list.get(i).getLikes();
		Timestamp writeday = list.get(i).getWriteday();
		
		%>
		<board num="<%=num%>" likes="<%=likes%>">
			<nickname><%=nick %></nickname>
			<content><%=content %></content>
			<avata><%=avata %></avata>
			<writeday><%=sdf.format(writeday) %></writeday>
		</board>
		
		<%
	}
	%>
</list>