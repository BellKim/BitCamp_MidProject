<%@page import="java.util.List"%>
<%@page import="Dto.PurchaseDto"%>
<%@page import="Dao.impl.PurchaseDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	MemberDto mem = (MemberDto) session.getAttribute("login");
	
	List<PurchaseDto> list = (List<PurchaseDto>) request.getAttribute("list");
	System.out.println("list 갯수: "+list.size());
%>

<table>
	<tr>
		<td>번호</td><td>제품명</td><td>[구매취소]</td>
	</tr>;
		<% 
			for(int i=0; i<list.size(); i++)  { 
				PurchaseDto pur = list.get(i);
		%>
			<tr>
				<td><%= i+1 %></td>
				<td><%= pur.getPrd_index() %></td>
				<td><a href="delPur?seq=<%=pur.getPur_index() %>">[구매취소]</a></td>
			</tr>
		<%
			}
		%>
</table>
</body>
</html>