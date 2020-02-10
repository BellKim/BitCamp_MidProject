<%@page import="Dto.AsAppDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	List<AsAppDto> list = (List<AsAppDto>)request.getAttribute("list");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
			<tr>
				<td>a/s요청제품</td><td>a/s요청일</td><td>a/s희망일</td><td>제목</td><td></td>
			</tr>
				<% 
					for(int i=0; i<list.size(); i++){
						AsAppDto dto = list.get(i);
			    %>
	
			<tr>
				<td><%=dto.getModel_name() %></td>
				<td><%=dto.getWdate() %></td>
				<td><%=dto.getReq_date() %></td>
				<td><a href="asDetail?seq=<%=dto.getAsSeq() %>"><%=dto.getAsTitle() %></a></td>
			</tr>
	
			<%
				}
			%>
		</table>
</body>
</html>