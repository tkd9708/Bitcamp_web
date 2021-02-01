<%@page import="ajax.memo.db.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");

	MemoDao dao = new MemoDao();
	dao.memoDelete(num);
%>