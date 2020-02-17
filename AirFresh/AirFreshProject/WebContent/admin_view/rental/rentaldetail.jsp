<%@page import="Dto.PurchaseDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
%>

<%!
	public String purchaseCancle(int order_auth){
		String str = "";
		if (order_auth == 0){
			str = "렌탈 신청";
		} else if(order_auth ==1){
			str = "렌탈 취소";
		}
		return str;
	}

%>
<%@ include file="./../include/header.jsp"%>
<div class="container-fluid">
	<h1 class="mt-4 mb-3">렌탈 디테일</h1>
	<hr>

</div>

<%@ include file="./../include/footer.jsp"%>