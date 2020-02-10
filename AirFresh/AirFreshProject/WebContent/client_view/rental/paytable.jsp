<%@page import="Dto.PurchaseNameDto"%>
<%@page import="Dto.ModelDto"%>
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
	
	//List<PurchaseDto> list = (List<PurchaseDto>) request.getAttribute("list");
	List<PurchaseNameDto> list = (List<PurchaseNameDto>) request.getAttribute("list");
	System.out.println("list 갯수: "+list.size());

%>

<table>
	<tr>
		<td>번호</td><td>구매일</td><td>제품index</td><td>상품명</td><td>[구매취소]</td><td>A/S신청</td>
	</tr>
		<% 
			for(int i=0; i<list.size(); i++)  { 
				PurchaseNameDto pur = list.get(i);
				
		%>
			<tr>
				<td><%= i+1 %></td>
				<td><%= pur.getPur_date() %></td>
				<td><%= pur.getPrd_index() %></td>
				<td><%= pur.getPrd_name() %></td>
				<td><a href="delPur?seq=<%=pur.getPur_index() %>">[구매취소]</a></td>
				<%	
					if(pur.getOrder_auth()==0) {
				
				%>
					<td> <a href="asAppPage?seq=<%= pur.getPur_index()%>&prd_name=<%=pur.getPrd_name() %>">[A/S신청]</a></td>
				<%
					} 
				%>
			</tr>
		<%
			}
		%>
</table>
</body>
</html>