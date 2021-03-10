<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajax.memo.db.MemoDto"%>
<%@page import="ajax.memo.db.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");

	//System.out.println("ㅎㅎㅎㅎㅎ");
	MemoDao dao = new MemoDao();
	MemoDto dto = new MemoDto();
	dto = dao.getData(num);

	JSONObject ob = new JSONObject();
	
	ob.put("num", dto.getNum());
	ob.put("nickname", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("avata", dto.getAvata());
	
	//arr.add(ob);
%>

<%=ob.toString()%>