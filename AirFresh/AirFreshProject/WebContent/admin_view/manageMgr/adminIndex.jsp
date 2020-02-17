<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp" %>

<%
HttpSession adminlogincheck = request.getSession();
ManagerMemberDto managerMem = (ManagerMemberDto)session.getAttribute("managerLogin");
System.out.println(managerMem);
%>




<div class="container">
	<h1 class="mt-4 mb-3" >위치명</h1>
	<div style="
    width: 100%;
    height: 100%;
    text-align: -webkit-center;">
	<div style="
    width: 80%;
    height: 80%;
    display: block;
    text-align: center;">
		<span>초기 페이지 입니다요.</span>
	</div>
	

</div>
		
</div>


			
<%@ include file="./../include/footer.jsp" %>
