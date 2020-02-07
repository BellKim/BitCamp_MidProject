<%@page import="Dto.ModelDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    List<ModelDto> list = (List<ModelDto>)request.getAttribute("modelList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i = 0; i < list.size(); i++){
		
%>
<a href ="modelDetail.jsp?seq=<%=list.get(i).getPrd_index() %>"><%=list.get(i).getPrd_name() %></a>
<%
	}
%>
</body>
</html>