<%@page import="ajax.memo.db.MemoDto"%>
<%@page import="ajax.memo.db.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	MemoDao dao = new MemoDao();
	MemoDto dto = new MemoDto();
	
	String num = request.getParameter("num");
	String nick = request.getParameter("nick");
	String content = request.getParameter("content");
	String avata = request.getParameter("avata");
	
	System.out.println(content);
	
	dto.setNum(num);
	dto.setNickname(nick);
	dto.setContent(content);
	dto.setAvata(avata);
	
	dao.memoUpdate(dto);
			
%>