<%@page import="ajax.sawon.db.SawonDao"%>
<%@page import="ajax.sawon.db.SawonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글 엔코딩 
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String driver = request.getParameter("driver");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String birthday = request.getParameter("birthday");
	
	SawonDto dto = new SawonDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setDriver(driver);
	dto.setGender(gender);
	dto.setAddress(address);
	dto.setBirthday(birthday);
	
	SawonDao dao = new SawonDao();
	dao.updateSawon(dto);

%>