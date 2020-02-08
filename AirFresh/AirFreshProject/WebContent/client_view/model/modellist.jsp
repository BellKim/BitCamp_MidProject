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
<link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>
<div class="card mb-3">
<%
	for(int i = 0; i < list.size(); i++){
		
%>

    <h3 class="card-header"><%=list.get(i).getPrd_name()%></h3>
   <a href ="modelDetail.jsp?seq=<%=list.get(i).getPrd_index() %>"><img src="./client_view/model/prd_img/<%=list.get(i).getPrd_model_name()%>.png" width="300"></a>


<%
	}
%>
  </div>
</body>
</html>