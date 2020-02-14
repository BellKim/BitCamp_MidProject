<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
ManagerMemberDto mrgMem = new ManagerMemberDto(6000, 0, "k_admin", null, "왕관리자", 0, 01012341234, 0);
session.setAttribute("mrgLogin", mrgMem);
session.setMaxInactiveInterval(3600);

%>
			
<%@ include file="./include/footer.jsp" %>